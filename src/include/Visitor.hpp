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
class OperatorApplicationNode;
class ASTNode;

template <class T>
struct childholder;


class Visitor {
    public:
        virtual ~Visitor();
        Visitor();
        virtual childholder<ASTNode> ingressNode(ASTNode* node, int childcount) = 0;
        virtual ASTNode* egressNode(ASTNode* node) = 0;

        ASTNode walk(ASTNode* start);

        virtual childholder<ASTNode> ingressStatementNode(StatementNode* node, int childcount) = 0;
        virtual ASTNode* egressStatementNode(StatementNode* node) = 0;

        virtual childholder<ASTNode> ingressPrintNode(PrintNode* node, int childcount) = 0;
        virtual ASTNode* egressPrintNode(PrintNode* node) = 0;

        virtual childholder<ASTNode> ingressValueNode(ValueNode* node, int childcount) = 0;
        virtual ASTNode* egressValueNode(ValueNode* node) = 0;

        virtual childholder<ASTNode> ingressIntegerNode(IntegerNode* node, int childcount) = 0;
        virtual ASTNode* egressIntegerNode(IntegerNode* node) = 0;

        virtual childholder<ASTNode> ingressVariableReferenceNode(VariableReferenceNode* node, int childcount) = 0;
        virtual ASTNode* egressVariableReferenceNode(VariableReferenceNode* node) = 0;

        virtual childholder<ASTNode> ingressBindingNode(BindingNode* node, int childcount) = 0;
        virtual ASTNode* egressBindingNode(BindingNode* node) = 0;

        virtual childholder<ASTNode> ingressOperatorApplicationNode(OperatorApplicationNode* node, int childcount) = 0;
        virtual ASTNode* egressOperatorApplicationNode(OperatorApplicationNode* node) = 0;

        virtual childholder<ASTNode> ingressProgramNode(ProgramNode* node, int childcount) = 0;
        virtual ASTNode* egressProgramNode(ProgramNode* node) = 0;

    private:
        std::stack<ASTNode*> ingress;
        std::stack<childholder<ASTNode>> egress;

        virtual ASTNode* egress_step(ASTNode* egressed) = 0;
};

class ASTNode {
    public:
        ASTNode() { }
        ~ASTNode() { }
        
        // Gets DIRECT children
        virtual std::vector<ASTNode*> children() = 0;

        virtual childholder<ASTNode> ingressVisitor (Visitor* visitor) = 0;
        virtual ASTNode* egressVisitor(Visitor* visitor) = 0;
};
