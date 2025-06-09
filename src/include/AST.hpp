#pragma once

#include <vector>
#include <Visitor.hpp>

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
struct childholder {
    T* node;
    int waitingfor;
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

class StatementNode : public ASTNode { 
    std::vector<ASTNode*> children() override {
        return std::vector<ASTNode*>();
    }

    childholder<ASTNode> ingressVisitor (Visitor* visitor) override { return visitor->ingressStatementNode(this, 0); }
    ASTNode* egressVisitor(Visitor* visitor) override { return visitor->egressStatementNode(this); }
};

class PrintNode : public StatementNode {
    public:
        StatementNode* to_print;

        PrintNode(StatementNode* printable) {
            this->to_print = printable;
        }

        std::vector<ASTNode*> children() override {
            std::vector<ASTNode*> children;
            children.push_back(to_print);
            return children;
        }

        childholder<ASTNode> ingressVisitor (Visitor* visitor) override { return visitor->ingressPrintNode(this, 1); }
        ASTNode* egressVisitor(Visitor* visitor) override { return visitor->egressPrintNode(this); }
};

// I'm getting jiggy with it I don't know if this is fine
class ValueNode : public StatementNode { 
    childholder<ASTNode> ingressVisitor (Visitor* visitor) override { return visitor->ingressValueNode(this, 0); }
    ASTNode* egressVisitor(Visitor* visitor) override { return visitor->egressValueNode(this); }
}; 

class IntegerNode : public ValueNode {
    public:
        int value;

        std::vector<ASTNode*> children() override {
            return std::vector<ASTNode*>();
        }


        IntegerNode(int value) {
            this->value = value;
        }

        childholder<ASTNode> ingressVisitor (Visitor* visitor) override { return visitor->ingressIntegerNode(this, 0); }
        ASTNode* egressVisitor(Visitor* visitor) override { return visitor->egressIntegerNode(this); }
};

class VariableReferenceNode : public ValueNode {
    public:
        std::string identifier;

        std::vector<ASTNode*> children() override {
            return std::vector<ASTNode*>();
        }

        VariableReferenceNode(std::string value) {
            this->identifier = value;
        }

        childholder<ASTNode> ingressVisitor (Visitor* visitor) override { return visitor->ingressVariableReferenceNode(this, 0); }
        ASTNode* egressVisitor(Visitor* visitor) override { return visitor->egressVariableReferenceNode(this); }
};

class BindingNode : public StatementNode {
    public:
        std::string name;
        std::string ty;
        ValueNode* value;

        std::vector<ASTNode*> children() override {
            std::vector<ASTNode*> children;
            children.push_back(value);
            return children;
        }

        childholder<ASTNode> ingressVisitor (Visitor* visitor) override { return visitor->ingressBindingNode(this, 1); }
        ASTNode* egressVisitor(Visitor* visitor) override { return visitor->egressBindingNode(this); }
};

class OperatorApplicationNode : public ValueNode {
    public:
        std::string op;
        StatementNode* lhs;
        StatementNode* rhs;

        std::vector<ASTNode*> children() override {
            std::vector<ASTNode*> children;
            children.push_back(lhs);
            children.push_back(rhs);
            return children;
        }

        childholder<ASTNode> ingressVisitor (Visitor* visitor) override { return visitor->ingressOperatorApplicationNode(this, 2); }
        ASTNode* egressVisitor(Visitor* visitor) override { return visitor->egressOperatorApplicationNode(this); }
};

class ProgramNode : public ASTNode {
    public:
        std::vector<ASTNode*> nodes;

        ProgramNode() {
            this->nodes = std::vector<ASTNode*>();
        }

        std::vector<ASTNode*> children() override {
            std::vector<ASTNode*> reversed;
            for (int i = nodes.size() - 1; i >= 0; i--)
                reversed.push_back(nodes.at(i));
            return reversed;
        }

        childholder<ASTNode> ingressVisitor (Visitor* visitor) override { return visitor->ingressProgramNode(this, nodes.size()); }
        ASTNode* egressVisitor(Visitor* visitor) override { return visitor->egressProgramNode(this); }
};