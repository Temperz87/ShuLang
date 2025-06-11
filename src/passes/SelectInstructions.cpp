#include <ShuLangAST.hpp>
#include <ShuLangVisitor.hpp>
#include <ShuIRAST.hpp>
#include <ShuLangVisitor.hpp>
#include <string>

class SLTranslator : public ShuLangVisitor {
    private:
        // This is a bad idea
        // I should not do this
        // But I'll fix it later...
        shuir::SIRBlock& current_block;

        // Every instruction currently has a one to one translation into the IR
        // Hence this being viable until we add booleans and conditionals
        std::vector<shuir::ValueNode*> completed;

    public:
        SLTranslator(shuir::SIRBlock& block):current_block(block) { };
    
        shulang::ShuLangNode* egressIntegerNode(shulang::IntegerNode* node) {
            shuir::ImmediateNode* imm = new shuir::ImmediateNode(node->value);
            completed.push_back(imm);
            return ShuLangVisitor::egressIntegerNode(node);
        }

        shulang::ShuLangNode* egressVariableReferenceNode(shulang::VariableReferenceNode* node) {
            shuir::ReferenceNode* ref = new shuir::ReferenceNode(node->identifier);
            completed.push_back(ref);
            return ShuLangVisitor::egressVariableReferenceNode(node);
        }

        shulang::ShuLangNode* egressOperatorApplicationNode(shulang::OperatorApplicationNode* node) {
            if (node->op == "+") {
                shuir::AddNode* add = new shuir::AddNode();
                add->lhs = completed.at(0);
                add->rhs = completed.at(1);
                completed.clear();
                completed.push_back(add);
            }
            else {
                // TODO: More operators
            }
            return ShuLangVisitor::egressOperatorApplicationNode(node);
        }

        // The only top level nodes we can have at this point
        // Are binding nodes and print nodes
        // And incidentally they can also only appear as top level statements
        shulang::ShuLangNode* egressBindingNode(shulang::BindingNode* node) {
            shuir::DefinitionNode* def = new shuir::DefinitionNode(node->name, completed.at(0));
            // Becauase the value isn't complex
            // We can ALWAYS use the completed vector
            // And assume it has the exact right size 
            completed.clear();
            current_block.instructions.push_back(def);
            return ShuLangVisitor::egressBindingNode(node);
        }

        shulang::ShuLangNode* egressPrintNode(shulang::PrintNode* node) {
            shuir::PrintNode* print = new shuir::PrintNode(completed.at(0));
            completed.clear();
            current_block.instructions.push_back(print);
            return ShuLangVisitor::egressPrintNode(node);
        }
};

shuir::ProgramNode select_SIR_instructions(shulang::ProgramNode* sl_program) {
    // We don't have functions yet so we only have one block
    shuir::SIRBlock block = shuir::SIRBlock("main");
    SLTranslator translator = SLTranslator(block);
    for (shulang::ShuLangNode* node : sl_program->nodes) {
        translator.walk(node);
    }
    shuir::ProgramNode node = shuir::ProgramNode();
    node.blocks.push_back(block);
    return node;
}