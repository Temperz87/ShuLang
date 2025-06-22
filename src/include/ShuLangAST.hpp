#pragma once

#include <ASTNode.hpp>
#include <memory>
#include <string>
#include <vector>

class ShuLangVisitor;

class ASTNode;
// ShuLang AST
template <class T> 
struct childholder {
  T *node;
  int waitingfor;
};

namespace shulang {
  class ShuLangNode : public ASTNode, public std::enable_shared_from_this<ShuLangNode> {
  public:
    // Gets DIRECT children
    virtual std::vector<std::shared_ptr<ShuLangNode>> children() = 0;
    virtual childholder<ShuLangNode> ingressVisitor(ShuLangVisitor *visitor) = 0;
    virtual ShuLangNode* egressVisitor(ShuLangVisitor *visitor) = 0;
  };


  class StatementNode : public ShuLangNode {
    public:
      std::vector<std::shared_ptr<ShuLangNode>> children() override;
      childholder<ShuLangNode> ingressVisitor(ShuLangVisitor* visitor) override;
      ShuLangNode* egressVisitor(ShuLangVisitor *visitor) override;
  };

  // First class values
  class ValueNode : public StatementNode {
    public:
      childholder<ShuLangNode> ingressVisitor(ShuLangVisitor *visitor) override;
      ShuLangNode* egressVisitor(ShuLangVisitor *visitor) override;
  };

  class PrintNode : public StatementNode {
    public:
      std::shared_ptr<ValueNode> to_print;
      PrintNode(std::shared_ptr<ValueNode> printable):to_print(printable) {};
      std::vector<std::shared_ptr<ShuLangNode>> children() override;
      childholder<ShuLangNode> ingressVisitor(ShuLangVisitor* visitor) override;
      ShuLangNode* egressVisitor(ShuLangVisitor *visitor) override;
  };

  class IntegerNode : public ValueNode {
    public:
      int value;
      std::vector<std::shared_ptr<ShuLangNode>> children() override;
      IntegerNode(int value) { this->value = value; }
      childholder<ShuLangNode> ingressVisitor(ShuLangVisitor *visitor) override;
      ShuLangNode* egressVisitor(ShuLangVisitor *visitor) override;
  };

  class BooleanNode : public ValueNode {
    public:
      bool value;
      std::vector<std::shared_ptr<ShuLangNode>> children() override;
      BooleanNode(bool value) { this->value = value; }
      childholder<ShuLangNode> ingressVisitor(ShuLangVisitor *visitor) override;
      ShuLangNode* egressVisitor(ShuLangVisitor *visitor) override;
  };

  class VariableReferenceNode : public ValueNode {
    public:
      std::string identifier;
      VariableReferenceNode(std::string identifier);
      std::vector<std::shared_ptr<ShuLangNode>> children() override;
      childholder<ShuLangNode> ingressVisitor(ShuLangVisitor *visitor) override;
      ShuLangNode* egressVisitor(ShuLangVisitor *visitor) override;
  };

  class BindingNode : public StatementNode {
    public:
      std::string name;
      std::string ty;
      std::shared_ptr<ValueNode> value;
      std::vector<std::shared_ptr<ShuLangNode>> children() override;
      childholder<ShuLangNode> ingressVisitor(ShuLangVisitor *visitor) override;
      ShuLangNode* egressVisitor(ShuLangVisitor *visitor) override;
  };

  class OperatorApplicationNode : public ValueNode {
    public:
      std::string op;
      std::shared_ptr<ValueNode> lhs;
      std::shared_ptr<ValueNode> rhs;
      std::vector<std::shared_ptr<ShuLangNode>> children() override;
      childholder<ShuLangNode> ingressVisitor(ShuLangVisitor *visitor) override;
      ShuLangNode* egressVisitor(ShuLangVisitor *visitor) override;
  };

  class IfNode : public StatementNode {
    public:
      std::vector<std::shared_ptr<StatementNode>> then_block;
      std::vector<std::shared_ptr<StatementNode>> else_block;
      std::shared_ptr<ValueNode> condition;
      std::vector<std::shared_ptr<ShuLangNode>> children() override;
      childholder<ShuLangNode> ingressVisitor(ShuLangVisitor *visitor) override;
      ShuLangNode* egressVisitor(ShuLangVisitor *visitor) override;
  };

  class ProgramNode : public ShuLangNode {
    public:
      std::vector<std::shared_ptr<ShuLangNode>> nodes;
      std::vector<std::shared_ptr<ShuLangNode>> children() override;
      childholder<ShuLangNode> ingressVisitor(ShuLangVisitor *visitor) override;
      ShuLangNode* egressVisitor(ShuLangVisitor *visitor) override;
  };
}