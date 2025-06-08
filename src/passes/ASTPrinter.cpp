#include <AST.hpp>
#include <ASTPrinter.hpp>
#include <ASTVisitor.hpp>
#include <iostream>
#include <vector>

ASTPrinter::ASTPrinter() { }
ASTPrinter::~ASTPrinter() { }
ASTPrinter::ASTHolder ASTPrinter::ingressProgramNode(ProgramNode* node, int childcount) {
    std::cout << "PROGRAM" << std::endl;
    indentation += 1;
    return ASTVisitor::ingressProgramNode(node, childcount);
}

ASTNode* ASTPrinter::egressProgramNode(ProgramNode* node, std::vector<ASTNode*> children) {
    indentation -= 1;
    return ASTVisitor::egressProgramNode(node, children);
}

ASTPrinter::ASTHolder ASTPrinter::ingressBindingNode(BindingNode* node, int childcount) { 
    printIndentation();
    std::cout << "BIND(" << node->name << ", " << node->ty << ") to " << std::endl; 
    indentation += 1;
    return ASTVisitor::ingressBindingNode(node, childcount); 
}

ASTNode* ASTPrinter::egressBindingNode(BindingNode* node, std::vector<ASTNode*> children)  {
    indentation -= 1;
    return ASTVisitor::egressBindingNode(node, children);
}

ASTPrinter::ASTHolder ASTPrinter::ingressVariableReferenceNode(VariableReferenceNode* node, int childcount)  {
    printIndentation();
    std::cout << "VARIABLE_REFERENCE(" << node->identifier << ")" << std::endl;
    return ASTVisitor::ingressVariableReferenceNode(node, childcount);
}

ASTPrinter::ASTHolder ASTPrinter::ingressIntegerNode(IntegerNode* node, int childcount)  {
    printIndentation();
    std::cout << "INTEGER(" << node->value << ")" << std::endl;
    return ASTVisitor::ingressIntegerNode(node, childcount);
}

ASTPrinter::ASTHolder ASTPrinter::ingressPrintNode(PrintNode* node, int childcount)  {
    printIndentation();
    std::cout << "PRINT" << std::endl;
    indentation += 1;
    return ASTVisitor::ingressPrintNode(node, childcount);
}

ASTNode* ASTPrinter::egressPrintNode(PrintNode* node, std::vector<ASTNode*> children)  {
    indentation -= 1;
    return ASTVisitor::egressPrintNode(node, children);
}

ASTPrinter::ASTHolder ASTPrinter::ingressOperatorApplicationNode(OperatorApplicationNode* node, int childcount)  {
    printIndentation();
    std::cout << "OPERATOR(" << node->op << ")" << std::endl;
    indentation += 1;
    return ASTVisitor::ingressOperatorApplicationNode(node, childcount);
}

ASTNode* ASTPrinter::egressOperatorApplicationNode(OperatorApplicationNode* node, std::vector<ASTNode*> children)  {
    indentation -= 1;
    return ASTVisitor::egressOperatorApplicationNode(node, children);
}