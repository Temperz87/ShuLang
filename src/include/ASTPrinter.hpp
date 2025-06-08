#pragma once

#include "AST.hpp"
#include "ASTVisitor.hpp"
#include <vector>

class ASTPrinter : public ASTVisitor {
    private:
        int indentation = 0;
        void printIndentation() {
            for (int i = 0; i < this->indentation; i++) {
                std::cout << "  ";
            }
        }

    public: 
        ASTPrinter();
        ~ASTPrinter();
        ASTHolder ingressProgramNode(ProgramNode* node, int childcount) override;
        ASTNode* egressProgramNode(ProgramNode* node, std::vector<ASTNode*> children) override;
        ASTHolder ingressBindingNode(BindingNode* node, int childcount) override;
        ASTNode* egressBindingNode(BindingNode* node, std::vector<ASTNode*> children) override;
        ASTHolder ingressVariableReferenceNode(VariableReferenceNode* node, int childcount) override;
        ASTHolder ingressIntegerNode(IntegerNode* node, int childcount) override;
        ASTHolder ingressPrintNode(PrintNode* node, int childcount) override;
        ASTNode* egressPrintNode(PrintNode* node, std::vector<ASTNode*> children) override;
        ASTHolder ingressOperatorApplicationNode(OperatorApplicationNode* node, int childcount) override;
        ASTNode* egressOperatorApplicationNode(OperatorApplicationNode* node, std::vector<ASTNode*> children) override;
};