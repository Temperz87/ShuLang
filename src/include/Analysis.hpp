#include <SIRVisitor.hpp>
#include <SIRCallGraph.hpp>
#include <SIRCFG.hpp>
#include <SIRAST.hpp>
#include <cstddef>
#include <IPSCCP.hpp>
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

    class AnalysisManager {
        private:
            std::vector<FunctionDefinitionNode*> functions;
            std::vector<FunctionDefinitionNode*> dirty_functions;
            IPSCCPResults ipsccp_results;
            std::unique_ptr<CallGraph> callgraph = nullptr;
            std::unordered_map<FunctionDefinitionNode*, std::unique_ptr<UseDefInfo>> usedef_infos;
            std::unordered_map<FunctionDefinitionNode*, std::unique_ptr<SIRControlFlowGraph>> cfgs;

        public:
            AnalysisManager(std::vector<FunctionDefinitionNode*> functions)
                : functions(functions), dirty_functions(functions), ipsccp_results(functions) { }

            IPSCCPResults* getIPSCCPResults();
            CallGraph* getCallGraph();
            UseDefInfo* getUseDefChains(FunctionDefinitionNode* node);
            SIRControlFlowGraph* getCFG(FunctionDefinitionNode* node);
            void invalidateFunction(FunctionDefinitionNode* node);
    };
}
