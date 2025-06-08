#include <AST.hpp>
#include <ASTVisitor.hpp>
#include <RemoveComplexOperands.hpp>
#include <vector>

RemoveComplexOperands::RemoveComplexOperands() { };
RemoveComplexOperands::~RemoveComplexOperands() { };
RemoveComplexOperands::ASTHolder RemoveComplexOperands::ingressOperatorApplicationNode(OperatorApplicationNode* node, int childcount) { };
ASTNode* egressOperatorApplicationNode(OperatorApplicationNode* node, std::vector<ASTNode*> children) { };