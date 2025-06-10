#include <ShuLangAST.hpp>
#include <ShuLangPrinter.hpp>
#include <ShuLangVisitor.hpp>
#include <iostream>
#include <vector>

using namespace shulang;

ShuLangPrinter::ShuLangPrinter() { }
ShuLangPrinter::~ShuLangPrinter() { }
ShuLangPrinter::ASTHolder ShuLangPrinter::ingressProgramNode(ProgramNode* node, int childcount) {
    std::cout << "PROGRAM" << std::endl;
    indentation += 1;
    return ShuLangVisitor::ingressProgramNode(node, childcount);
}

ShuLangNode* ShuLangPrinter::egressProgramNode(ProgramNode* node) {
    indentation -= 1;
    return ShuLangVisitor::egressProgramNode(node);
}

ShuLangPrinter::ASTHolder ShuLangPrinter::ingressBindingNode(BindingNode* node, int childcount) { 
    printIndentation();
    std::cout << "BIND(" << node->name << ", " << node->ty << ") to " << std::endl; 
    indentation += 1;
    return ShuLangVisitor::ingressBindingNode(node, childcount); 
}

ShuLangNode* ShuLangPrinter::egressBindingNode(BindingNode* node)  {
    indentation -= 1;
    return ShuLangVisitor::egressBindingNode(node);
}

ShuLangPrinter::ASTHolder ShuLangPrinter::ingressVariableReferenceNode(VariableReferenceNode* node, int childcount)  {
    printIndentation();
    std::cout << "VARIABLE_REFERENCE(" << node->identifier << ")" << std::endl;
    return ShuLangVisitor::ingressVariableReferenceNode(node, childcount);
}

ShuLangPrinter::ASTHolder ShuLangPrinter::ingressIntegerNode(IntegerNode* node, int childcount)  {
    printIndentation();
    std::cout << "INTEGER(" << node->value << ")" << std::endl;
    return ShuLangVisitor::ingressIntegerNode(node, childcount);
}

ShuLangPrinter::ASTHolder ShuLangPrinter::ingressPrintNode(PrintNode* node, int childcount)  {
    printIndentation();
    std::cout << "PRINT" << std::endl;
    indentation += 1;
    return ShuLangVisitor::ingressPrintNode(node, childcount);
}

ShuLangNode* ShuLangPrinter::egressPrintNode(PrintNode* node)  {
    indentation -= 1;
    return ShuLangVisitor::egressPrintNode(node);
}

ShuLangPrinter::ASTHolder ShuLangPrinter::ingressOperatorApplicationNode(OperatorApplicationNode* node, int childcount)  {
    printIndentation();
    std::cout << "OPERATOR(" << node->op << ")" << std::endl;
    indentation += 1;
    return ShuLangVisitor::ingressOperatorApplicationNode(node, childcount);
}

ShuLangNode* ShuLangPrinter::egressOperatorApplicationNode(OperatorApplicationNode* node)  {
    indentation -= 1;
    return ShuLangVisitor::egressOperatorApplicationNode(node);
}