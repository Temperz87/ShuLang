#pragma once

#include <SIRAST.hpp>
#include <stdexcept>
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
            SIRBlock* entry;
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