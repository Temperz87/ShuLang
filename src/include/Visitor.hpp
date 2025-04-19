#pragma once

#include <ctype.h>
#include <iostream>
#include <string.h>
#include <stack>
#include <string.h>
#include <vector>

class StatementNode;
class PrintNode;
class ValueNode; 
class IntegerNode;
class VariableReferenceNode;
class BindingNode;
class ProgramNode;
class ASTNode;

template <class T>
struct childholder;

class Visitor {
    public:
        virtual ~Visitor();
        Visitor();
        virtual childholder<ASTNode> ingressNode(ASTNode* node, int childcount) = 0;
        virtual ASTNode* egressNode(ASTNode* node, std::vector<ASTNode*> newchildren) = 0;

        ASTNode walk(ASTNode* start);

        virtual childholder<ASTNode> ingressStatementNode(StatementNode* node, int childcount) = 0;
        virtual ASTNode* egressStatementNode(StatementNode* node, std::vector<ASTNode*> newchildren) = 0;

        virtual childholder<ASTNode> ingressPrintNode(PrintNode* node, int childcount) = 0;
        virtual ASTNode* egressPrintNode(PrintNode* node, std::vector<ASTNode*> newchildren) = 0;

        virtual childholder<ASTNode> ingressValueNode(ValueNode* node, int childcount) = 0;
        virtual ASTNode* egressValueNode(ValueNode* node, std::vector<ASTNode*> newchildren) = 0;

        virtual childholder<ASTNode> ingressIntegerNode(IntegerNode* node, int childcount) = 0;
        virtual ASTNode* egressIntegerNode(IntegerNode* node, std::vector<ASTNode*> newchildren) = 0;

        virtual childholder<ASTNode> ingressVariableReferenceNode(VariableReferenceNode* node, int childcount) = 0;
        virtual ASTNode* egressVariableReferenceNode(VariableReferenceNode* node, std::vector<ASTNode*> newchildren) = 0;

        virtual childholder<ASTNode> ingressBindingNode(BindingNode* node, int childcount) = 0;
        virtual ASTNode* egressBindingNode(BindingNode* node, std::vector<ASTNode*> newchildren) = 0;

        virtual childholder<ASTNode> ingressProgramNode(ProgramNode* node, int childcount) = 0;
        virtual ASTNode* egressProgramNode(ProgramNode* node, std::vector<ASTNode*> newchildren) = 0;

    private:
        std::stack<ASTNode*> ingress;
        std::stack<childholder<ASTNode>> egress;

        virtual ASTNode* egress_step(ASTNode* egressed) = 0;
};