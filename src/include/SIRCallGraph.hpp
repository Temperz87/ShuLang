#pragma once

#include <SIRAST.hpp>
#include <Graph.hpp>
#include <stdexcept>
#include <vector>

namespace sir {
    // Graph that represents the control flow in a given program
    class CallGraph : public Graph<FunctionDefinitionNode> {
        private:
            FunctionDefinitionNode* main;

        public:
            CallGraph(const std::vector<FunctionDefinitionNode*>& functions) {
                for (FunctionDefinitionNode* function : functions) {
                    if (function->name == "main") {
                        main = function;
                    }

                    for (FunctionDefinitionNode* pred : function->callees) {
                        add_edge(function, pred);
                    }
                }
            }

            // Returns a reference to the main block
            FunctionDefinitionNode* get_main() const {
                if (main == nullptr) {
                    throw std::runtime_error("Main was not found?");
                }

                return main;
            }
    };
}
