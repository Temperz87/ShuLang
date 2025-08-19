#include <pybind11/pybind11.h>
#include <pybind11/stl.h>
#include <ShuLangPasses.hpp>
#include <ShuIRAST.hpp>
#include <memory>
#include <ASTNode.hpp>
#include <PromotePseudoPhi.hpp>
#include <SelectInstructions.hpp>
#include <LLVMSelection.hpp>
#include <ShuLangAST.hpp>
#include <parser.hpp>
#include <tokenizer.hpp>
#include <TypeChecker.hpp>

namespace py = pybind11;

std::shared_ptr<shulang::ProgramNode> parse_file(std::string file) {
    std::ifstream myfile;
    myfile.open(file);

    std::vector<token> token_list;
    tokenize(myfile, token_list);
    myfile.close();

    return begin_parse(token_list, file);
}

void type_check(shulang::ProgramNode* ast) {
    TypeChecker tyc;
    tyc.walk(ast);
}

PYBIND11_MODULE(shulang, m) {
    m.doc() = "Python binding for ShuC and the passes and AST's within";

    py::class_<ASTNode, std::shared_ptr<ASTNode>>(m, "ASTNode").def(py::init());
    // ShuLang's AST

    py::class_<shulang::ShuLangNode, ASTNode, std::shared_ptr<shulang::ShuLangNode>>(m, "ShuLangNode")
    .def("children", &shulang::ShuLangNode::children);

    // StatementNode
    py::class_<shulang::StatementNode, shulang::ShuLangNode, std::shared_ptr<shulang::StatementNode>>(m, "StatementNode")
    .def("children", &shulang::StatementNode::children);

    // ValueNode
    py::class_<shulang::ValueNode, shulang::ShuLangNode, std::shared_ptr<shulang::ValueNode>>(m, "ValueNode");

    // PrintNode
    py::class_<shulang::PrintNode, shulang::StatementNode, std::shared_ptr<shulang::PrintNode>>(m, "PrintNode")
    .def(py::init<std::shared_ptr<ValueNode>>())
    .def("children", &shulang::PrintNode::children)
    .def_readwrite("to_print", &shulang::PrintNode::to_print);
    
    // IntegerNode
    py::class_<shulang::IntegerNode, shulang::ValueNode, std::shared_ptr<shulang::IntegerNode>>(m, "IntegerNode")
    .def(py::init<int>())
    .def_readwrite("value", &shulang::IntegerNode::value);

    // BooleanNode
    py::class_<shulang::BooleanNode, shulang::ValueNode, std::shared_ptr<shulang::BooleanNode>>(m, "BooleanNode")
    .def(py::init<bool>())
    .def_readwrite("value", &shulang::BooleanNode::value);

    // VariableReferenceNode
    py::class_<shulang::VariableReferenceNode, shulang::ValueNode, std::shared_ptr<shulang::VariableReferenceNode>>(m, "VariableReferenceNode")
    .def("children", &shulang::VariableReferenceNode::children)
    .def(py::init<std::string>())
    .def_readwrite("identifier", &shulang::VariableReferenceNode::identifier);

    // Binding Node
    py::class_<shulang::BindingNode, shulang::StatementNode, std::shared_ptr<shulang::BindingNode>>(m, "BindingNode")
    .def("children", &shulang::BindingNode::children)
    .def_readwrite("name", &shulang::BindingNode::name)
    .def_readwrite("ty", &shulang::BindingNode::ty)
    .def_readwrite("value", &shulang::BindingNode::value);

    // Operator Application Node
    py::class_<shulang::OperatorApplicationNode, shulang::ValueNode, std::shared_ptr<shulang::OperatorApplicationNode>>(m, "OperatorApplicationNode")
    .def("children", &shulang::OperatorApplicationNode::children)
    .def_readwrite("op", &shulang::OperatorApplicationNode::op)
    .def_readwrite("lhs", &shulang::OperatorApplicationNode::lhs)
    .def_readwrite("rhs", &shulang::OperatorApplicationNode::rhs);

    // Not Node
    py::class_<shulang::NotNode, shulang::ValueNode, std::shared_ptr<shulang::NotNode>>(m, "NotNode")
    .def("children", &shulang::NotNode::children)
    .def_readwrite("value", &shulang::NotNode::value);

    // Select Operator Node
    py::class_<shulang::SelectOperatorNode, shulang::ValueNode, std::shared_ptr<shulang::SelectOperatorNode>>(m, "SelectOperatorNode")
    .def("children", &shulang::SelectOperatorNode::children)
    .def_readwrite("condition", &shulang::SelectOperatorNode::condition)
    .def_readwrite("true_value", &shulang::SelectOperatorNode::true_value)
    .def_readwrite("false_value", &shulang::SelectOperatorNode::false_value);

    // IfNode
    py::class_<shulang::IfNode, shulang::ShuLangNode, std::shared_ptr<shulang::IfNode>>(m, "IfNode")
    .def("children", &shulang::IfNode::children)
    .def_readwrite("then_block", &shulang::IfNode::then_block)
    .def_readwrite("else_block", &shulang::IfNode::else_block)
    .def_readwrite("condition", &shulang::IfNode::condition);

    // BodyNode
    py::class_<shulang::BodyNode, shulang::ShuLangNode, std::shared_ptr<shulang::BodyNode>>(m, "BodyNode")
    .def("children", &shulang::BodyNode::children)
    .def_readwrite("nodes", &shulang::BodyNode::nodes);

    // ProgramNode
    py::class_<shulang::ProgramNode, shulang::BodyNode, std::shared_ptr<shulang::ProgramNode>>(m, "ProgramNode")
    .def("children", &shulang::ProgramNode::children)
    .def_readwrite("nodes", &shulang::ProgramNode::nodes);

    // SIR's AST
    py::class_<shuir::SIRNode, ASTNode, std::shared_ptr<shuir::SIRNode>>(m, "SIRNode")
    .def("get_usages", &shuir::SIRNode::get_usages);

    py::class_<shuir::InstructionNode, shuir::SIRNode, std::shared_ptr<shuir::InstructionNode>>(m, "InstructionNode");
    py::class_<shuir::ValueNode, shuir::SIRNode, std::shared_ptr<shuir::ValueNode>>(m, "SIRValueNode");

    py::class_<shuir::ImmediateNode, shuir::ValueNode, std::shared_ptr<shuir::ImmediateNode>>(m, "ImmediateNode")
    .def(py::init<int, int>())
    .def_readwrite("number", &shuir::ImmediateNode::number)
    .def_readwrite("width", &shuir::ImmediateNode::width);

    py::class_<shuir::ReferenceNode, shuir::ValueNode, std::shared_ptr<shuir::ReferenceNode>>(m, "ReferenceNode")
    .def(py::init<std::string, int>())
    .def("get_usages", &shuir::ReferenceNode::get_usages)
    .def_readwrite("width", &shuir::ReferenceNode::width)
    .def_readwrite("identifier", &shuir::ReferenceNode::identifier);

    py::class_<shuir::SelectNode, shuir::ValueNode, std::shared_ptr<shuir::SelectNode>>(m, "SelectNode")
    .def("get_usages", &shuir::SelectNode::get_usages)
    .def_readwrite("condition", &shuir::SelectNode::condition)
    .def_readwrite("true_value", &shuir::SelectNode::true_value)
    .def_readwrite("false_value", &shuir::SelectNode::false_value);

    py::class_<shuir::BinOpNode, shuir::ValueNode, std::shared_ptr<shuir::BinOpNode>>(m, "BinOpNode")
    .def("get_usages", &shuir::BinOpNode::get_usages)
    .def_readwrite("lhs", &shuir::BinOpNode::lhs)
    .def_readwrite("rhs", &shuir::BinOpNode::rhs);

    py::class_<shuir::AddNode, shuir::BinOpNode, std::shared_ptr<shuir::AddNode>>(m, "AddNode")
    .def("get_usages", &shuir::AddNode::get_usages)
    .def_readwrite("lhs", &shuir::AddNode::lhs)
    .def_readwrite("rhs", &shuir::AddNode::rhs);

    py::class_<shuir::SubNode, shuir::BinOpNode, std::shared_ptr<shuir::SubNode>>(m, "SubNode")
    .def("get_usages", &shuir::SubNode::get_usages)
    .def_readwrite("lhs", &shuir::SubNode::lhs)
    .def_readwrite("rhs", &shuir::SubNode::rhs);

    py::class_<shuir::MultNode, shuir::BinOpNode, std::shared_ptr<shuir::MultNode>>(m, "MultNode")
    .def("get_usages", &shuir::MultNode::get_usages)
    .def_readwrite("lhs", &shuir::MultNode::lhs)
    .def_readwrite("rhs", &shuir::MultNode::rhs);

    py::class_<shuir::CmpNode, shuir::BinOpNode, std::shared_ptr<shuir::CmpNode>>(m, "CmpNode")
    .def("get_usages", &shuir::CmpNode::get_usages)
    .def_readwrite("op", &shuir::CmpNode::op)
    .def_readwrite("lhs", &shuir::CmpNode::lhs)
    .def_readwrite("rhs", &shuir::CmpNode::rhs);

    py::class_<shuir::PseudoPhiNode, shuir::ValueNode, std::shared_ptr<shuir::PseudoPhiNode>>(m, "PseudoPhiNode")
    .def(py::init<std::string, int>())
    .def("get_usages", &shuir::PseudoPhiNode::get_usages)
    .def_readwrite("requested_previous", &shuir::PseudoPhiNode::requested_previous);

    py::class_<shuir::PhiNode, shuir::ValueNode, std::shared_ptr<shuir::PhiNode>>(m, "PhiNode")
    .def(py::init<std::vector<std::pair<std::string, std::shared_ptr<shuir::ValueNode>>>, int>())
    .def("get_usages", &shuir::PhiNode::get_usages)
    .def_readwrite("candidates", &shuir::PhiNode::candidates);

    py::class_<shuir::DefinitionNode, shuir::InstructionNode, std::shared_ptr<shuir::DefinitionNode>>(m, "DefinitionNode")
    .def(py::init<std::string, std::shared_ptr<shuir::ValueNode>>())
    .def("get_usages", &shuir::DefinitionNode::get_usages)
    .def_readwrite("identifier", &shuir::DefinitionNode::identifier)
    .def_readwrite("width", &shuir::DefinitionNode::width)
    .def_readwrite("binding", &shuir::DefinitionNode::binding);

    py::class_<shuir::PrintNode, shuir::InstructionNode, std::shared_ptr<shuir::PrintNode>>(m, "SIRPrintNode")
    .def(py::init<std::shared_ptr<shuir::ValueNode>, std::string>())
    .def("get_usages", &shuir::PrintNode::get_usages)
    .def_readwrite("to_print", &shuir::PrintNode::to_print)
    .def_readwrite("print_type", &shuir::PrintNode::print_type);

    py::class_<shuir::JumpNode, shuir::InstructionNode, std::shared_ptr<shuir::JumpNode>>(m, "JumpNode")
    .def(py::init<std::shared_ptr<shuir::SIRBlock>>())
    .def("get_usages", &shuir::JumpNode::get_usages)
    .def_readwrite("destination", &shuir::JumpNode::destination);

    py::class_<shuir::JumpIfElseNode, shuir::JumpNode, std::shared_ptr<shuir::JumpIfElseNode>>(m, "JumpIfElseNode")
    .def(py::init<std::shared_ptr<shuir::SIRBlock>, std::shared_ptr<shuir::SIRBlock>, std::shared_ptr<shuir::ValueNode>>())
    .def("get_usages", &shuir::JumpIfElseNode::get_usages)
    .def_readwrite("destination", &shuir::JumpIfElseNode::destination)
    .def_readwrite("else_destination", &shuir::JumpIfElseNode::else_destination)
    .def_readwrite("condition", &shuir::JumpIfElseNode::condition);


    py::class_<shuir::SIRBlock, std::shared_ptr<shuir::SIRBlock>>(m, "SIRBlock")
    .def(py::init<std::string>())
    .def_readwrite("instructions", &shuir::SIRBlock::instructions)
    .def_readwrite("variable_to_ref", &shuir::SIRBlock::variable_to_ref)
    .def_readwrite("name", &shuir::SIRBlock::name);

    py::class_<shuir::ExitNode, shuir::InstructionNode, std::shared_ptr<shuir::ExitNode>>(m, "ExitNode")
    .def("get_usages", &shuir::ExitNode::get_usages);

    py::class_<shuir::ProgramNode, shuir::SIRNode, std::shared_ptr<shuir::ProgramNode>>(m, "SIRProgramNode")
    .def("get_usages", &shuir::ProgramNode::get_usages)
    .def_readwrite("blocks", &shuir::ProgramNode::blocks);

    m.def("parse_file", &parse_file, "Given a file returns an AST");
    m.def("type_check", &type_check, "Given a program type check it");
    m.def("uniquify", &uniquify, "Runs the uniquification pass");
    m.def("short_circuitify", &short_circuitify, "Runs the funny short circuit pass");
    m.def("remove_complex_operands", &remove_complex_operands, "Runs the remove complex operands pass");
    m.def("select_instructions", &select_SIR_instructions, "Translated from ShuLang to SIR");
    m.def("promote_pseudo_phi", &promote_pseudo_phi, "Making PseudoPhiNode's just PhiNode's");
    m.def("select_llvm", &select_llvm_instructions, "Perform the final lowering!!!");
}