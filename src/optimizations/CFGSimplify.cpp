#include "SIRCFG.hpp"
#include "SIRVisitor.hpp"
#include <Analysis.hpp>
#include <SIRAST.hpp>
#include <memory>
#include <optional>
#include <vector>

using namespace sir;
using namespace std;

class CFGSimplifyVisitor : public SIRVisitor {
    private:
        const SIRControlFlowGraph& cfg;
        std::shared_ptr<SIRBlock> new_dest = nullptr;
        SIRBlock* current_block;

    public:
        bool did_work = false;

        CFGSimplifyVisitor(const SIRControlFlowGraph& cfg):cfg(cfg) { }

        void visit(DefinitionNode* def) override {
            // Neccesary to visit phi nodes
            def->binding->accept(this);
        }

        void visit(PhiNode* phi) override {
            std::vector<std::pair<SIRBlock*, std::shared_ptr<ValueNode>>> new_candidates;
            for (auto pair : phi->candidates) {
                if (!cfg.get_outgoing(pair.first).contains(current_block)) {
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
            optional<int> cond = KnownConstant::GetIntValue(node->condition.get());
            if (cond.has_value()) {
                did_work = true;
                new_dest = cond.value()? node->destination : node->else_destination;
                std::shared_ptr<SIRBlock> not_going_to = cond.value()? node->else_destination : node->destination;
                not_going_to->predecesors.erase(new_dest);
            }
        }

        void walk(SIRBlock* block) {
            current_block = block;
            vector<shared_ptr<InstructionNode>> instrs;
            for (shared_ptr<InstructionNode> instr : block->instructions) {
                instr->accept(this);
                if (new_dest != nullptr) {
                    shared_ptr<JumpNode> jump = make_shared<JumpNode>(block, new_dest);
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

class CFGMergerVisitor : public SIRVisitor {
    private:
    public:
        bool did_work = false;

};

bool CFGSimplify(ProgramNode& program, const SIRControlFlowGraph& cfg) {
    CFGSimplifyVisitor visitor(cfg);
    vector<shared_ptr<SIRBlock>> reachable_blocks;
    for (std::shared_ptr<SIRBlock> block : program.blocks) {
        if (cfg.unreachable_blocks.contains(block.get())) {
            continue;
        }

        reachable_blocks.push_back(block);
        visitor.walk(block.get());
    }

    program.blocks = std::move(reachable_blocks);
    return visitor.did_work;
}