#include <SIRCFG.hpp>
#include <SIRVisitor.hpp>
#include <Analysis.hpp>
#include <SIRAST.hpp>
#include <deque>
#include <memory>
#include <unordered_map>
#include <unordered_set>
#include <vector>

using namespace sir;
using namespace std;

class PhiRedirectVisitor : public SIRVisitor {
    private:
        SIRBlock* current_block;
        const unordered_map<SIRBlock*, SIRBlock*>& redirect;
        std::shared_ptr<ValueNode> replace_phi_with = nullptr;

    public:
        bool was_phi = false;
        bool was_replaced = false;
        PhiRedirectVisitor(SIRBlock* current_block, const unordered_map<SIRBlock*, SIRBlock*>& redirect)
            :current_block(current_block), redirect(redirect) { }

        void visit(DefinitionNode* node) override {
            // std::cout << "Visiting def node for " << current_block->name << std::endl;
            node->binding->accept(this);
            if (replace_phi_with != nullptr) {
                node->binding = std::move(replace_phi_with);
            }
        }

        void visit(ReferenceNode* node) override {
            // std::cout << "\tGot referencenode!" << std::endl;
        }

        void visit(PhiNode* node) override {
            was_phi = true;
            if (node->candidates.size() == 1) {
                replace_phi_with = node->candidates.at(0).second;
                was_replaced = true;
                return;
            }

            for (auto& pair : node->candidates) {
                SIRBlock* candidate_block = pair.first;
                while (redirect.contains(candidate_block) && candidate_block != current_block) {
                    candidate_block = redirect.at(candidate_block);
                    pair.first = candidate_block;
                }

                if (candidate_block == current_block) {
                    replace_phi_with = pair.second;
                    was_replaced = true;
                    break;
                }

            }
        }

        static void walk(SIRBlock* b, const unordered_map<SIRBlock*, SIRBlock*>& redirect) {
            PhiRedirectVisitor visitor(b, redirect);
            visitor.current_block = b;
            auto iter = b->instructions.begin();
            do {
                visitor.was_phi = false;
                (*iter)->accept(&visitor);
                std::advance(iter, 1);
            } while (visitor.was_phi && iter != b->instructions.end());
        }

};

void merge(SIRBlock* big_block, SIRBlock* to_subsume, const unordered_set<SIRBlock*>& subsume_next, const unordered_map<SIRBlock*, SIRBlock*>& mergable) {
    // std::cout << "Merging " << to_subsume->name << " into " << big_block->name << std::endl;

    // First, remove final jump
    big_block->instructions.erase(std::prev(big_block->instructions.end()));

    // Add phi nodes to beginning
    // or replace them with concrete values
    PhiRedirectVisitor visitor(big_block, mergable);
    auto it = to_subsume->instructions.begin();
    while (it != to_subsume->instructions.end()) {
        shared_ptr<InstructionNode> instruction = *it;
        instruction->accept(&visitor);
        if (visitor.was_phi) {
            visitor.was_phi = false;
            if (visitor.was_replaced) {
                // Here the phi node was replaced with a value
                // as it used big block as the only live edge
                // hence we place it at the end of the instructions
                big_block->instructions.push_back(instruction);
                visitor.was_replaced = false;
            }
            else {
                big_block->instructions.insert(big_block->instructions.begin(), instruction);
            }
            
            ++it;
        }
        else {
            break;
        }
    }

    // Add rest of instructions to end of block
    if (it != to_subsume->instructions.end()) {
        big_block->instructions.insert(big_block->instructions.end(), it, to_subsume->instructions.end());
    }

    
    // Update predecesors
    for (SIRBlock* next : subsume_next) {
        next->predecesors.erase(to_subsume);
        next->predecesors.insert(big_block);
    }
}

bool CFGMerge(FunctionDefinitionNode* function, const SIRControlFlowGraph& cfg) {
    unordered_map<SIRBlock*, SIRBlock*> mergable;
    auto terminals = cfg.get_terminals();
    deque<SIRBlock*> forwards = { cfg.get_entry() };
    unordered_set<SIRBlock*> seen = { cfg.get_entry() };
    while (!forwards.empty()) {
        SIRBlock* b = forwards.front();
        forwards.pop_front();
        for (SIRBlock* outgoing : cfg.get_outgoing(b)) {
            if (seen.contains(outgoing)) {
                continue;
            }

            seen.insert(outgoing);
            forwards.push_back(outgoing);
        }
        
        // If the destination has only one predecsor
        // and our block has only one succesor
        // THEN we can merge the two blocks together
        auto outgoing = cfg.get_outgoing(b);
        if (outgoing.size() != 1) {
            continue;
        }

        SIRBlock* dest = *outgoing.begin();
        if (dest->predecesors.size() != 1) {
            continue;
        }

        mergable[dest] = b;
    }

    deque<SIRBlock*> backwards(terminals.begin(), terminals.end());
    seen.clear();
    seen.insert(backwards.begin(), backwards.end());
    bool did_work = false;
    while (!backwards.empty()) {
        SIRBlock* subsumable = backwards.front();
        backwards.pop_front();
        for (SIRBlock* incoming : subsumable->predecesors) {
            if (seen.contains(incoming)) {
                continue;
            }

            seen.insert(incoming);
            backwards.push_back(incoming);
        }

        if (mergable.contains(subsumable)) {
            merge(mergable[subsumable], subsumable, cfg.get_outgoing(subsumable), mergable);
            did_work = true;
        }
    }

    vector<shared_ptr<SIRBlock>> unmerged_blocks;
    for (shared_ptr<SIRBlock> block : function->blocks) {
        if (!mergable.contains(block.get())) {
            // std::cout << "not free block " << block->name << std::endl;
            unmerged_blocks.push_back(block);
            std::unordered_set<SIRBlock*> new_predecessors;
            for (SIRBlock* b : block->predecesors) {
                while (mergable.contains(b)) {
                    b = mergable[b];
                }

                new_predecessors.insert(b);
            }

            block->predecesors = std::move(new_predecessors);
        }
    }

    did_work |= function->blocks.size() != unmerged_blocks.size();
    if (did_work) {
        function->blocks = std::move(unmerged_blocks);

        // Have to walk all blocks on more time to make sure we redirected all phi nodes
        for (shared_ptr<SIRBlock> block : function->blocks) {
            PhiRedirectVisitor::walk(block.get(), mergable);
        }
    }

    return did_work;
}