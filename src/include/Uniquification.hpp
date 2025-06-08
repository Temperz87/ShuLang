#pragma once

#include <AST.hpp>
#include <ASTVisitor.hpp>
#include <vector>

class Uniquification : public ASTVisitor {
    private:
        int unique_id = 0;

    public: 
        Uniquification();
        ~Uniquification();
        ASTNode* egressBindingNode(BindingNode* node, std::vector<ASTNode*> children) override;
};