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
      std::string type;
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
      IntegerNode(int value): value(value) { this->type = "Integer"; }
      childholder<ShuLangNode> ingressVisitor(ShuLangVisitor *visitor) override;
      ShuLangNode* egressVisitor(ShuLangVisitor *visitor) override;
  };

  class BooleanNode : public ValueNode {
    public:
      bool value;
      std::vector<std::shared_ptr<ShuLangNode>> children() override;
      BooleanNode(bool value): value(value) { this->type = "Boolean"; }
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

  class NotNode : public ValueNode {
    public:
      std::shared_ptr<ValueNode> value;

      NotNode(std::shared_ptr<ValueNode> value):value(value) { 
        type = "Boolean";
      }

      std::vector<std::shared_ptr<ShuLangNode>> children() override;
      childholder<ShuLangNode> ingressVisitor(ShuLangVisitor *visitor) override;
      ShuLangNode* egressVisitor(ShuLangVisitor *visitor) override;
  };

  class SelectOperatorNode : public ValueNode {
    public:
      std::shared_ptr<ValueNode> condition;
      std::shared_ptr<ValueNode> true_value;
      std::shared_ptr<ValueNode> false_value;
      
      SelectOperatorNode(std::shared_ptr<ValueNode> condition, std::shared_ptr<ValueNode> true_value, std::shared_ptr<ValueNode> false_value):
        condition(condition), true_value(true_value), false_value(false_value) { 
          type = true_value->type;
        } 

      std::vector<std::shared_ptr<ShuLangNode>> children() override;
      childholder<ShuLangNode> ingressVisitor(ShuLangVisitor *visitor) override;
      ShuLangNode* egressVisitor(ShuLangVisitor *visitor) override;
  };

  class BodyNode : public ShuLangNode {
    public:
      std::vector<std::shared_ptr<ShuLangNode>> nodes;
      std::vector<std::shared_ptr<ShuLangNode>> children() override;
      childholder<ShuLangNode> ingressVisitor(ShuLangVisitor *visitor) override;
      ShuLangNode* egressVisitor(ShuLangVisitor *visitor) override;
  };

  class IfNode : public StatementNode {
    public:
      std::shared_ptr<ValueNode> condition;
      std::shared_ptr<BodyNode> then_block;
      std::shared_ptr<BodyNode> else_block;
      std::vector<std::shared_ptr<ShuLangNode>> children() override;
      childholder<ShuLangNode> ingressVisitor(ShuLangVisitor *visitor) override;
      ShuLangNode* egressVisitor(ShuLangVisitor *visitor) override;
  };


  class ProgramNode : public BodyNode {
    public:
      childholder<ShuLangNode> ingressVisitor(ShuLangVisitor *visitor) override;
      ShuLangNode* egressVisitor(ShuLangVisitor *visitor) override;
  };
}