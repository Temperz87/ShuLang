#include <Analysis.hpp>
#include <IPSCCP.hpp>
#include <SIRCFG.hpp>
#include <SIRVisitor.hpp>
#include <SIRAST.hpp>
#include <deque>
#include <memory>
#include <unordered_map>
#include <unordered_set>
#include <vector>

using namespace sir;
using namespace std;

class ReachableVisitor : public SIRVisitor {
    public:
        unordered_map<SIRBlock*, unordered_set<SIRBlock*>> reachable_edges;
        unordered_set<shared_ptr<SIRBlock>> reachable_blocks;
        SIRBlock* current_block;

        void visit(JumpNode* node) override {
            reachable_blocks.insert(node->destination);
            reachable_edges[current_block].insert(node->destination.get());
        }

        void visit(JumpIfElseNode* node) override {
            auto constant = KnownConstant::GetIntValue(node->condition.get());
            if (constant.has_value()) {
                shared_ptr<SIRBlock> new_dest = (constant.value() == 1)? node->destination : node->else_destination;
                reachable_blocks.insert(new_dest);
                reachable_edges[current_block].insert({new_dest.get()});
            }
            else {
                reachable_blocks.insert(node->destination);
                reachable_blocks.insert(node->else_destination);
                reachable_edges[current_block].insert(node->destination.get());
                reachable_edges[current_block].insert(node->else_destination.get());
            }
        }
        
        void walk(std::shared_ptr<SIRBlock> entry) {
            deque<SIRBlock*> order({entry.get()});
            unordered_set<SIRBlock*> seen({entry.get()});
            reachable_blocks.insert(entry);
            while (!order.empty()) {
                SIRBlock* block = order.front();
                order.pop_front();
                current_block = block;
                for (shared_ptr<InstructionNode> instr : block->instructions) {
                    instr->accept(this);
                }

                for (SIRBlock* live_outgoing : reachable_edges[block]) {
                    if (seen.contains(live_outgoing))
                        continue;
                    seen.insert(live_outgoing);
                    order.push_back(live_outgoing);
                }
            }
        }
};

class CFGSimplifyVisitor : public SIRVisitor {
    private:
        const std::unordered_map<SIRBlock*, std::unordered_set<SIRBlock*>>& reachable_edges;
        unordered_set<SIRBlock*> reachable_blocks;
        std::shared_ptr<SIRBlock> new_dest = nullptr;
        std::shared_ptr<SIRBlock> current_block = nullptr;

    public:
        bool did_work = false;
        CFGSimplifyVisitor(const std::unordered_map<SIRBlock*, std::unordered_set<SIRBlock*>>& reachable_edges,
                           const unordered_set<shared_ptr<SIRBlock>>& reachable_blocks)
            :reachable_edges(reachable_edges) { 
                for (auto& block : reachable_blocks) {
                    this->reachable_blocks.insert(block.get());
                }
            }

        void visit(DefinitionNode* def) override {
            // Neccesary to visit phi nodes
            def->binding->accept(this);
        }

        void visit(PhiNode* phi) override {
            std::vector<std::pair<SIRBlock*, std::shared_ptr<ValueNode>>> new_candidates;
            for (auto& pair : phi->candidates) {
                if (reachable_edges.contains(pair.first) && 
                    reachable_edges.at(pair.first).contains(current_block.get())) {
                    new_candidates.push_back(pair);
                }
            }

            did_work |= new_candidates.size() != phi->candidates.size();
            phi->candidates = std::move(new_candidates);
        }

        void visit(JumpIfElseNode* node) override {
            if (!reachable_edges.contains(current_block.get()))
                return;

            const auto& reachable = reachable_edges.at(current_block.get());
            if (reachable.size() == 1) {
                did_work = true;
                bool goto_then = (node->destination.get() == *reachable.begin()); 
                new_dest = goto_then? node->destination : node->else_destination;
                auto& not_reachable = goto_then? node->else_destination : node->destination;
                not_reachable->predecesors.erase(current_block.get());
            }
        }

        void walk(std::shared_ptr<SIRBlock> block) {
            // Update predcessors
            current_block = block;
            unordered_set<SIRBlock*> reachable_predecessors;
            for (SIRBlock* block : block->predecesors) {
                if (reachable_blocks.contains(block))
                    reachable_predecessors.insert(block);
            }

            block->predecesors = std::move(reachable_predecessors);


            // Update PhiNodes
            // And try to change JumpIfElseNodes to JumpNodes
            vector<shared_ptr<InstructionNode>> instrs;
            for (auto& instr : block->instructions) {
                instr->accept(this);
                if (new_dest != nullptr) {
                    shared_ptr<JumpNode> jump = make_shared<JumpNode>(block.get(), new_dest);
                    instrs.push_back(jump);
                    new_dest = nullptr;
                }
                else {
                    instrs.push_back(instr);
                }
            }

            block->instructions = std::move(instrs);
        }
};

bool CFGSimplify(FunctionDefinitionNode* function, AnalysisManager& am) {
    // First discover reachable blocks
    shared_ptr<SIRBlock> entry = nullptr;
    for (auto& block : function->blocks) {
        if (block->name == "entry") {
            entry = block;
            break;
        }
    }

    assert(entry != nullptr);
    ReachableVisitor reachable_visitor;
    reachable_visitor.walk(entry);
    
    // Then change JumpIfElse and PhiNodes to match reachability
    CFGSimplifyVisitor visitor(reachable_visitor.reachable_edges, reachable_visitor.reachable_blocks);
    for (auto& block : function->blocks)
        visitor.walk(block);

    bool did_work = visitor.did_work;
    function->blocks = vector(reachable_visitor.reachable_blocks.begin(), 
                               reachable_visitor.reachable_blocks.end());
    if (did_work)
        am.invalidateFunction(function);
    return did_work;
}