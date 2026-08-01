#pragma once

#include <SIRAST.hpp>
#include <Graph.hpp>
#include <stdexcept>
#include <vector>

namespace sir {
    // Graph that represents the control flow in a given program
    class SIRControlFlowGraph : public Graph<SIRBlock> {
        private:
            SIRBlock* entry;
            std::vector<SIRBlock*> terminal_blocks;

        public:
            SIRControlFlowGraph(const std::vector<SIRBlock*>& blocks) {
                for (SIRBlock* block : blocks) {
                    if (block->name == "entry") {
                        entry = block;
                    }

                    if (block->is_terminal) {
                        terminal_blocks.push_back(block);
                    }

                    for (SIRBlock* pred : block->predecesors) {
                        add_edge(pred, block);
                    }
                }
            }

            // Returns a reference to the entry block
            SIRBlock* get_entry() const {
                if (entry == nullptr) {
                    throw std::runtime_error("Entry was not found?");
                }

                return entry;
            }

            // Returns a reference to all blocks that jump to exit
            std::vector<SIRBlock*> get_terminals() const {
                return terminal_blocks;
            }
    };
}
