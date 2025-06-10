#include <ASTNode.hpp>
#include <ShuLangVisitor.hpp>
#include <ShuLangAST.hpp>
#include <vector>

std::vector<ShuLangNode*> StatementNode::children() {
  return std::vector<ShuLangNode*>();
};
  
childholder<ShuLangNode> StatementNode::ingressVisitor(ShuLangVisitor *visitor) {
  return visitor->ingressStatementNode(this, 0);
}
ShuLangNode* StatementNode::egressVisitor(ShuLangVisitor *visitor) {
  return visitor->egressStatementNode(this);
}

PrintNode::PrintNode(StatementNode *printable) { this->to_print = printable; }
std::vector<ShuLangNode*> PrintNode::children() {
  std::vector<ShuLangNode*> children;
  children.push_back(to_print);
  return children;
}
childholder<ShuLangNode> PrintNode::ingressVisitor(ShuLangVisitor *visitor) {
  return visitor->ingressPrintNode(this, 1);
}
ShuLangNode* PrintNode::egressVisitor(ShuLangVisitor *visitor) {
  return visitor->egressPrintNode(this);
}

childholder<ShuLangNode> ValueNode::ingressVisitor(ShuLangVisitor *visitor) {
  return visitor->ingressValueNode(this, 0);
}
ShuLangNode* ValueNode::egressVisitor(ShuLangVisitor *visitor) {
  return visitor->egressValueNode(this);
}

std::vector<ShuLangNode*> IntegerNode::children() {
  return std::vector<ShuLangNode*>();
}
childholder<ShuLangNode> IntegerNode::ingressVisitor(ShuLangVisitor *visitor) {
  return visitor->ingressIntegerNode(this, 0);
}
ShuLangNode* IntegerNode::egressVisitor(ShuLangVisitor *visitor) {
  return visitor->egressIntegerNode(this);
}

VariableReferenceNode::VariableReferenceNode(std::string identifier) {
  this->identifier = identifier;
}
std::vector<ShuLangNode*> VariableReferenceNode::children() {
  return std::vector<ShuLangNode*>();
}
childholder<ShuLangNode> VariableReferenceNode::ingressVisitor(ShuLangVisitor *visitor) {
  return visitor->ingressVariableReferenceNode(this, 0);
}
ShuLangNode* VariableReferenceNode::egressVisitor(ShuLangVisitor *visitor) {
  return visitor->egressVariableReferenceNode(this);
}

std::vector<ShuLangNode*> BindingNode::children()  {
  std::vector<ShuLangNode*> children;
  children.push_back(value);
  return children;
}
childholder<ShuLangNode> BindingNode::ingressVisitor(ShuLangVisitor *visitor)  {
  return visitor->ingressBindingNode(this, 1);
}
ShuLangNode* BindingNode::egressVisitor(ShuLangVisitor *visitor) {
  return visitor->egressBindingNode(this);
}

std::vector<ShuLangNode*> OperatorApplicationNode::children() {
  std::vector<ShuLangNode*> children;
  children.push_back(lhs);
  children.push_back(rhs);
  return children;
}

childholder<ShuLangNode> OperatorApplicationNode::ingressVisitor(ShuLangVisitor *visitor) {
  return visitor->ingressOperatorApplicationNode(this, 2);
}
ShuLangNode* OperatorApplicationNode::egressVisitor(ShuLangVisitor *visitor) {
  return visitor->egressOperatorApplicationNode(this);
}

std::vector<ShuLangNode*> ProgramNode::children() {
  std::vector<ShuLangNode*> reversed;
  for (int i = nodes.size() - 1; i >= 0; i--)
    reversed.push_back(nodes.at(i));
  return reversed;
}
childholder<ShuLangNode> ProgramNode::ingressVisitor(ShuLangVisitor *visitor) {
  return visitor->ingressProgramNode(this, nodes.size());
}
ShuLangNode* ProgramNode::egressVisitor(ShuLangVisitor *visitor) {
  return visitor->egressProgramNode(this);
}
