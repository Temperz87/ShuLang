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
        virtual childholder<ASTNode> ingressNode(ASTNode node, int childcount) = 0;
        virtual ASTNode egressNode(ASTNode node, std::vector<ASTNode> newchildren) = 0;

        ASTNode walk(ASTNode start);

        virtual childholder<ASTNode> ingressStatementNode(StatementNode node, int childcount) = 0;
        virtual ASTNode egressStatementNode(StatementNode node, std::vector<ASTNode> newchildren) = 0;

        virtual childholder<ASTNode> ingressPrintNode(PrintNode node, int childcount) = 0;
        virtual ASTNode egressPrintNode(PrintNode node, std::vector<ASTNode> newchildren) = 0;

        virtual childholder<ASTNode> ingressValueNode(ValueNode node, int childcount) = 0;
        virtual ASTNode egressValueNode(ValueNode node, std::vector<ASTNode> newchildren) = 0;

        virtual childholder<ASTNode> ingressIntegerNode(IntegerNode node, int childcount) = 0;
        virtual ASTNode egressIntegerNode(IntegerNode node, std::vector<ASTNode> newchildren) = 0;

        virtual childholder<ASTNode> ingressVariableReferenceNode(VariableReferenceNode node, int childcount) = 0;
        virtual ASTNode egressVariableReferenceNode(VariableReferenceNode node, std::vector<ASTNode> newchildren) = 0;

        virtual childholder<ASTNode> ingressBindingNode(BindingNode node, int childcount) = 0;
        virtual ASTNode egressBindingNode(BindingNode node, std::vector<ASTNode> newchildren) = 0;

        virtual childholder<ASTNode> ingressProgramNode(ProgramNode node, int childcount) = 0;
        virtual ASTNode egressProgramNode(ProgramNode node, std::vector<ASTNode> newchildren) = 0;

    private:
        std::stack<ASTNode> ingress;
        std::stack<childholder<ASTNode>> egress;

        virtual ASTNode egress_step(ASTNode egressed);
};

template <class T>
struct childholder {
    T node;
    int waitingfor;
    std::vector<T> children;
};

class ASTNode {
    public:
        ASTNode() { }
        ~ASTNode() { }
        
        // Gets DIRECT children
        virtual std::vector<ASTNode> children() {
            return std::vector<ASTNode>(); // Me when no children
        }

        virtual childholder<ASTNode> ingressVisitor (Visitor* visitor) { return visitor->ingressNode(*this, 0); };
        virtual ASTNode egressVisitor(Visitor* visitor, std::vector<ASTNode> newChildren) { return visitor->egressNode(*this, newChildren); }
};

class StatementNode : public ASTNode { 
    // ingressNode
    childholder<ASTNode> ingressVisitor (Visitor* visitor) override { return visitor->ingressStatementNode(*this, 0); }
    ASTNode egressVisitor(Visitor* visitor, std::vector<ASTNode> newChildren) override { return visitor->egressStatementNode(*this, newChildren); }
};

class PrintNode : public StatementNode {
    public:
        StatementNode to_print;

        PrintNode(StatementNode printable) {
            this->to_print = printable;
        }

        std::vector<ASTNode> children() override {
            std::vector<ASTNode> children = ASTNode::children();
            children.push_back(to_print);
            return children;
        }

        childholder<ASTNode> ingressVisitor (Visitor* visitor) override { return visitor->ingressPrintNode(*this, 1); }
        ASTNode egressVisitor(Visitor* visitor, std::vector<ASTNode> newChildren) override { return visitor->egressPrintNode(*this, newChildren); }
};

// I'm getting jiggy with it I don't know if this is fine
class ValueNode : public StatementNode { 
    childholder<ASTNode> ingressVisitor (Visitor* visitor) override { return visitor->ingressNode(*this, 0); }
    ASTNode egressVisitor(Visitor* visitor, std::vector<ASTNode> newChildren) override { return visitor->egressValueNode(*this, newChildren); }
}; 

class IntegerNode : public ValueNode {
    public:
        int value;

        IntegerNode(int value) {
            this->value = value;
        }

        childholder<ASTNode> ingressVisitor (Visitor* visitor) override { return visitor->ingressNode(*this, 0); }
        ASTNode egressVisitor(Visitor* visitor, std::vector<ASTNode> newChildren) override { return visitor->egressNode(*this, newChildren); }
};

class VariableReferenceNode : public ValueNode {
    public:
        std::string identifier;

        VariableReferenceNode(std::string value) {
            this->identifier = value;
        }

        childholder<ASTNode> ingressVisitor (Visitor* visitor) override { return visitor->ingressNode(*this, 0); }
        ASTNode egressVisitor(Visitor* visitor, std::vector<ASTNode> newChildren) override { return visitor->egressNode(*this, newChildren); }
};

class BindingNode : public StatementNode {
    public:
        std::string name;
        std::string ty;
        ValueNode value;

        std::vector<ASTNode> children() override {
            std::vector<ASTNode> children = ASTNode::children();
            children.push_back(value);
            return children;
        }

        childholder<ASTNode> ingressVisitor (Visitor* visitor) override { return visitor->ingressNode(*this, 1); }
        ASTNode egressVisitor(Visitor* visitor, std::vector<ASTNode> newChildren) override { return visitor->egressNode(*this, newChildren); }
};

class ProgramNode : public ASTNode {
    public:
        std::vector<ASTNode> nodes;

        ProgramNode() {
            this->nodes = std::vector<ASTNode>();
        }

        std::vector<ASTNode> children() override {
            return nodes;
        }

        childholder<ASTNode> ingressVisitor (Visitor* visitor) override { return visitor->ingressNode(*this, nodes.size()); }
        ASTNode egressVisitor(Visitor* visitor, std::vector<ASTNode> newChildren) override { return visitor->egressNode(*this, newChildren); }
};