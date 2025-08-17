#include <SIRVisitor.hpp>
#include <SIRCFG.hpp>
#include <ShuIRAST.hpp>
#include <memory>
#include <vector>


using namespace shuir;

class PhiPromotor : SIRVisitor {
    private:
        std::shared_ptr<PhiNode> promoted_phi = nullptr;
        SIRBlock* block;

        // TODO: MOVE THIS TO A UTILITIES FILE
        std::string gen_name(std::string name) {
            static uint counter = 0;
            return name + "_phi." + std::to_string(counter++);
        }

    public:
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

                    std::shared_ptr<ReferenceNode> ref = std::make_shared<ReferenceNode>(def->identifier, node->width);
                    candidates.push_back({block->name, ref});
                }
            }

            std::shared_ptr<PhiNode> phi = std::make_shared<PhiNode>(candidates, node->width);
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
    std::unordered_set<SIRBlock*> seen;
    SIRControlFlowGraph cfg(blocks);

    std::vector<SIRBlock*> terminals = cfg.get_terminals();
    for (SIRBlock* block : terminals) {
        seen.insert(block);
        queue.push_back(block);
    }

    PhiPromotor promotor;    
    while (!queue.empty()) {
        SIRBlock* curr = queue.front();
        queue.pop_front();
        for (SIRBlock* next : cfg.get_incoming(curr)) {
            if (seen.contains(next))
                continue;
            
            seen.insert(next);
            queue.push_back(next);
        }
        promotor.walk(curr);        
    }
}
