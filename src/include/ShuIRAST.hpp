#pragma once

#include <ASTNode.hpp>
#include <string>
#include <vector>

namespace shuir {

    class SIRNode : public ASTNode {
        public:
            // I had this come up in an interview
            // So I'm pulling the yoink and twist on it
            // Thanks unnamed company :3
            virtual std::vector<std::string> get_usages();
    };

    class DefinitionNode : public SIRNode {
        public:
            std::string identifier;
            SIRNode* binding;
            DefinitionNode(std::string identifier, SIRNode* binding);
            std::vector<std::string> get_usages() override;
    };

    class ValueNode : public SIRNode { };

    class ImmediateNode : public ValueNode {
        public:
            int number;
            ImmediateNode(int number);
    };

    class ReferenceNode : public ValueNode {
        public:
            std::string identifier;
            ReferenceNode(std::string identifier);
    };

    class AddNode : public SIRNode {
        public:
            ValueNode* lhs;
            ValueNode* rhs;
            std::vector<std::string> get_usages() override;
    };

    class PrintNode : public SIRNode {
        public:
            ValueNode* to_print;
            PrintNode(ValueNode* to_print);
            std::vector<std::string> get_usages() override;
    };
}