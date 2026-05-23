#pragma once

#include <memory>
#include <SIRAST.hpp>
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
            std::unordered_set<SIRBlock*> unreachable_blocks;
            SIRControlFlowGraph(const std::vector<SIRBlock*>& blocks) {
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

            void remove_edge(SIRBlock* from, SIRBlock* to) {
                incoming_edges.at(to).erase(from);
                outgoing_edges.at(from).erase(to);
                if (incoming_edges[to].size() == 0) {
                    unreachable_blocks.insert(to);
                    if (outgoing_edges.contains(to)) {
                        std::vector<SIRBlock*> to_delete;
                        std::unordered_set<SIRBlock*> previous = outgoing_edges[to];
                        for (SIRBlock* childTo : previous) {
                            remove_edge(to, childTo);
                        }
                    }
                }
            }

            // Returns all blocks "block" jumps to in the CFG
            std::unordered_set<SIRBlock*> get_outgoing(SIRBlock* block) const {
                if (outgoing_edges.contains(block))
                    return outgoing_edges.at(block);
                return std::unordered_set<SIRBlock*>();
            }

            // Returns all blocks that jump to "block" in the CFG
            std::unordered_set<SIRBlock*> get_incoming(SIRBlock* block) const {
                if (incoming_edges.contains(block))
                    return incoming_edges.at(block);
                return std::unordered_set<SIRBlock*>();
            }

            // Returns a reference to the main block
            SIRBlock* get_main() const {
                return main;
            }

            // Returns a reference to all blocks that jump to exit
            std::vector<SIRBlock*> get_terminals() const {
                return terminal_blocks;
            }
    };
}