#include "RemoveComplexOperands.hpp"
#include "Uniquification.hpp"
#include <pybind11/pybind11.h>
#include <pybind11/stl.h>
#include <ASTNode.hpp>
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
    m.doc() = "Python binding for ShuLang's AST";

    py::class_<ASTNode>(m, "ASTNode").def(py::init());



    py::class_<shulang::ShuLangNode, ASTNode>(m, "ShuLangNode")
    .def("children", &shulang::ShuLangNode::children);

    // StatementNode
    py::class_<shulang::StatementNode, shulang::ShuLangNode>(m, "Statement")
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

    m.def("parse_file", &parse_file, "Given a file returns an AST");

    m.def("uniquify", &uniquify, "Runs the uniquification pass");

    m.def("remove_complex_operands", &rco, "Runs the remove complex operands pass");
}