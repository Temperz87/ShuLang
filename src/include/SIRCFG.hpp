#pragma once

#include <memory>
#include <ShuIRAST.hpp>
#include <unordered_map>
#include <unordered_set>
#include <vector>

namespace sir {
    // Graph that represents the control flow in a given program
    // Currently a DAG but set to change when loops are implemented
    class SIRControlFlowGraph {
        private:
            std::unordered_map<SIRBlock*, std::unordered_set<SIRBlock*>> outgoing_edges;
            std::unordered_map<SIRBlock*, std::unordered_set<SIRBlock*>> incoming_edges;
            SIRBlock* main;
            std::vector<SIRBlock*> terminal_blocks;

            // Adds both incoming and outgoing edges
            // To the respective maps
            void add_edge(SIRBlock* from, SIRBlock* to) {
                if (outgoing_edges.contains(from))
                    outgoing_edges.at(from).insert(to);
                else 
                    outgoing_edges.insert({from, std::unordered_set<SIRBlock*>({to})});

                if (incoming_edges.contains(to))
                    incoming_edges.at(to).insert(from);
                else
                    incoming_edges.insert({to, std::unordered_set<SIRBlock*>({from})});
            }

        public:
            SIRControlFlowGraph(std::vector<SIRBlock*> blocks) {
                for (SIRBlock* block : blocks) {
                    if (block->name == "main") {
                        main = block;
                    }

                    if (block->is_terminal) {
                        terminal_blocks.push_back(block);
                    }

                    for (std::shared_ptr<SIRBlock> pred : block->predecesors) {
                        add_edge(pred.get(), block);
                    }
                }
            }

            // Returns all blocks "block" jumps to in the CFG
            std::unordered_set<SIRBlock*> get_outgoing(SIRBlock* block) {
                if (outgoing_edges.contains(block))
                    return outgoing_edges.at(block);
                return std::unordered_set<SIRBlock*>();
            }

            // Returns all blocks that jump to "block" in the CFG
            std::unordered_set<SIRBlock*> get_incoming(SIRBlock* block) {
                if (incoming_edges.contains(block))
                    return incoming_edges.at(block);
                return std::unordered_set<SIRBlock*>();
            }

            // Returns a reference to the main block
            SIRBlock* get_main() {
                return main;
            }

            // Returns a reference to all blocks that jump to exit
            std::vector<SIRBlock*> get_terminals() {
                return terminal_blocks;
            }
    };
}