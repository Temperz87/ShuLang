#include <SIRVisitor.hpp>
#include <SIRCallGraph.hpp>
#include <SIRCFG.hpp>
#include <SIRAST.hpp>
#include <cstddef>
#include <unordered_map>
#include <unordered_set>
#include <vector>

#pragma once

namespace sir {
    class KnownConstant : public SIRVisitor {
        private:
            std::optional<int> lastValue;

        public:
            void visit(ImmediateNode* node) override;
            static std::optional<int> GetIntValue(ValueNode* node);
    };

    class UseDefInfo {
        public:
            // TODO: Linked list!
            std::unordered_map<DefinitionNode*, std::vector<InstructionNode*>> usedefs;
            UseDefInfo(std::unordered_map<DefinitionNode*, std::vector<InstructionNode*>> defs):usedefs(defs) { }
            bool HasUses(DefinitionNode* node) const;
            size_t UseCount(DefinitionNode* node) const;
    };

    class UseDefAnalysis : public SIRVisitor {
        private:
            void walk(SIRBlock* block);
            std::unordered_set<DefinitionNode*> uses_found;

        public:
            std::unordered_map<DefinitionNode*, std::vector<InstructionNode*>> usedefs;
            void visit(ReferenceNode* node) override;
            void visit(SelectNode* node) override;
            void visit(AddNode* node) override;
            void visit(SubNode* node) override;
            void visit(MultNode* node) override;
            void visit(CmpNode* node) override;
            void visit(DefinitionNode* node) override;
            void visit(PhiNode* node) override;
            void visit(PrintNode* node) override;
            void visit(JumpIfElseNode* node) override;
            static std::unique_ptr<UseDefInfo> get_use_def_chains(const SIRControlFlowGraph& cfg);
    };

    class SCCPResults {
        public:
            std::unordered_map<DefinitionNode*, int> constants;
            std::unordered_map<SIRBlock*, std::unordered_set<SIRBlock*>> reachable_edges;
            std::unordered_set<SIRBlock*> reachable_blocks;
            SCCPResults(std::unordered_map<DefinitionNode*, int> constants,
                        std::unordered_map<SIRBlock*, std::unordered_set<SIRBlock*>> reachable_edges,
                        std::unordered_set<SIRBlock*> reachable_blocks):constants(constants), reachable_edges(reachable_edges), reachable_blocks(reachable_blocks) { }
    };

    class IPSCCPResults {
    public:
        std::unordered_map<FunctionDefinitionNode*, std::unique_ptr<SCCPResults>> results;

        IPSCCPResults(std::unordered_map<FunctionDefinitionNode*, std::unique_ptr<SCCPResults>> results)
            : results(std::move(results)) {}

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

    class AnalysisManager {
        private:
            std::vector<FunctionDefinitionNode*> functions;
            std::unique_ptr<IPSCCPResults> ipsccp_results = nullptr;
            std::unique_ptr<CallGraph> callgraph = nullptr;
            std::unordered_map<FunctionDefinitionNode*, std::unique_ptr<UseDefInfo>> usedef_infos;
            std::unordered_map<FunctionDefinitionNode*, std::unique_ptr<SIRControlFlowGraph>> cfgs;

        public:
            AnalysisManager(std::vector<FunctionDefinitionNode*> functions): functions(functions) { }

            IPSCCPResults* getIPSCCPResults();
            CallGraph* getCallGraph();
            UseDefInfo* getUseDefChains(FunctionDefinitionNode* node);
            SIRControlFlowGraph* getCFG(FunctionDefinitionNode* node);
            
            void invalidateFunction(FunctionDefinitionNode* node);
    };

    std::unique_ptr<IPSCCPResults> IPSCCP(const CallGraph& cg);
}
