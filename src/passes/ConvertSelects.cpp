#include <SIRVisitor.hpp>
#include <SIRCFG.hpp>
#include <ShuIRAST.hpp>
#include <llvm/IR/Value.h>
#include <memory>
#include <python3.13/methodobject.h>
#include <vector>


using namespace shuir;

class SelectFlatten : SIRVisitor {
    private:
        bool can_flatten = false;
        SelectNode** buffer;

    public:
        void visit(SelectNode* node) override {
            can_flatten = true;
            *buffer = node;
        }

        static bool ExtractSelect(ValueNode* node, SelectNode*& select) {
            SelectFlatten visitor;
            visitor.buffer = &select;
            node->accept(&visitor);
            return visitor.can_flatten;
        }
};

class SelectToIf : SIRVisitor {
    private:
        SIRBlock* block;
        // TODO: MOVE THIS TO A UTILITIES FILE
        std::string gen_name(std::string name) {
            static uint counter = 0;
            return name + "_select." + std::to_string(counter++);
        }

    public:
        void visit(SelectNode* node) override {
            // SelectNode depth isn't capped so recursion isn't viable
            // Hence the loop 
            SelectNode* next;
            std::shared_ptr<SIRBlock> last_true = nullptr;
            std::shared_ptr<SIRBlock> last_false = nullptr;
            while (SelectFlatten::ExtractSelect(node->condition.get(), next)) {
                
            }
        }

        void walk(SIRBlock* block) {
            this->block = block;
            for (std::shared_ptr<InstructionNode> instr : block->instructions) {
                instr->accept(this);
            }
        }
};

void convert_selects(ProgramNode* program) {
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
