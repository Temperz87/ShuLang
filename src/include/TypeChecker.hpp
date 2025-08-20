#pragma once

#include "ShuLangAST.hpp"
#include "ShuLangVisitor.hpp"
#include <unordered_map>
class TypeChecker : public ShuLangVisitor {
    private:
        std::unordered_map<std::string, std::string> variable_types;
        void assert_same(std::string expected, std::string actual, std::string error_msg);

    public: 
        TypeChecker () { };
        ~TypeChecker() { };

        void onIngressBindingNode(BindingNode* node) override;
        void onEgressBindingNode(BindingNode* node) override;


        void onEgressVariableReferenceNode(VariableReferenceNode* node) override;
        void onEgressOperatorApplicationNode(OperatorApplicationNode* node) override;
        void onEgressNotNode(NotNode* node) override;
        void onEgressBeginNode(BeginNode* node) override;
        void onEgressSelectOperatorNode(SelectOperatorNode* node) override;
        void onEgressIfNode(IfNode* node) override;
};