#include <SIRCFG.hpp>
#include <SIRVisitor.hpp>
#include <ShuIRAST.hpp>
#include <memory>


using namespace sir;

void SIRVisitor::walk() {
    SIRControlFlowGraph cfg(blocks);

    if (direction == FORWARD) {
        queue.push_back(cfg.get_main());
        while (!queue.empty()) {
            SIRBlock* curr = queue.front();
            queue.pop_front();
            for (SIRBlock* next : cfg.get_outgoing(curr)) {
                queue.push_back(next);
            }
            for (std::shared_ptr<InstructionNode> instr : curr->instructions) {
                instr->accept(this);
            }
        }
    }
    else {
        std::vector<SIRBlock*> terminals = cfg.get_terminals();
        for (SIRBlock* block : terminals) {
            queue.push_back(block);
        }
        
        while (!queue.empty()) {
            SIRBlock* curr = queue.front();
            for (SIRBlock* next : cfg.get_incoming(curr)) {
                queue.push_back(next);
            }

            for (std::shared_ptr<InstructionNode> instr : curr->instructions) {
                instr->accept(this);
            }
        }
    }
}
