#pragma once

#include <ASTNode.hpp>
#include <memory>
#include <string>
#include <vector>

class ShuLangVisitor;

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
    virtual std::vector<ShuLangNode*> children() = 0;
    virtual childholder<ShuLangNode> ingressVisitor(ShuLangVisitor *visitor) = 0;
    virtual ShuLangNode* egressVisitor(ShuLangVisitor *visitor) = 0;
  };

  class StatementNode : public ShuLangNode {
    public:
      childholder<ShuLangNode> ingressVisitor(ShuLangVisitor* visitor) override;
      ShuLangNode* egressVisitor(ShuLangVisitor *visitor) override;
  };

  // First class values
  class ValueNode : public StatementNode {
    public:
      std::string type;
      std::vector<ShuLangNode*> children() override;
      childholder<ShuLangNode> ingressVisitor(ShuLangVisitor *visitor) override;
      ShuLangNode* egressVisitor(ShuLangVisitor *visitor) override;
  };

  class PrintNode : public StatementNode {
    public:
      std::shared_ptr<ValueNode> to_print;
      PrintNode(std::shared_ptr<ValueNode> printable):to_print(printable) { };
      std::vector<ShuLangNode*> children() override;
      childholder<ShuLangNode> ingressVisitor(ShuLangVisitor* visitor) override;
      ShuLangNode* egressVisitor(ShuLangVisitor *visitor) override;
  };

  class IntegerNode : public ValueNode {
    public:
      int value;
      IntegerNode(int value):value(value) { this->type = "Integer"; }
      childholder<ShuLangNode> ingressVisitor(ShuLangVisitor *visitor) override;
      ShuLangNode* egressVisitor(ShuLangVisitor *visitor) override;
  };

  class BooleanNode : public ValueNode {
    public:
      bool value;
      BooleanNode(bool value):value(value) { this->type = "Boolean"; }
      childholder<ShuLangNode> ingressVisitor(ShuLangVisitor *visitor) override;
      ShuLangNode* egressVisitor(ShuLangVisitor *visitor) override;
  };

  class VariableReferenceNode : public ValueNode {
    public:
      std::string identifier;
      VariableReferenceNode(std::string identifier):identifier(identifier) { }
      childholder<ShuLangNode> ingressVisitor(ShuLangVisitor *visitor) override;
      ShuLangNode* egressVisitor(ShuLangVisitor *visitor) override;
  };

  class BindingNode : public StatementNode {
    public:
      std::string identifier;
      std::string type;
      std::shared_ptr<ValueNode> value;
      BindingNode(std::string identifier, std::string type, std::shared_ptr<ValueNode> value):
        identifier(identifier), type(type), value(value) { };

      std::vector<ShuLangNode*> children() override;
      childholder<ShuLangNode> ingressVisitor(ShuLangVisitor *visitor) override;
      ShuLangNode* egressVisitor(ShuLangVisitor *visitor) override;
  };

  class OperatorApplicationNode : public ValueNode {
    public:
      std::string op;
      std::shared_ptr<ValueNode> lhs;
      std::shared_ptr<ValueNode> rhs;
      OperatorApplicationNode(std::string op, std::shared_ptr<ValueNode> lhs, std::shared_ptr<ValueNode> rhs)
        :op(op), lhs(lhs), rhs(rhs) { }
      std::vector<ShuLangNode*> children() override;
      childholder<ShuLangNode> ingressVisitor(ShuLangVisitor *visitor) override;
      ShuLangNode* egressVisitor(ShuLangVisitor *visitor) override;
  };

  class NotNode : public ValueNode {
    public:
      std::shared_ptr<ValueNode> value;

      NotNode(std::shared_ptr<ValueNode> value):value(value) { 
        type = "Boolean";
      }

      std::vector<ShuLangNode*> children() override;
      childholder<ShuLangNode> ingressVisitor(ShuLangVisitor *visitor) override;
      ShuLangNode* egressVisitor(ShuLangVisitor *visitor) override;
  };

  // Returns last value
  class BeginNode : public ValueNode {
    public:
      ValueNode* parent;
      std::vector<std::shared_ptr<StatementNode>> statements;
      std::shared_ptr<ValueNode> end_value;
      BeginNode(ValueNode* parent):parent(parent) { }
      std::vector<ShuLangNode*> children() override;
      childholder<ShuLangNode> ingressVisitor(ShuLangVisitor *visitor) override;
      ShuLangNode* egressVisitor(ShuLangVisitor *visitor) override;
  };

  class SelectOperatorNode : public ValueNode {
    public:
      std::shared_ptr<BeginNode> condition;
      std::shared_ptr<BeginNode> true_value;
      std::shared_ptr<BeginNode> false_value;
      
      SelectOperatorNode(std::shared_ptr<ValueNode> condition, std::shared_ptr<ValueNode> true_value, std::shared_ptr<ValueNode> false_value) { 
          this->condition = std::make_shared<BeginNode>(this);
          this->condition->end_value = condition;
          this->true_value = std::make_shared<BeginNode>(this);
          this->true_value->end_value = true_value;
          this->false_value = std::make_shared<BeginNode>(this);
          this->false_value->end_value = false_value;
        } 

      std::vector<ShuLangNode*> children() override;
      childholder<ShuLangNode> ingressVisitor(ShuLangVisitor *visitor) override;
      ShuLangNode* egressVisitor(ShuLangVisitor *visitor) override;
  };

  class BodyNode : public ShuLangNode {
    public:
      std::vector<std::shared_ptr<ShuLangNode>> nodes;
      std::vector<ShuLangNode*> children() override;
      childholder<ShuLangNode> ingressVisitor(ShuLangVisitor *visitor) override;
      ShuLangNode* egressVisitor(ShuLangVisitor *visitor) override;
  };

  class IfNode : public StatementNode {
    public:
      std::shared_ptr<ValueNode> condition;
      std::shared_ptr<BodyNode> then_block = nullptr;
      std::shared_ptr<BodyNode> else_block = nullptr;
      std::vector<ShuLangNode*> children() override;
      childholder<ShuLangNode> ingressVisitor(ShuLangVisitor *visitor) override;
      ShuLangNode* egressVisitor(ShuLangVisitor *visitor) override;
  };


  class ProgramNode : public BodyNode {
    public:
      childholder<ShuLangNode> ingressVisitor(ShuLangVisitor *visitor) override;
      ShuLangNode* egressVisitor(ShuLangVisitor *visitor) override;
  };
}