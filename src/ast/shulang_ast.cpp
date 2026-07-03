#include <ShuLangVisitor.hpp>
#include <ShuLangAST.hpp>
#include <memory>
#include <vector>

using namespace shulang;
using namespace std;

vector<ShuLangNode*> ShuLangNode::children() {
  return { };
}

void ShuLangNode::accept(ShuLangVisitor* visitor) {
  visitor->visitNode(this);
}

void StatementNode::accept(ShuLangVisitor* visitor) {
  visitor->visitNode(this);
}

vector<ShuLangNode*> ValueNode::children() {
  return { };  
}

void ValueNode::accept(ShuLangVisitor* visitor) {
  visitor->visitNode(this);
}

void IntegerNode::accept(ShuLangVisitor* visitor) {
  visitor->visitNode(this);
}

void BooleanNode::accept(ShuLangVisitor* visitor) {
  visitor->visitNode(this);
}


void VariableReferenceNode::accept(ShuLangVisitor* visitor) {
  visitor->visitNode(this);
}

vector<ShuLangNode*> BindingNode::children()  {
  return { value.get() };
}

void BindingNode::accept(ShuLangVisitor* visitor) {
  visitor->visitNode(this);
}

vector<ShuLangNode*> OperatorApplicationNode::children() {
  return { lhs.get(), rhs.get() };
}

void OperatorApplicationNode::accept(ShuLangVisitor* visitor) {
  visitor->visitNode(this);
}

vector<ShuLangNode*> NotNode::children() {
  return { value.get() };
}

void NotNode::accept(ShuLangVisitor* visitor) {
  visitor->visitNode(this);
}

vector<ShuLangNode*> BeginNode::children() {
  vector<ShuLangNode*> ret;
  for (int i = 0; i < statements.size(); i++)
    ret.push_back(statements.at(i).get());
  ret.push_back(end_value.get());
  return ret;
}

void BeginNode::accept(ShuLangVisitor* visitor) {
  visitor->visitNode(this);
}

vector<ShuLangNode*> SelectOperatorNode::children() {
  return { condition.get(), true_value.get(), false_value.get()};
}

void SelectOperatorNode::accept(ShuLangVisitor* visitor) {
  visitor->visitNode(this);
}

vector<ShuLangNode*> CallNode::children() {
  vector<ShuLangNode*> ret;
  for (int i = 0; i < arguments.size(); i++)
    ret.push_back(arguments.at(i).get());
  return ret;
}

void CallNode::accept(ShuLangVisitor *visitor) {
  visitor->visitNode(this);
}

vector<ShuLangNode*> IfNode::children() {
  vector<ShuLangNode*> childs;
  childs.push_back(condition.get());
  childs.push_back(then_block.get());

  if (else_block != nullptr) {
    childs.push_back(else_block.get());
  }

  return childs;
}

void IfNode::accept(ShuLangVisitor* visitor) {
  visitor->visitNode(this);
}

vector<ShuLangNode*> BodyNode::children() {
  vector<ShuLangNode*> childs;
  for (int i = 0; i < nodes.size(); i++)
    childs.push_back(nodes.at(i).get());
  return childs;
}

void BodyNode::accept(ShuLangVisitor* visitor) {
  visitor->visitNode(this);
}

vector<ShuLangNode*> WhileNode::children() {
  return { condition.get(), body.get() };
}

void WhileNode::accept(ShuLangVisitor* visitor) {
  visitor->visitNode(this);
}

void ProgramNode::accept(ShuLangVisitor* visitor) {
  visitor->visitNode(this);
}

vector<ShuLangNode*> FunctionNode::children() {
  return { body.get() };
}

void FunctionNode::accept(ShuLangVisitor* visitor) {
  visitor->visitNode(this);
}

vector<ShuLangNode*> ReturnNode::children() {
  return { return_value.get() };
}

void ReturnNode::accept(ShuLangVisitor* visitor) {
  visitor->visitNode(this);
}
