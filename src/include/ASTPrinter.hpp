#pragma once

#include "AST.hpp"
#include "ASTVisitor.hpp"
#include <ctype.h>
#include <iostream>
#include <string.h>
#include <stack>
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
        ASTHolder ingressProgramNode(ProgramNode* node, int childcount) override {
            std::cout << "PROGRAM" << std::endl;
            indentation += 1;
            return ASTVisitor::ingressProgramNode(node, childcount);
        }

        ASTNode* egressProgramNode(ProgramNode* node, std::vector<ASTNode*> children) override {
            indentation -= 1;
            return ASTVisitor::egressProgramNode(node, children);
        }

        ASTHolder ingressBindingNode(BindingNode* node, int childcount) override { 
            printIndentation();
            std::cout << "BIND(" << node->name << ", " << node->ty << ") to " << std::endl; 
            indentation += 1;
            return ASTVisitor::ingressBindingNode(node, childcount); 
        }

        ASTNode* egressBindingNode(BindingNode* node, std::vector<ASTNode*> children) override {
            indentation -= 1;
            return ASTVisitor::egressBindingNode(node, children);
        }

        ASTHolder ingressVariableReferenceNode(VariableReferenceNode* node, int childcount) override {
            printIndentation();
            std::cout << "VARIABLE_REFERENCE(" << node->identifier << ")" << std::endl;
            return ASTVisitor::ingressVariableReferenceNode(node, childcount);
        }

        ASTHolder ingressIntegerNode(IntegerNode* node, int childcount) override {
            printIndentation();
            std::cout << "INTEGER(" << node->value << ")" << std::endl;
            return ASTVisitor::ingressIntegerNode(node, childcount);
        }

        ASTHolder ingressPrintNode(PrintNode* node, int childcount) override {
            printIndentation();
            std::cout << "PRINT" << std::endl;
            indentation += 1;
            return ASTVisitor::ingressPrintNode(node, childcount);
        }

        ASTNode* egressPrintNode(PrintNode* node, std::vector<ASTNode*> children) override {
            indentation -= 1;
            return ASTVisitor::egressPrintNode(node, children);
        }
};