#include <SIRCFG.hpp>
#include <SIRVisitor.hpp>
#include <Analysis.hpp>
#include <SIRAST.hpp>
#include <deque>
#include <unordered_map>
#include <unordered_set>
#include <vector>

using namespace sir;
using namespace std;

class PhiRedirectVisitor : public SIRVisitor {
    private:
        bool was_phi = false;
        const unordered_map<SIRBlock*, SIRBlock*>& redirect;


    public:
        PhiRedirectVisitor(const unordered_map<SIRBlock*, SIRBlock*>& redirect):redirect(redirect) { }

        void visit(DefinitionNode* node) override {
            node->binding->accept(this);
        }

        void visit(PhiNode* node) override {
            was_phi = true;
            for (auto& pair : node->candidates) {
                SIRBlock* candidate_block = pair.first;
                while (redirect.contains(candidate_block)) {
                    candidate_block = redirect.at(candidate_block);
                    pair.first = candidate_block;
                }
            }
        }

        static void walk(SIRBlock* b, const unordered_map<SIRBlock*, SIRBlock*>& redirect) {
            PhiRedirectVisitor visitor(redirect);
            auto iter = b->instructions.begin();
            do {
                visitor.was_phi = false;
                (*iter)->accept(&visitor);
                std::advance(iter, 1);
            } while (visitor.was_phi);
        }

};

void merge(SIRBlock* big_block, SIRBlock* to_subsume) {
    auto last_instruction = std::prev(big_block->instructions.end());
    big_block->instructions.erase(last_instruction);
    big_block->instructions.insert(last_instruction, to_subsume->instructions.begin(), to_subsume->instructions.end());
}

bool CFGMerge(ProgramNode& program, const SIRControlFlowGraph& cfg) {
    unordered_map<SIRBlock*, SIRBlock*> mergable;
    auto terminals = cfg.get_terminals();
    deque<SIRBlock*> forwards = { cfg.get_main() };
    unordered_set<SIRBlock*> seen = { cfg.get_main() };
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
        
        auto outgoing = cfg.get_outgoing(b);
        if (outgoing.size() != 1) {
            continue;
        }

        // If the destination has only one predecsor
        // and our block has only one succesor
        // THEN we can merge the two blocks together
        SIRBlock* dest = *outgoing.begin();
        if (cfg.get_incoming(dest).size() != 1) {
            continue;
        }

        mergable.insert({dest, b});
    }


    deque<SIRBlock*> backwards(terminals.begin(), terminals.end());
    seen.clear();
    seen.insert(backwards.begin(), backwards.end());
    bool did_work = false;
    while (!backwards.empty()) {
        SIRBlock* subsumable = backwards.front();
        backwards.pop_front();
        for (SIRBlock* incoming : cfg.get_incoming(subsumable)) {
            if (seen.contains(incoming)) {
                continue;
            }

            seen.insert(incoming);
            backwards.push_back(incoming);
        }

        if (mergable.contains(subsumable)) {
            merge(mergable[subsumable], subsumable);
            did_work = true;

            for (auto iter = program.blocks.begin(); iter != program.blocks.end(); std::advance(iter, 1)) {
                if ((*iter).get() == subsumable) {
                    program.blocks.erase(iter);
                    break;
                }
            }
        }
    }

    for (shared_ptr<SIRBlock> b : program.blocks) {
        PhiRedirectVisitor::walk(b.get(), mergable);
    }
    

    return did_work;
}