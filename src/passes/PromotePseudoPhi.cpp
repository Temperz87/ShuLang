#include <SIRVisitor.hpp>
#include <SIRCFG.hpp>
#include <SIRAST.hpp>
#include <memory>
#include <unordered_set>
#include <vector>


using namespace sir;

class PhiPromotor : SIRVisitor {
    private:
        std::shared_ptr<ValueNode> promoted_phi = nullptr;
        SIRBlock* block;

        // TODO: MOVE THIS TO A UTILITIES FILE
        std::string gen_name(std::string name) {
            static uint counter = 0;
            return name + "_phi." + std::to_string(counter++);
        }

    public:
        std::unordered_set<SIRBlock*> redo_blocks;

        // PhiNodes can only appear in a definition node
        void visit(DefinitionNode* node) override {
            node->binding->accept(this);
            if (promoted_phi != nullptr) {
                node->binding = promoted_phi;
                promoted_phi = nullptr;
            }
        }

        void visit(PseudoPhiNode* node) override {
            std::vector<std::pair<std::string, std::shared_ptr<ValueNode>>> candidates;
            std::string requested = node->requested_previous;

            // For a Phi to work
            // ALL predecesors MUST contain the requested variable 
            for (std::shared_ptr<SIRBlock> block : block->predecesors) {
                if (block->variable_to_ref.contains(requested)) {
                    std::string ref_name = block->variable_to_ref.at(requested);
                    candidates.push_back({block->name, std::make_shared<ReferenceNode>(ref_name, node->width)});
                }
                else {
                    // If the previous block doesn't have the variable
                    // Maybe an ancestor does
                    // So we insert a definition and pseudo phi node
                    std::shared_ptr<PseudoPhiNode> pseudo = std::make_shared<PseudoPhiNode>(requested, node->width);
                    std::shared_ptr<DefinitionNode> def = std::make_shared<DefinitionNode>(gen_name(requested), pseudo);
                    block->instructions.insert(block->instructions.begin(), def);
                    block->variable_to_ref.insert({requested, def->identifier});
                    redo_blocks.insert(block.get());

                    std::shared_ptr<ReferenceNode> ref = std::make_shared<ReferenceNode>(def->identifier, node->width);
                    candidates.push_back({block->name, ref});
                }
            }
            std::shared_ptr<ValueNode> phi;

            if (candidates.size() > 1)
                phi = std::make_shared<PhiNode>(candidates, node->width);
            else
                phi = candidates.at(0).second;
            promoted_phi = phi;
        }

        void walk(SIRBlock* block) {
            this->block = block;
            for (std::shared_ptr<InstructionNode> instr : block->instructions) {
                instr->accept(this);
            }
        }
};

void promote_pseudo_phi(ProgramNode* program) {
    // TODO: There's undefined behavior somewhere...
    // Either here or in select instructions or in SIRBlock's definition
    std::vector<SIRBlock*> blocks;
    for (std::shared_ptr<SIRBlock> block : program->blocks)
        blocks.push_back(block.get());

    std::deque<SIRBlock*> queue;
    std::unordered_set<SIRBlock*> handling;
    SIRControlFlowGraph cfg(blocks);

    std::vector<SIRBlock*> terminals = cfg.get_terminals();
    std::deque<SIRBlock*> backwards;
    for (SIRBlock* block : terminals) {
        backwards.push_back(block);
    }
    while (!backwards.empty()) {
        SIRBlock* curr = backwards.front();
        backwards.pop_front();
        queue.push_back(curr);
        handling.insert(curr);
        for (SIRBlock* block : cfg.get_incoming(curr)) {
            if (!handling.contains(block))
                backwards.push_back(block);
        }
    } 

    // Dataflow esque algorithm
    // Start by pushing all blocks to a queue Q
    //  Do so in backwards order according to the CFG
    // While Q is not empty
    //  Pop a block B from Q
    //  Promote pseudo phi node's in B
    //  If promotion placed a pseudo phi node in another block P
    //    AND P isn't queued in Q
    //      Then enqueue P onto Q

    PhiPromotor promotor;    
    while (!queue.empty()) {
        SIRBlock* curr = queue.front();
        queue.pop_front();
        handling.erase(curr);
        promotor.walk(curr);
        for (SIRBlock* block : promotor.redo_blocks) {
            if (!handling.contains(block)) {
                queue.push_back(block);
                handling.insert(block);
            }
        }
        promotor.redo_blocks.clear();
    }
}
