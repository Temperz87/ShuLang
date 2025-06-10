#pragma once

#include <ASTNode.hpp>
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
  class ShuLangNode : public ASTNode {
  public:

    // Gets DIRECT children
    virtual std::vector<ShuLangNode*> children() = 0;
    virtual childholder<ShuLangNode> ingressVisitor(ShuLangVisitor *visitor) = 0;
    virtual ShuLangNode* egressVisitor(ShuLangVisitor *visitor) = 0;
  };


  class StatementNode : public ShuLangNode {
    public:
      std::vector<ShuLangNode*> children() override;
      childholder<ShuLangNode> ingressVisitor(ShuLangVisitor *visitor) override;
      ShuLangNode* egressVisitor(ShuLangVisitor *visitor) override;
  };

  class PrintNode : public StatementNode {
  public:
    StatementNode *to_print;
    PrintNode(StatementNode *printable);
    std::vector<ShuLangNode*> children() override;
    childholder<ShuLangNode> ingressVisitor(ShuLangVisitor *visitor) override;
    ShuLangNode*egressVisitor(ShuLangVisitor *visitor) override;
  };

  // I'm getting jiggy with it I don't know if this is fine
  class ValueNode : public StatementNode {
  public:
    childholder<ShuLangNode> ingressVisitor(ShuLangVisitor *visitor) override;
    ShuLangNode*egressVisitor(ShuLangVisitor *visitor) override;
  };

  class IntegerNode : public ValueNode {
  public:
    int value;
    std::vector<ShuLangNode*> children() override;

    IntegerNode(int value) { this->value = value; }

    childholder<ShuLangNode> ingressVisitor(ShuLangVisitor *visitor) override;
    ShuLangNode*egressVisitor(ShuLangVisitor *visitor) override;
  };

  class VariableReferenceNode : public ValueNode {
  public:
    std::string identifier;
    VariableReferenceNode(std::string identifier);
    std::vector<ShuLangNode*> children() override;
    childholder<ShuLangNode> ingressVisitor(ShuLangVisitor *visitor) override;
    ShuLangNode*egressVisitor(ShuLangVisitor *visitor) override;
  };

  class BindingNode : public StatementNode {
  public:
    std::string name;
    std::string ty;
    ValueNode *value;

    std::vector<ShuLangNode*> children() override;
    childholder<ShuLangNode> ingressVisitor(ShuLangVisitor *visitor) override;
    ShuLangNode*egressVisitor(ShuLangVisitor *visitor) override;
  };

  class OperatorApplicationNode : public ValueNode {
  public:
    std::string op;
    StatementNode *lhs;
    StatementNode *rhs;

    std::vector<ShuLangNode*> children() override;
    childholder<ShuLangNode> ingressVisitor(ShuLangVisitor *visitor) override;
    ShuLangNode*egressVisitor(ShuLangVisitor *visitor) override;
  };

  class ProgramNode : public ShuLangNode {
  public:
    std::vector<ShuLangNode*> nodes;

    std::vector<ShuLangNode*> children() override;
    childholder<ShuLangNode> ingressVisitor(ShuLangVisitor *visitor) override;
    ShuLangNode*egressVisitor(ShuLangVisitor *visitor) override;
  };

}