#include "RemoveComplexOperands.hpp"
#include "ShuIRAST.hpp"
#include "Uniquification.hpp"
#include <pybind11/pybind11.h>
#include <pybind11/stl.h>
#include <ASTNode.hpp>
#include <SelectInstructions.hpp>
#include <LLVMSelection.hpp>
#include <ShuLangAST.hpp>
#include <parser.hpp>
#include <tokenizer.hpp>

namespace py = pybind11;


shulang::ProgramNode* parse_file(std::string file) {
    std::ifstream myfile;
    myfile.open(file);

    std::vector<token> token_list;
    tokenize(myfile, token_list);
    myfile.close();

    shulang::ProgramNode* program = begin_parse(token_list, file);
    return program;
}

void uniquify(shulang::ProgramNode* ast) {
    Uniquification u;
    u.walk(ast);
}

void rco(shulang::ProgramNode* ast) {
    remove_complex_operands(ast->nodes);
}


PYBIND11_MODULE(shulang, m) {
    m.doc() = "Python binding for ShuC and the passes and AST's within";

    py::class_<ASTNode>(m, "ASTNode").def(py::init());
    // ShuLang's AST
    py::class_<shulang::ShuLangNode, ASTNode>(m, "ShuLangNode")
    .def("children", &shulang::ShuLangNode::children);

    // StatementNode
    py::class_<shulang::StatementNode, shulang::ShuLangNode>(m, "StatementNode")
    .def("children", &shulang::StatementNode::children);

    // PrintNode
    py::class_<shulang::PrintNode, shulang::StatementNode>(m, "PrintNode")
    .def(py::init<StatementNode*>())
    .def("children", &shulang::PrintNode::children)
    .def_readwrite("to_print", &shulang::PrintNode::to_print);
    
    // ValueNode
    py::class_<shulang::ValueNode, shulang::ShuLangNode>(m, "ValueNode");

    // IntegerNode
    py::class_<shulang::IntegerNode, shulang::ValueNode>(m, "IntegerNode")
    .def(py::init<int>())
    .def_readwrite("value", &shulang::IntegerNode::value);

    // VariableReferenceNode
    py::class_<shulang::VariableReferenceNode, shulang::ValueNode>(m, "VariableReferenceNode")
    .def("children", &shulang::VariableReferenceNode::children)
    .def(py::init<std::string>())
    .def_readwrite("identifier", &shulang::VariableReferenceNode::identifier);


    // Binding Node
    py::class_<shulang::BindingNode, shulang::StatementNode>(m, "BindingNode")
    .def("children", &shulang::BindingNode::children)
    .def_readwrite("name", &shulang::BindingNode::name)
    .def_readwrite("ty", &shulang::BindingNode::ty)
    .def_readwrite("value", &shulang::BindingNode::value);

    // Operator Application Node
    py::class_<shulang::OperatorApplicationNode, shulang::ValueNode>(m, "OperatorApplicationNode")
    .def("children", &shulang::OperatorApplicationNode::children)
    .def_readwrite("op", &shulang::OperatorApplicationNode::op)
    .def_readwrite("lhs", &shulang::OperatorApplicationNode::lhs)
    .def_readwrite("rhs", &shulang::OperatorApplicationNode::rhs);

    // ProgramNode
    py::class_<shulang::ProgramNode, shulang::ShuLangNode>(m, "ProgramNode")
    .def("children", &shulang::ProgramNode::children)
    .def_readwrite("nodes", &shulang::ProgramNode::nodes);

    // SIR's AST
    py::class_<shuir::SIRNode, ASTNode>(m, "SIRNode")
    .def("get_usages", &shuir::SIRNode::get_usages);

    py::class_<shuir::InstructionNode, shuir::SIRNode>(m, "InstructionNode");
    py::class_<shuir::ValueNode, shuir::SIRNode>(m, "SIRValueNode");

    py::class_<shuir::ImmediateNode, shuir::ValueNode>(m, "ImmediateNode")
    .def(py::init<int>())
    .def_readwrite("number", &shuir::ImmediateNode::number);

    py::class_<shuir::ReferenceNode, shuir::ValueNode>(m, "ReferenceNode")
    .def(py::init<std::string>())
    .def_readwrite("identifier", &shuir::ReferenceNode::identifier);

    py::class_<shuir::AddNode, shuir::ValueNode>(m, "AddNode")
    .def("get_usages", &shuir::AddNode::get_usages)
    .def_readwrite("lhs", &shuir::AddNode::lhs)
    .def_readwrite("rhs", &shuir::AddNode::rhs);

    py::class_<shuir::DefinitionNode, shuir::InstructionNode>(m, "DefinitionNode")
    .def(py::init<std::string, shuir::ValueNode*>())
    .def("get_usages", &shuir::DefinitionNode::get_usages)
    .def_readwrite("identifier", &shuir::DefinitionNode::identifier)
    .def_readwrite("binding", &shuir::DefinitionNode::binding);

    py::class_<shuir::PrintNode, shuir::InstructionNode>(m, "SIRPrintNode")
    .def(py::init<shuir::ValueNode*>())
    .def("get_usages", &shuir::PrintNode::get_usages)
    .def_readwrite("to_print", &shuir::PrintNode::to_print);

    py::class_<shuir::SIRBlock>(m, "SIRBlock")
    .def(py::init<std::string>())
    .def_readwrite("instructions", &shuir::SIRBlock::instructions)
    .def_readwrite("name", &shuir::SIRBlock::name);

    py::class_<shuir::ProgramNode, shuir::SIRNode>(m, "SIRProgramNode")
    .def("get_usages", &shuir::ProgramNode::get_usages)
    .def_readwrite("blocks", &shuir::ProgramNode::blocks);

    m.def("parse_file", &parse_file, "Given a file returns an AST");

    m.def("uniquify", &uniquify, "Runs the uniquification pass");

    m.def("remove_complex_operands", &rco, "Runs the remove complex operands pass");

    m.def("select_instructions", &select_SIR_instructions, "Translated from ShuLang to SIR");

    m.def("select_llvm", &select_llvm_instructions, "Perform the final lowering!!!");
}