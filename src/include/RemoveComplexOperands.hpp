#pragma once

#include "AST.hpp"
#include "ASTVisitor.hpp"
#include <vector>

class RemoveComplexOperands : public ASTVisitor {

    public: 
        RemoveComplexOperands();
        ~RemoveComplexOperands();
        ASTHolder ingressOperatorApplicationNode(OperatorApplicationNode* node, int childcount) override;
        ASTNode* egressOperatorApplicationNode(OperatorApplicationNode* node, std::vector<ASTNode*> children) override;
};