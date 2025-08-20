#pragma once

#include <ShuLangAST.hpp>
#include <ShuLangVisitor.hpp>
#include <unordered_map>

class Uniquification : public ShuLangVisitor {
    private:
        int unique_id = 0;
        std::unordered_map<std::string, std::string> map;

    public: 
        Uniquification();
        ~Uniquification();
        void onEgressBindingNode(BindingNode* node) override;
        void onIngressVariableReferenceNode(VariableReferenceNode* node) override;
};