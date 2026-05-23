#include <SIRVisitor.hpp>
#include <SIRCFG.hpp>
#include <SIRAST.hpp>
#include <cstddef>
#include <unordered_map>

#pragma once

class KnownConstant : public sir::SIRVisitor {
    private:
        std::optional<int> lastValue;

    public:
        void visit(sir::ImmediateNode* node) override;
        static std::optional<int> GetIntValue(sir::ValueNode* node);
};

class UseDefInfo {
    private:
        // TODO: Linked list!
        std::unordered_map<sir::DefinitionNode*, std::vector<sir::ReferenceNode*>> usedefs;

    public:
        UseDefInfo(std::unordered_map<sir::DefinitionNode*, std::vector<sir::ReferenceNode*>> defs):usedefs(defs) { }
        bool HasUses(sir::DefinitionNode* node) const;
        size_t UseCount(sir::DefinitionNode* node) const;
};

class UseDefAnalysis : public sir::SIRVisitor {
    private:
        void walk(sir::SIRBlock* block);

    public:
        std::unordered_map<sir::DefinitionNode*, std::vector<sir::ReferenceNode*>> usedefs;
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

std::unordered_map<sir::DefinitionNode*, int> analyze_constants(sir::SIRControlFlowGraph& cfg);
bool CFGSimplify(sir::ProgramNode& program, const sir::SIRControlFlowGraph& cfg);
