#include <SIRCFG.hpp>
#include <SIRVisitor.hpp>
#include <Analysis.hpp>
#include <SIRAST.hpp>
#include <memory>
#include <vector>

using namespace sir;
using namespace std;

class CFGSimplifyVisitor : public SIRVisitor {
    private:
        const SIRControlFlowGraph& cfg;
        const SCCPResults& sccp_results;
        std::shared_ptr<SIRBlock> new_dest = nullptr;
        std::shared_ptr<SIRBlock> current_block;

    public:
        bool did_work = false;

        CFGSimplifyVisitor(const SIRControlFlowGraph& cfg, const SCCPResults& sccp_results)
            :cfg(cfg), sccp_results(sccp_results) { }

        void visit(DefinitionNode* def) override {
            // Neccesary to visit phi nodes
            def->binding->accept(this);
        }

        void visit(PhiNode* phi) override {
            std::vector<std::pair<SIRBlock*, std::shared_ptr<ValueNode>>> new_candidates;
            for (auto pair : phi->candidates) {
                if (!sccp_results.reachable_edges.contains(pair.first) || !sccp_results.reachable_edges.at(pair.first).contains(current_block.get())) {
                    // If the edge from the current block to the candidate block doesn't exist
                    // Then we remove the phi candidate by not pushing it into new_candidates
                    did_work = true;
                }
                else {
                    new_candidates.push_back(pair);
                }
            }

            phi->candidates = std::move(new_candidates);
        }

        void visit(JumpIfElseNode* node) override {
            auto reachable = sccp_results.reachable_edges.at(current_block.get());
            if (reachable.size() == 1) {
                did_work = true;
                bool goto_then = (node->destination.get() == *reachable.begin()); 
                new_dest = goto_then? node->destination : node->else_destination;
                std::shared_ptr<SIRBlock> not_going_to = goto_then? node->else_destination : node->destination;
                not_going_to->predecesors.erase(current_block);
            }
        }

        void walk(std::shared_ptr<SIRBlock> block) {
            current_block = block;
            vector<shared_ptr<InstructionNode>> instrs;
            for (shared_ptr<InstructionNode> instr : block->instructions) {
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

bool CFGSimplify(ProgramNode& program, const SIRControlFlowGraph& cfg, const SCCPResults& results) {
    vector<shared_ptr<SIRBlock>> reachable;
    CFGSimplifyVisitor visitor(cfg, results);
    for (shared_ptr<SIRBlock> b : program.blocks) {
        if (results.reachable_blocks.contains(b.get())) {
            reachable.push_back(b);
            visitor.walk(b);
        }
    }

    program.blocks = std::move(reachable);
    return visitor.did_work;
}