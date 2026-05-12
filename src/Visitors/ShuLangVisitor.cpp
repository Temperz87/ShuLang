#include <ShuLangAST.hpp>
#include <ShuLangVisitor.hpp>
#include <stdexcept>

using namespace shulang;

void ShuLangVisitor::descendIntoChildren(ShuLangNode* node) {
    for (ShuLangNode* node : node->children()) {
        node->accept(this);
    }
}

void ShuLangVisitor::visitNode(ShuLangNode* node) { throw std::runtime_error("Unimplemented node visit"); }
void ShuLangVisitor::visitNode(StatementNode* node) { descendIntoChildren(node); }
void ShuLangVisitor::visitNode(ValueNode* node) { descendIntoChildren(node); }
void ShuLangVisitor::visitNode(IntegerNode* node) { descendIntoChildren(node); }
void ShuLangVisitor::visitNode(BooleanNode* node) { descendIntoChildren(node); }
void ShuLangVisitor::visitNode(VariableReferenceNode* node) { descendIntoChildren(node); }
void ShuLangVisitor::visitNode(BindingNode* node) { descendIntoChildren(node); }
void ShuLangVisitor::visitNode(OperatorApplicationNode* node) { descendIntoChildren(node); }
void ShuLangVisitor::visitNode(NotNode* node) { descendIntoChildren(node); }
void ShuLangVisitor::visitNode(BeginNode* node) { descendIntoChildren(node); }
void ShuLangVisitor::visitNode(SelectOperatorNode* node) { descendIntoChildren(node); }
void ShuLangVisitor::visitNode(CallNode* node) { descendIntoChildren(node); }
void ShuLangVisitor::visitNode(BodyNode* node) { descendIntoChildren(node); }
void ShuLangVisitor::visitNode(IfNode* node) { descendIntoChildren(node); }
void ShuLangVisitor::visitNode(WhileNode* node) { descendIntoChildren(node); }
void ShuLangVisitor::visitNode(ProgramNode* node) { descendIntoChildren(node); }
