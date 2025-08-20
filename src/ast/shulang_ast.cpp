#include <ASTNode.hpp>
#include <ShuLangVisitor.hpp>
#include <ShuLangAST.hpp>
#include <iostream>
#include <memory>
#include <vector>

using namespace shulang;

std::vector<std::shared_ptr<ShuLangNode>> StatementNode::children() {
  return std::vector<std::shared_ptr<ShuLangNode>>();
};
  
childholder<ShuLangNode> StatementNode::ingressVisitor(ShuLangVisitor* visitor) {
  return visitor->ingressStatementNode(this, 0);
}
ShuLangNode* StatementNode::egressVisitor(ShuLangVisitor* visitor) {
  return visitor->egressStatementNode(this);
}

std::vector<std::shared_ptr<ShuLangNode>> PrintNode::children() {
  std::vector<std::shared_ptr<ShuLangNode>> children;
  children.push_back(to_print);
  return children;
}
childholder<ShuLangNode> PrintNode::ingressVisitor(ShuLangVisitor* visitor) {
  return visitor->ingressPrintNode(this, 1);
}
ShuLangNode* PrintNode::egressVisitor(ShuLangVisitor* visitor) {
  return visitor->egressPrintNode(this);
}

childholder<ShuLangNode> ValueNode::ingressVisitor(ShuLangVisitor* visitor) {
  return visitor->ingressValueNode(this, 0);
}
ShuLangNode* ValueNode::egressVisitor(ShuLangVisitor* visitor) {
  return visitor->egressValueNode(this);
}

std::vector<std::shared_ptr<ShuLangNode>> IntegerNode::children() {
  return std::vector<std::shared_ptr<ShuLangNode>>();
}
childholder<ShuLangNode> IntegerNode::ingressVisitor(ShuLangVisitor* visitor) {
  return visitor->ingressIntegerNode(this, 0);
}
ShuLangNode* IntegerNode::egressVisitor(ShuLangVisitor* visitor) {
  return visitor->egressIntegerNode(this);
}

std::vector<std::shared_ptr<ShuLangNode>> BooleanNode::children() {
  return std::vector<std::shared_ptr<ShuLangNode>>();
}
childholder<ShuLangNode> BooleanNode::ingressVisitor(ShuLangVisitor* visitor) {
  return visitor->ingressBooleanNode(this, 0);
}
ShuLangNode* BooleanNode::egressVisitor(ShuLangVisitor* visitor) {
  return visitor->egressBooleanNode(this);
}

VariableReferenceNode::VariableReferenceNode(std::string identifier) {
  this->identifier = identifier;
}
std::vector<std::shared_ptr<ShuLangNode>> VariableReferenceNode::children() {
  return std::vector<std::shared_ptr<ShuLangNode>>();
}
childholder<ShuLangNode> VariableReferenceNode::ingressVisitor(ShuLangVisitor* visitor) {
  return visitor->ingressVariableReferenceNode(this, 0);
}
ShuLangNode* VariableReferenceNode::egressVisitor(ShuLangVisitor* visitor) {
  return visitor->egressVariableReferenceNode(this);
}

std::vector<std::shared_ptr<ShuLangNode>> BindingNode::children()  {
  std::vector<std::shared_ptr<ShuLangNode>> children;
  children.push_back(value);
  return children;
}
childholder<ShuLangNode> BindingNode::ingressVisitor(ShuLangVisitor* visitor)  {
  return visitor->ingressBindingNode(this, 1);
}
ShuLangNode* BindingNode::egressVisitor(ShuLangVisitor* visitor) {
  return visitor->egressBindingNode(this);
}

std::vector<std::shared_ptr<ShuLangNode>> OperatorApplicationNode::children() {
  std::vector<std::shared_ptr<ShuLangNode>> children;
  children.push_back(lhs);
  children.push_back(rhs);
  return children;
}

childholder<ShuLangNode> OperatorApplicationNode::ingressVisitor(ShuLangVisitor* visitor) {
  return visitor->ingressOperatorApplicationNode(this, 2);
}
ShuLangNode* OperatorApplicationNode::egressVisitor(ShuLangVisitor* visitor) {
  return visitor->egressOperatorApplicationNode(this);
}

std::vector<std::shared_ptr<ShuLangNode>> NotNode::children() {
  return { value };
}
childholder<ShuLangNode> NotNode::ingressVisitor(ShuLangVisitor* visitor) {
  return visitor->ingressNotNode(this, 1);
}
ShuLangNode* NotNode::egressVisitor(ShuLangVisitor* visitor) {
  return visitor->egressNotNode(this);
}

std::vector<std::shared_ptr<ShuLangNode>> SelectValueNode::children() {
  return { value };
}
childholder<ShuLangNode> SelectValueNode::ingressVisitor(ShuLangVisitor* visitor) {
  return visitor->ingressSelectValueNode(this, 1);
}
ShuLangNode* SelectValueNode::egressVisitor(ShuLangVisitor* visitor) {
  return visitor->egressSelectValueNode(this);
}

std::vector<std::shared_ptr<ShuLangNode>> SelectOperatorNode::children() {
  return { condition, true_value, false_value};
}
childholder<ShuLangNode> SelectOperatorNode::ingressVisitor(ShuLangVisitor* visitor) {
  return visitor->ingressSelectOperatorNode(this, 3);
}
ShuLangNode* SelectOperatorNode::egressVisitor(ShuLangVisitor* visitor) {
  return visitor->egressSelectOperatorNode(this);
}


std::vector<std::shared_ptr<ShuLangNode>> IfNode::children() {
  std::vector<std::shared_ptr<ShuLangNode>> childs;
  childs.push_back(condition);
  childs.push_back(then_block);

  if (else_block != nullptr) {
    childs.push_back(else_block);
  }

  return childs;
}
childholder<ShuLangNode> IfNode::ingressVisitor(ShuLangVisitor* visitor) {
  // We only have the condition as the child
  // Because we can treat the then and else blocks
  // As their own separate entities
  int childcount = 1;
  return visitor->ingressIfNode(this, childcount);
}
ShuLangNode* IfNode::egressVisitor(ShuLangVisitor* visitor) {
  return visitor->egressIfNode(this);
}

std::vector<std::shared_ptr<ShuLangNode>> BodyNode::children() {
  std::vector<std::shared_ptr<ShuLangNode>> childs;
  childs.insert(childs.end(), nodes.begin(), nodes.end());
  return childs;
}
childholder<ShuLangNode> BodyNode::ingressVisitor(ShuLangVisitor* visitor) {
  return visitor->ingressBodyNode(this, nodes.size());
}
ShuLangNode* BodyNode::egressVisitor(ShuLangVisitor* visitor) {
  return visitor->egressBodyNode(this);
}

childholder<ShuLangNode> ProgramNode::ingressVisitor(ShuLangVisitor* visitor) {
  return visitor->ingressProgramNode(this, nodes.size());
}
ShuLangNode* ProgramNode::egressVisitor(ShuLangVisitor* visitor) {
  return visitor->egressProgramNode(this);
}
