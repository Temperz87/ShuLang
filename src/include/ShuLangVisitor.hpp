#pragma once

#include <ShuLangAST.hpp>

using namespace shulang;

class ShuLangVisitor {
    public:
        void descendIntoChildren(ShuLangNode* node);
        virtual void visitNode(ShuLangNode* node);
        virtual void visitNode(StatementNode* node);
        virtual void visitNode(ValueNode* node);
        virtual void visitNode(IntegerNode* node);
        virtual void visitNode(BooleanNode* node);
        virtual void visitNode(VariableReferenceNode* node);
        virtual void visitNode(BindingNode* node);
        virtual void visitNode(OperatorApplicationNode* node);
        virtual void visitNode(NotNode* node);
        virtual void visitNode(BeginNode* node);
        virtual void visitNode(SelectOperatorNode* node);
        virtual void visitNode(CallNode* node);
        virtual void visitNode(BodyNode* node);
        virtual void visitNode(IfNode* node);
        virtual void visitNode(WhileNode* node);
        virtual void visitNode(ProgramNode* node);
};
