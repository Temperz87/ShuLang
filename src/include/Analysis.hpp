#include <SIRVisitor.hpp>
#include <SIRCFG.hpp>
#include <SIRAST.hpp>
#include <cstddef>
#include <unordered_map>
#include <unordered_set>
#include <vector>

#pragma once


class KnownConstant : public sir::SIRVisitor {
    private:
        std::optional<int> lastValue;

    public:
        void visit(sir::ImmediateNode* node) override;
        static std::optional<int> GetIntValue(sir::ValueNode* node);
};

class UseDefInfo {
    public:
        // TODO: Linked list!
        std::unordered_map<sir::DefinitionNode*, std::vector<sir::InstructionNode*>> usedefs;
        UseDefInfo(std::unordered_map<sir::DefinitionNode*, std::vector<sir::InstructionNode*>> defs):usedefs(defs) { }
        bool HasUses(sir::DefinitionNode* node) const;
        size_t UseCount(sir::DefinitionNode* node) const;
};

class UseDefAnalysis : public sir::SIRVisitor {
    private:
        void walk(sir::SIRBlock* block);
        std::unordered_set<sir::DefinitionNode*> uses_found;

    public:
        std::unordered_map<sir::DefinitionNode*, std::vector<sir::InstructionNode*>> usedefs;
        void visit(sir::ReferenceNode* node) override;
        void visit(sir::SelectNode* node) override;
        void visit(sir::AddNode* node) override;
        void visit(sir::SubNode* node) override;
        void visit(sir::MultNode* node) override;
        void visit(sir::CmpNode* node) override;
        void visit(sir::DefinitionNode* node) override;
        void visit(sir::PhiNode* node) override;
        void visit(sir::PrintNode* node) override;
        void visit(sir::JumpIfElseNode* node) override;
        static UseDefInfo get_use_def_chains(const sir::SIRControlFlowGraph& cfg);
};

class SCCPResults {
    public:
        std::unordered_map<sir::DefinitionNode*, int> constants;
        std::unordered_map<sir::SIRBlock*, std::unordered_set<sir::SIRBlock*>> reachable_edges;
        std::unordered_set<sir::SIRBlock*> reachable_blocks;

        SCCPResults(std::unordered_map<sir::DefinitionNode*, int> constants,
                    std::unordered_map<sir::SIRBlock*, std::unordered_set<sir::SIRBlock*>> reachable_edges,
                    std::unordered_set<sir::SIRBlock*> reachable_blocks):constants(constants), reachable_edges(reachable_edges), reachable_blocks(reachable_blocks) { }

};

SCCPResults SIRSCCP(const sir::SIRControlFlowGraph& cfg, UseDefInfo& usedefs);
bool CFGSimplify(sir::ProgramNode& program, const sir::SIRControlFlowGraph& cfg);
