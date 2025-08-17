#pragma once

#include <deque>
#include <memory>
#include <vector>

namespace shuir {
    class SIRNode;
    class ImmediateNode;
    class ReferenceNode;
    class AddNode;
    class SubNode;
    class MultNode;
    class CmpNode;
    class DefinitionNode;
    class PseudoPhiNode;
    class PhiNode;
    class PrintNode;
    class JumpNode;
    class JumpIfElseNode;
    class ExitNode;
    class ProgramNode;
    class SIRBlock;
    class SIRControlFlowGraph;

    class SIRVisitor {
        private:

        public:
            virtual void visit(ImmediateNode* node) {}
            virtual void visit(ReferenceNode* node) {}
            virtual void visit(AddNode* node) {}
            virtual void visit(SubNode* node) {}
            virtual void visit(MultNode* node) {}
            virtual void visit(CmpNode* node) {}
            virtual void visit(DefinitionNode* node) {}
            virtual void visit(PseudoPhiNode* node) {}
            virtual void visit(PhiNode* node) {}
            virtual void visit(PrintNode* node) {}
            virtual void visit(JumpNode* node) {}
            virtual void visit(JumpIfElseNode* node) {}
            virtual void visit(ExitNode* node) {}
            virtual void visit(ProgramNode* node) {}
    };
}