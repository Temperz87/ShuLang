#include <deque>
#include <memory>
#include <SIRVisitor.hpp>
#include <SIRCallGraph.hpp>
#include <SIRCFG.hpp>
#include <SIRAST.hpp>
#include <stdexcept>
#include <unordered_map>
#include <unordered_set>
#include <vector>

#pragma once

namespace sir {
    class AnalysisManager;

    // TODO: This is NOT the place for this
    enum LatticeType {
        BOTTOM,
        CONSTANT,
        TOP
    };

    // TODO
    //  When values can be things other than integers
    //  Change this analysis accordingly!!!
    struct ConstantLattice {
        LatticeType type;
        int value;

        ConstantLattice() {
            type = BOTTOM;
            value = 0;
        }

        ConstantLattice(LatticeType type, int value):type(type), value(value) { }
        auto operator<=>(const ConstantLattice&) const = default;
    };

    struct FunctionSummary {
        std::vector<ConstantLattice> parameter_values;
        ConstantLattice return_value;
    };

    class SCCPResults {
        public:
            std::unordered_map<DefinitionNode*, int> constants;
            std::unordered_map<SIRBlock*, std::unordered_set<SIRBlock*>> reachable_edges;
            std::unordered_set<SIRBlock*> reachable_blocks;
    };

    class IPSCCPResults {
        public:
            std::unordered_map<FunctionDefinitionNode*, std::unique_ptr<SCCPResults>> results;
            std::unordered_map<FunctionDefinitionNode*, FunctionSummary> summaries;

            IPSCCPResults(std::vector<FunctionDefinitionNode*> functions) {
                for (FunctionDefinitionNode* function : functions) {
                        results[function] = nullptr;
                        std::vector<ConstantLattice> parameters(function->parameters.size(), {BOTTOM, 0});
                        summaries[function] = {std::move(parameters), {BOTTOM, 0}};
                }
            }

            ~IPSCCPResults() = default;
        
            // Copy constructor
            IPSCCPResults(const IPSCCPResults& other) {
                for (const auto& [function, result] : other.results) {
                    results[function] = result ? std::make_unique<SCCPResults>(*result) : nullptr;
                }
            }

            // Copy assignment
            IPSCCPResults& operator=(const IPSCCPResults& other) {
                if (this != &other) {
                    results.clear();
                    for (const auto& [function, result] : other.results)
                        results[function] = result ? std::make_unique<SCCPResults>(*result) : nullptr;
                }

                return *this;
            }

            // Move constructor
            IPSCCPResults(IPSCCPResults&& other) noexcept: results(std::move(other.results)) {}

            // Move assignment
            IPSCCPResults& operator=(IPSCCPResults&& other) noexcept {
                if (this != &other)
                    results = std::move(other.results);
                return *this;
            }
    };

    void IPSCCP(AnalysisManager& am, 
                const std::vector<FunctionDefinitionNode*>& dirty_functions, 
                IPSCCPResults& results);
}