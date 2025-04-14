#pragma once

#include <ctype.h>
#include <iostream>
#include <string.h>
#include "tokenizer.hpp"
#include <vector>

class ASTNode {
    
};

class StatementNode : public ASTNode { };

class PrintNode : public StatementNode {
    public:
        StatementNode to_print;

        PrintNode(StatementNode printable) {
            this->to_print = printable;
        }
};

class ValueNode : public StatementNode { }; // I'm getting jiggy with it I don't know if this is fine

class IntegerNode : public ValueNode {
    public:
        int value;

        IntegerNode(int value) {
            this->value = value;
        }
};

class VariableReferenceNode : public ValueNode {
    public:
        std::string identifier;

        VariableReferenceNode(std::string value) {
            this->identifier = value;
        }
};

class BindingNode : public StatementNode {
    public:
        std::string name;
        std::string ty;
        ValueNode value;
};

class ProgramNode : public ASTNode {
    public:
        std::vector<ASTNode> nodes;

        ProgramNode() {
            this->nodes = std::vector<ASTNode>();
        }
};
