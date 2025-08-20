#include <pybind11/pybind11.h>
#include <pybind11/stl.h>
#include <ShuLangPasses.hpp>
#include <SIRAST.hpp>
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
    .def_readwrite("name", &shulang::BindingNode::identifier)
    .def_readwrite("ty", &shulang::BindingNode::type)
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

    // Select Value Node
    py::class_<shulang::BeginNode, shulang::ShuLangNode, std::shared_ptr<shulang::BeginNode>>(m, "BeginNode")
    .def("children", &shulang::BeginNode::children)
    .def_readwrite("statements", &shulang::BeginNode::statements)
    .def_readwrite("end_value", &shulang::BeginNode::end_value);

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
    py::class_<sir::SIRNode, ASTNode, std::shared_ptr<sir::SIRNode>>(m, "SIRNode")
    .def("get_usages", &sir::SIRNode::get_usages);

    py::class_<sir::InstructionNode, sir::SIRNode, std::shared_ptr<sir::InstructionNode>>(m, "InstructionNode");
    py::class_<sir::ValueNode, sir::SIRNode, std::shared_ptr<sir::ValueNode>>(m, "SIRValueNode");

    py::class_<sir::ImmediateNode, sir::ValueNode, std::shared_ptr<sir::ImmediateNode>>(m, "ImmediateNode")
    .def(py::init<int, int>())
    .def_readwrite("number", &sir::ImmediateNode::number)
    .def_readwrite("width", &sir::ImmediateNode::width);

    py::class_<sir::ReferenceNode, sir::ValueNode, std::shared_ptr<sir::ReferenceNode>>(m, "ReferenceNode")
    .def(py::init<std::string, int>())
    .def("get_usages", &sir::ReferenceNode::get_usages)
    .def_readwrite("width", &sir::ReferenceNode::width)
    .def_readwrite("identifier", &sir::ReferenceNode::identifier);

    py::class_<sir::SelectNode, sir::ValueNode, std::shared_ptr<sir::SelectNode>>(m, "SelectNode")
    .def("get_usages", &sir::SelectNode::get_usages)
    .def_readwrite("condition", &sir::SelectNode::condition)
    .def_readwrite("true_value", &sir::SelectNode::true_value)
    .def_readwrite("false_value", &sir::SelectNode::false_value);

    py::class_<sir::BinOpNode, sir::ValueNode, std::shared_ptr<sir::BinOpNode>>(m, "BinOpNode")
    .def("get_usages", &sir::BinOpNode::get_usages)
    .def_readwrite("lhs", &sir::BinOpNode::lhs)
    .def_readwrite("rhs", &sir::BinOpNode::rhs);

    py::class_<sir::AddNode, sir::BinOpNode, std::shared_ptr<sir::AddNode>>(m, "AddNode")
    .def("get_usages", &sir::AddNode::get_usages)
    .def_readwrite("lhs", &sir::AddNode::lhs)
    .def_readwrite("rhs", &sir::AddNode::rhs);

    py::class_<sir::SubNode, sir::BinOpNode, std::shared_ptr<sir::SubNode>>(m, "SubNode")
    .def("get_usages", &sir::SubNode::get_usages)
    .def_readwrite("lhs", &sir::SubNode::lhs)
    .def_readwrite("rhs", &sir::SubNode::rhs);

    py::class_<sir::MultNode, sir::BinOpNode, std::shared_ptr<sir::MultNode>>(m, "MultNode")
    .def("get_usages", &sir::MultNode::get_usages)
    .def_readwrite("lhs", &sir::MultNode::lhs)
    .def_readwrite("rhs", &sir::MultNode::rhs);

    py::class_<sir::CmpNode, sir::BinOpNode, std::shared_ptr<sir::CmpNode>>(m, "CmpNode")
    .def("get_usages", &sir::CmpNode::get_usages)
    .def_readwrite("op", &sir::CmpNode::op)
    .def_readwrite("lhs", &sir::CmpNode::lhs)
    .def_readwrite("rhs", &sir::CmpNode::rhs);

    py::class_<sir::PseudoPhiNode, sir::ValueNode, std::shared_ptr<sir::PseudoPhiNode>>(m, "PseudoPhiNode")
    .def(py::init<std::string, int>())
    .def("get_usages", &sir::PseudoPhiNode::get_usages)
    .def_readwrite("requested_previous", &sir::PseudoPhiNode::requested_previous);

    py::class_<sir::PhiNode, sir::ValueNode, std::shared_ptr<sir::PhiNode>>(m, "PhiNode")
    .def(py::init<std::vector<std::pair<std::string, std::shared_ptr<sir::ValueNode>>>, int>())
    .def("get_usages", &sir::PhiNode::get_usages)
    .def_readwrite("candidates", &sir::PhiNode::candidates);

    py::class_<sir::DefinitionNode, sir::InstructionNode, std::shared_ptr<sir::DefinitionNode>>(m, "DefinitionNode")
    .def(py::init<std::string, std::shared_ptr<sir::ValueNode>>())
    .def("get_usages", &sir::DefinitionNode::get_usages)
    .def_readwrite("identifier", &sir::DefinitionNode::identifier)
    .def_readwrite("width", &sir::DefinitionNode::width)
    .def_readwrite("binding", &sir::DefinitionNode::binding);

    py::class_<sir::PrintNode, sir::InstructionNode, std::shared_ptr<sir::PrintNode>>(m, "SIRPrintNode")
    .def(py::init<std::shared_ptr<sir::ValueNode>, std::string>())
    .def("get_usages", &sir::PrintNode::get_usages)
    .def_readwrite("to_print", &sir::PrintNode::to_print)
    .def_readwrite("print_type", &sir::PrintNode::print_type);

    py::class_<sir::JumpNode, sir::InstructionNode, std::shared_ptr<sir::JumpNode>>(m, "JumpNode")
    .def(py::init<std::shared_ptr<sir::SIRBlock>>())
    .def("get_usages", &sir::JumpNode::get_usages)
    .def_readwrite("destination", &sir::JumpNode::destination);

    py::class_<sir::JumpIfElseNode, sir::JumpNode, std::shared_ptr<sir::JumpIfElseNode>>(m, "JumpIfElseNode")
    .def(py::init<std::shared_ptr<sir::SIRBlock>, std::shared_ptr<sir::SIRBlock>, std::shared_ptr<sir::ValueNode>>())
    .def("get_usages", &sir::JumpIfElseNode::get_usages)
    .def_readwrite("destination", &sir::JumpIfElseNode::destination)
    .def_readwrite("else_destination", &sir::JumpIfElseNode::else_destination)
    .def_readwrite("condition", &sir::JumpIfElseNode::condition);


    py::class_<sir::SIRBlock, std::shared_ptr<sir::SIRBlock>>(m, "SIRBlock")
    .def(py::init<std::string>())
    .def_readwrite("instructions", &sir::SIRBlock::instructions)
    .def_readwrite("variable_to_ref", &sir::SIRBlock::variable_to_ref)
    .def_readwrite("name", &sir::SIRBlock::name);

    py::class_<sir::ExitNode, sir::InstructionNode, std::shared_ptr<sir::ExitNode>>(m, "ExitNode")
    .def("get_usages", &sir::ExitNode::get_usages);

    py::class_<sir::ProgramNode, sir::SIRNode, std::shared_ptr<sir::ProgramNode>>(m, "SIRProgramNode")
    .def("get_usages", &sir::ProgramNode::get_usages)
    .def_readwrite("blocks", &sir::ProgramNode::blocks);

    m.def("parse_file", &parse_file, "Given a file returns an AST");
    m.def("type_check", &type_check, "Given a program type check it");
    m.def("uniquify", &uniquify, "Runs the uniquification pass");
    m.def("short_circuitify", &short_circuitify, "Runs the funny short circuit pass");
    m.def("remove_complex_operands", &remove_complex_operands, "Runs the remove complex operands pass");
    m.def("select_instructions", &select_SIR_instructions, "Translated from ShuLang to SIR");
    m.def("promote_pseudo_phi", &promote_pseudo_phi, "Making PseudoPhiNode's just PhiNode's");
    m.def("select_llvm", &select_llvm_instructions, "Perform the final lowering!!!");
}