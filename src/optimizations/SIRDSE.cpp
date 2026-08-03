#include <deque>
#include <SIRCFG.hpp>
#include <Analysis.hpp>
#include <SIRAST.hpp>
#include <memory>

using namespace sir;
using namespace std;

class DSEVisitor : public SIRVisitor {
    private:
        bool can_remove = false;
        const UseDefInfo& usedefs;
    public:
        bool did_work = false;

        DSEVisitor(const UseDefInfo& usedefs):usedefs(usedefs) { }

        void visit(DefinitionNode* node) override {
            // KnownConstant tries to see if somethings not an integer
            //  in SIR right now this can only be a function
            // we can't get rid of functions do to potentially changing behavior
            //  (e.g. program diverges cuz a while true in a function call vs not)
            bool stateful = !KnownConstant::GetIntValue(node->binding.get()).has_value();
            can_remove = !(stateful || usedefs.HasUses(node));
        }
        
        void walk(SIRBlock* block) {
            vector<shared_ptr<InstructionNode>> new_nodes;
            new_nodes.reserve(block->instructions.size());

            // Explore instructions backwards 
            for (int i = block->instructions.size() - 1; i >= 0; i--) {
                std::shared_ptr<InstructionNode> instr = block->instructions[i];
                instr->accept(this);
                if (!can_remove) {
                    new_nodes.push_back(instr);
                }
                else {
                    can_remove = false;
                    did_work = true;
                }
            }

            // Pop backwards onto new instructions
            std::reverse(new_nodes.begin(), new_nodes.end());
            block->instructions = std::move(new_nodes);
        }
};

bool SIRDSE(FunctionDefinitionNode* function, AnalysisManager& am) {
    // Walk CFG backwards
    // Removes need for fixpoint iteration
    DSEVisitor visitor(*am.getUseDefChains(function));
    unordered_set<SIRBlock*> handled;
    deque<SIRBlock*> next;
    SIRControlFlowGraph* cfg = am.getCFG(function);
    for (SIRBlock* block : cfg->get_terminals()) {
        handled.insert(block);
        next.push_back(block);
    }

    while (!next.empty()) {
        SIRBlock* incoming = next.front();
        next.pop_front();
        visitor.walk(incoming);
        for (SIRBlock* new_block : cfg->get_incoming(incoming)) {
            if (handled.contains(new_block)) {
                continue;
            }

            handled.insert(new_block);
            next.push_back(new_block);
        }
    }

    if (visitor.did_work) {
        am.invalidateFunction(function);
    }

    return visitor.did_work;
}
