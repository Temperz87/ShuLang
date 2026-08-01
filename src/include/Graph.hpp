#pragma once

#include <SIRAST.hpp>
#include <unordered_map>
#include <unordered_set>

// Class for representing directed graphs
template <typename ElementType>
class Graph {
    protected:
        std::unordered_map<ElementType*, std::unordered_set<ElementType*>> outgoing_edges;
        std::unordered_map<ElementType*, std::unordered_set<ElementType*>> incoming_edges;

        // Adds both incoming and outgoing edges
        // To the respective maps
        void add_edge(ElementType* from, ElementType* to) {
            if (outgoing_edges.contains(from))
                outgoing_edges.at(from).insert(to);
            else 
                outgoing_edges.insert({from, std::unordered_set<ElementType*>({to})});

            if (incoming_edges.contains(to))
                incoming_edges.at(to).insert(from);
            else
                incoming_edges.insert({to, std::unordered_set<ElementType*>({from})});
        }

    public:
        // Returns all blocks elements that jump to lead to an element in the graph
        std::unordered_set<ElementType*> get_outgoing(ElementType* element) const {
            if (outgoing_edges.contains(element))
                return outgoing_edges.at(element);

            return std::unordered_set<ElementType*>();
        }

        // Returns all blocks that lead to an element in the CFG
        std::unordered_set<ElementType*> get_incoming(ElementType* element) const {
            if (incoming_edges.contains(element))
                return incoming_edges.at(element);

            return std::unordered_set<ElementType*>();
        }
};
