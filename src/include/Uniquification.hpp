#pragma once

#include <ShuLangAST.hpp>
#include <ShuLangVisitor.hpp>
#include <unordered_map>
#include <vector>

class Uniquification : public ShuLangVisitor {
    private:
        int unique_id = 0;
        std::unordered_map<std::string, std::string> map;

    public: 
        Uniquification();
        ~Uniquification();
        ShuLangNode* egressBindingNode(BindingNode* node) override;
        ASTHolder ingressVariableReferenceNode(VariableReferenceNode* node, int childcount) override;
};