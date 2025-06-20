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
  children.push_back(rhs);
  children.push_back(lhs);
  return children;
}

childholder<ShuLangNode> OperatorApplicationNode::ingressVisitor(ShuLangVisitor* visitor) {
  return visitor->ingressOperatorApplicationNode(this, 2);
}
ShuLangNode* OperatorApplicationNode::egressVisitor(ShuLangVisitor* visitor) {
  return visitor->egressOperatorApplicationNode(this);
}

std::vector<std::shared_ptr<ShuLangNode>> ProgramNode::children() {
  // This function exists solely for the Visitor
  // And as such is tailored to its needs

  // The Visitor is trying to do a depth first traversal
  // Meaning we have to reverse the instructions

  // Take the example of
  // bind x : Integer to 5 print(x)
  // If to the vector in the normal order
  // We end up with {bind, print}
  // However, when the Visitor push's onto a stack
  // It ends up with {print, bind}
  // Then descends into the print before the bind
  // Which is bad!!!
  std::vector<std::shared_ptr<ShuLangNode>> reversed;
  for (int i = nodes.size() - 1; i >= 0; i--)
    reversed.push_back(nodes.at(i));
  return reversed;
}
childholder<ShuLangNode> ProgramNode::ingressVisitor(ShuLangVisitor* visitor) {
  return visitor->ingressProgramNode(this, nodes.size());
}
ShuLangNode* ProgramNode::egressVisitor(ShuLangVisitor* visitor) {
  return visitor->egressProgramNode(this);
}
