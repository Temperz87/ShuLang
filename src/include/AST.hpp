#pragma once

#include "ASTVisitor.hpp"
#include <ctype.h>
#include <iostream>
#include <string.h>
#include <vector>

class ASTNode {
    public:
    // Gets DIRECT children
     virtual std::vector<ASTNode> children() {
        return std::vector<ASTNode>(); // Me when no children
     }

     virtual ASTHolder ingressVisitor(ASTVisitor* visitor) { return visitor->ingressNode(*this); }
     virtual ASTNode egressVisitor(ASTVisitor* visitor, std::vector<ASTNode> newChildren) { return visitor->egressNode(*this); }
     
};

class StatementNode : public ASTNode { 
    ASTHolder ingressVisitor (ASTVisitor* visitor) override { return visitor->ingressStatementNode(*this); }
    ASTNode egressVisitor(ASTVisitor* visitor, std::vector<ASTNode> newChildren) override { return visitor->egressStatementNode(*this); }
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

        ASTHolder ingressVisitor (ASTVisitor* visitor) override { return visitor->ingressPrintNode(*this); }
        ASTNode egressVisitor(ASTVisitor* visitor, std::vector<ASTNode> newChildren) override { return visitor->egressPrintNode(*this); }
};

// I'm getting jiggy with it I don't know if this is fine
class ValueNode : public StatementNode { 
    ASTHolder ingressVisitor (ASTVisitor* visitor) override { return visitor->ingressValueNode(*this); }
    ASTNode egressVisitor(ASTVisitor* visitor, std::vector<ASTNode> newChildren) override { return visitor->egressValueNode(*this); }
}; 

class IntegerNode : public ValueNode {
    public:
        int value;

        IntegerNode(int value) {
            this->value = value;
        }

        ASTHolder ingressVisitor (ASTVisitor* visitor) override { return visitor->ingressIntegerNode(*this); }
        ASTNode egressVisitor(ASTVisitor* visitor, std::vector<ASTNode> newChildren) override { return visitor->egressIntegerNode(*this); }
};

class VariableReferenceNode : public ValueNode {
    public:
        std::string identifier;

        VariableReferenceNode(std::string value) {
            this->identifier = value;
        }

        ASTHolder ingressVisitor (ASTVisitor* visitor) override { return visitor->ingressVariableReferenceNode(*this); }
        ASTNode egressVisitor(ASTVisitor* visitor, std::vector<ASTNode> newChildren) override { return visitor->egressVariableReferenceNode(*this); }
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

        ASTHolder ingressVisitor (ASTVisitor* visitor) override { return visitor->ingressBindingNode(*this); }
        ASTNode egressVisitor(ASTVisitor* visitor, std::vector<ASTNode> newChildren) override { return visitor->egressBindingNode(*this); }
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

        ASTHolder ingressVisitor (ASTVisitor* visitor) override { return visitor->ingressProgramNode(*this); }
        ASTNode egressVisitor(ASTVisitor* visitor, std::vector<ASTNode> newChildren) override { return visitor->egressProgramNode(*this); }
};
