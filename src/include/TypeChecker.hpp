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

        ASTHolder ingressBindingNode(BindingNode* node, int childcount) override;
        ShuLangNode* egressBindingNode(BindingNode* node) override;


        ShuLangNode* egressVariableReferenceNode(VariableReferenceNode* node) override;
        ShuLangNode* egressOperatorApplicationNode(OperatorApplicationNode* node) override;
        ShuLangNode* egressNotNode(NotNode* node) override;
        ShuLangNode* egressSelectOperatorNode(SelectOperatorNode* node) override;
        ShuLangNode* egressIfNode(IfNode* node) override;
};