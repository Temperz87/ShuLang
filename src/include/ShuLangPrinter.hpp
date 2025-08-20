// #pragma once

// #include "ShuLangAST.hpp"
// #include "ShuLangVisitor.hpp"
// #include <iostream>

// class ShuLangPrinter : public ShuLangVisitor {
//     private:
//         int indentation = 0;
//         void printIndentation() {
//             for (int i = 0; i < this->indentation; i++) {
//                 std::cout << "  ";
//             }
//         }

//     public: 
//         ShuLangPrinter();
//         ~ShuLangPrinter();
//         ASTHolder ingressProgramNode(ProgramNode* node, int childcount) override;
//         ShuLangNode* egressProgramNode(ProgramNode* node) override;
//         ASTHolder ingressBindingNode(BindingNode* node, int childcount) override;
//         ShuLangNode* egressBindingNode(BindingNode* node) override;
//         ASTHolder ingressVariableReferenceNode(VariableReferenceNode* node, int childcount) override;
//         ASTHolder ingressIntegerNode(IntegerNode* node, int childcount) override;
//         ASTHolder ingressPrintNode(PrintNode* node, int childcount) override;
//         ShuLangNode* egressPrintNode(PrintNode* node) override;
//         ASTHolder ingressOperatorApplicationNode(OperatorApplicationNode* node, int childcount) override;
//         ShuLangNode* egressOperatorApplicationNode(OperatorApplicationNode* node) override;
//         ASTHolder ingressIfNode(IfNode* node, int childcount) override;
//         ShuLangNode* egressIfNode(IfNode* node) override;
// };