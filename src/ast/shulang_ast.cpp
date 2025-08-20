#include <ASTNode.hpp>
#include <ShuLangVisitor.hpp>
#include <ShuLangAST.hpp>
#include <memory>
#include <vector>

using namespace shulang;

childholder<ShuLangNode> StatementNode::ingressVisitor(ShuLangVisitor* visitor) {
  visitor->onIngressStatementNode(this);
  return visitor->ingressStatementNode(this, 0);
}
ShuLangNode* StatementNode::egressVisitor(ShuLangVisitor* visitor) {
  visitor->onEgressStatementNode(this);
  return visitor->egressStatementNode(this);
}

std::vector<std::shared_ptr<ShuLangNode>> PrintNode::children() {
  return { to_print };
}
childholder<ShuLangNode> PrintNode::ingressVisitor(ShuLangVisitor* visitor) {
  visitor->onIngressPrintNode(this);
  return visitor->ingressPrintNode(this, 1);
}
ShuLangNode* PrintNode::egressVisitor(ShuLangVisitor* visitor) {
  visitor->onEgressPrintNode(this);
  return visitor->egressPrintNode(this);
}


std::vector<std::shared_ptr<ShuLangNode>> ValueNode::children() {
  return { };  
}
childholder<ShuLangNode> ValueNode::ingressVisitor(ShuLangVisitor* visitor) {
  visitor->onIngressValueNode(this);
  return visitor->ingressValueNode(this, 0);
}
ShuLangNode* ValueNode::egressVisitor(ShuLangVisitor* visitor) {
  visitor->onEgressValueNode(this);
  return visitor->egressValueNode(this);
}

childholder<ShuLangNode> IntegerNode::ingressVisitor(ShuLangVisitor* visitor) {
  visitor->onIngressIntegerNode(this);
  return visitor->ingressIntegerNode(this, 0);
}
ShuLangNode* IntegerNode::egressVisitor(ShuLangVisitor* visitor) {
  visitor->onEgressIntegerNode(this);
  return visitor->egressIntegerNode(this);
}

childholder<ShuLangNode> BooleanNode::ingressVisitor(ShuLangVisitor* visitor) {
  visitor->onIngressBooleanNode(this);
  return visitor->ingressBooleanNode(this, 0);
}
ShuLangNode* BooleanNode::egressVisitor(ShuLangVisitor* visitor) {
  visitor->onEgressBooleanNode(this);
  return visitor->egressBooleanNode(this);
}


childholder<ShuLangNode> VariableReferenceNode::ingressVisitor(ShuLangVisitor* visitor) {
  visitor->onIngressVariableReferenceNode(this);
  return visitor->ingressVariableReferenceNode(this, 0);
}
ShuLangNode* VariableReferenceNode::egressVisitor(ShuLangVisitor* visitor) {
  visitor->onEgressVariableReferenceNode(this);
  return visitor->egressVariableReferenceNode(this);
}

std::vector<std::shared_ptr<ShuLangNode>> BindingNode::children()  {
  return { value };
}
childholder<ShuLangNode> BindingNode::ingressVisitor(ShuLangVisitor* visitor)  {
  visitor->onIngressBindingNode(this);
  return visitor->ingressBindingNode(this, 1);
}
ShuLangNode* BindingNode::egressVisitor(ShuLangVisitor* visitor) {
  visitor->onEgressBindingNode(this);
  return visitor->egressBindingNode(this);
}

std::vector<std::shared_ptr<ShuLangNode>> OperatorApplicationNode::children() {
  return { lhs, rhs };
}
childholder<ShuLangNode> OperatorApplicationNode::ingressVisitor(ShuLangVisitor* visitor) {
  visitor->onIngressOperatorApplicationNode(this);
  return visitor->ingressOperatorApplicationNode(this, 2);
}
ShuLangNode* OperatorApplicationNode::egressVisitor(ShuLangVisitor* visitor) {
  visitor->onEgressOperatorApplicationNode(this);
  return visitor->egressOperatorApplicationNode(this);
}

std::vector<std::shared_ptr<ShuLangNode>> NotNode::children() {
  return { value };
}
childholder<ShuLangNode> NotNode::ingressVisitor(ShuLangVisitor* visitor) {
  visitor->onIngressNotNode(this);
  return visitor->ingressNotNode(this, 1);
}
ShuLangNode* NotNode::egressVisitor(ShuLangVisitor* visitor) {
  visitor->onEgressNotNode(this);
  return visitor->egressNotNode(this);
}

std::vector<std::shared_ptr<ShuLangNode>> BeginNode::children() {
  std::vector<std::shared_ptr<ShuLangNode>> ret;
  ret.insert(ret.end(), statements.begin(), statements.end());
  ret.push_back(end_value);
  return ret;
}
childholder<ShuLangNode> BeginNode::ingressVisitor(ShuLangVisitor* visitor) {
  // +1 to account for the end value
  visitor->onIngressBeginNode(this);
  return visitor->ingressBeginNode(this, statements.size() + 1);
}
ShuLangNode* BeginNode::egressVisitor(ShuLangVisitor* visitor) {
  visitor->onEgressBeginNode(this);
  return visitor->egressBeginNode(this);
}

std::vector<std::shared_ptr<ShuLangNode>> SelectOperatorNode::children() {
  return { condition, true_value, false_value};
}
childholder<ShuLangNode> SelectOperatorNode::ingressVisitor(ShuLangVisitor* visitor) {
  visitor->onIngressSelectOperatorNode(this);
  return visitor->ingressSelectOperatorNode(this, 3);
}
ShuLangNode* SelectOperatorNode::egressVisitor(ShuLangVisitor* visitor) {
  visitor->onEgressSelectOperatorNode(this);
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
  visitor->onIngressIfNode(this);
  int childcount = 1;
  return visitor->ingressIfNode(this, childcount);
}
ShuLangNode* IfNode::egressVisitor(ShuLangVisitor* visitor) {
  visitor->onEgressIfNode(this);
  return visitor->egressIfNode(this);
}

std::vector<std::shared_ptr<ShuLangNode>> BodyNode::children() {
  std::vector<std::shared_ptr<ShuLangNode>> childs;
  childs.insert(childs.end(), nodes.begin(), nodes.end());
  return childs;
}
childholder<ShuLangNode> BodyNode::ingressVisitor(ShuLangVisitor* visitor) {
  visitor->onIngressBodyNode(this);
  return visitor->ingressBodyNode(this, nodes.size());
}
ShuLangNode* BodyNode::egressVisitor(ShuLangVisitor* visitor) {
  visitor->onEgressBodyNode(this);
  return visitor->egressBodyNode(this);
}

childholder<ShuLangNode> ProgramNode::ingressVisitor(ShuLangVisitor* visitor) {
  visitor->onIngressProgramNode(this);
  return visitor->ingressProgramNode(this, nodes.size());
}
ShuLangNode* ProgramNode::egressVisitor(ShuLangVisitor* visitor) {
  visitor->onEgressProgramNode(this);
  return visitor->egressProgramNode(this);
}
