#include <ASTNode.hpp>
#include <ShuLangVisitor.hpp>
#include <ShuLangAST.hpp>
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

std::vector<std::shared_ptr<ShuLangNode>> IfNode::children() {
  std::vector<std::shared_ptr<ShuLangNode>> childs;
  childs.push_back(condition);
  childs.insert(childs.end(), then_block.begin(), then_block.end());
  childs.insert(childs.end(), else_block.begin(), else_block.end());
  return childs;
}
childholder<ShuLangNode> IfNode::ingressVisitor(ShuLangVisitor* visitor) {
  return visitor->ingressIfNode(this, 2);
}
ShuLangNode* IfNode::egressVisitor(ShuLangVisitor* visitor) {
  return visitor->egressIfNode(this);
}

std::vector<std::shared_ptr<ShuLangNode>> ProgramNode::children() {
  std::vector<std::shared_ptr<ShuLangNode>> childs;
  childs.insert(childs.end(), nodes.begin(), nodes.end());
  return childs;
}
childholder<ShuLangNode> ProgramNode::ingressVisitor(ShuLangVisitor* visitor) {
  return visitor->ingressProgramNode(this, nodes.size());
}
ShuLangNode* ProgramNode::egressVisitor(ShuLangVisitor* visitor) {
  return visitor->egressProgramNode(this);
}
