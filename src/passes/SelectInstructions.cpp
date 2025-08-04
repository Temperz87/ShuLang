#include <ShuLangAST.hpp>
#include <ShuLangVisitor.hpp>
#include <ShuIRAST.hpp>
#include <ShuLangVisitor.hpp>
#include <iostream>
#include <memory>
#include <stack>
#include <string>
#include <vector>

class SLTranslator : public ShuLangVisitor {
    typedef struct {
        std::shared_ptr<shuir::SIRBlock> block;
        std::shared_ptr<shuir::SIRBlock> continuation;
        shulang::BodyNode* node;
    } block_cont_node_t;

    private:
        // Stores completed values, right now only integers
        std::stack<std::shared_ptr<shuir::ValueNode>> completed;

        // Stores the next blocks and where to go afterwards
        std::stack<block_cont_node_t> next_block_stack;

        std::shared_ptr<shuir::SIRBlock> current_block;
        std::shared_ptr<shuir::SIRBlock> continuation = nullptr;
        // Node tells us which body node the current block corresponds to
        // So we don't accidentally egress too soon
        // (e.g. an if statement that only contains a nested if statement)
        shulang::BodyNode* node = nullptr;

        std::string gen_block_name(std::string name) {
            static int counter = 0;
            return name + std::to_string(counter++);
        }

    public:
        std::vector<std::shared_ptr<shuir::SIRBlock>> blocks;

        SLTranslator(std::string initial_block_name) { 
            current_block = std::make_unique<shuir::SIRBlock>(initial_block_name);
            blocks.push_back(current_block);
        };
    
        shulang::ShuLangNode* egressIntegerNode(shulang::IntegerNode* node) override {
            std::shared_ptr<shuir::ImmediateNode> imm = std::make_shared<shuir::ImmediateNode>(node->value);
            completed.push(imm);
            return ShuLangVisitor::egressIntegerNode(node);
        }

        shulang::ShuLangNode* egressBooleanNode(shulang::BooleanNode* node) override {
            std::shared_ptr<shuir::ImmediateNode> ret;
            // So in our langauge we treat 0 as false and 1 as true
            // when we're at such a low level
            if (node->value) {
                ret = std::make_shared<shuir::ImmediateNode>(1);
            }
            else {
                ret = std::make_shared<shuir::ImmediateNode>(0);
            }
            completed.push(ret);
            return ShuLangVisitor::egressBooleanNode(node);
        }

        shulang::ShuLangNode* egressVariableReferenceNode(shulang::VariableReferenceNode* node) override {
            std::shared_ptr<shuir::ReferenceNode> ref = std::make_shared<shuir::ReferenceNode>(node->identifier);
            completed.push(ref);
            return ShuLangVisitor::egressVariableReferenceNode(node);
        }

        shulang::ShuLangNode* egressOperatorApplicationNode(shulang::OperatorApplicationNode* node) override {
            std::shared_ptr<shuir::BinOpNode> ret;

            if (node->op == "+") {
                ret = std::make_shared<shuir::AddNode>();
            }
            else if (node->op == "-") {
                ret = std::make_shared<shuir::SubNode>();
            }
            else if (node->op == "*") {
                ret = std::make_shared<shuir::MultNode>();
            }
            else {
                // TODO: Validate operator is < or <= or = or != or > or >= or and or or
                ret = std::make_shared<shuir::CmpNode>(node->op);
            }
            ret->rhs = completed.top();
            completed.pop();
            ret->lhs = completed.top();
            completed.pop();
            completed.push(ret);
            return ShuLangVisitor::egressOperatorApplicationNode(node);
        }

        // The only top level nodes we can have at this point are statements
        // Because I don't wanna do s-expressions
        shulang::ShuLangNode* egressBindingNode(shulang::BindingNode* node) override {
            // std::cout << "Creating binding node!" << std::endl;
            std::shared_ptr<shuir::DefinitionNode> def = std::make_shared<shuir::DefinitionNode>(node->name, completed.top());
            completed.pop();
            // Becauase the value isn't complex
            // We can ALWAYS use the completed vector
            // And assume it has the exact right size 
            current_block->instructions.push_back(def);
            return ShuLangVisitor::egressBindingNode(node);
        }

        shulang::ShuLangNode* egressPrintNode(shulang::PrintNode* node) override {
            // std::cout << "Making print node " << std::endl;
            std::shared_ptr<shuir::PrintNode> print = std::make_shared<shuir::PrintNode>(completed.top(), node->to_print->type);
            completed.pop();
            current_block->instructions.push_back(print);
            return ShuLangVisitor::egressPrintNode(node);
        }

        shulang::ShuLangNode* egressBodyNode(shulang::BodyNode* node) override {
            // We check if the current block is owned by the node we're egressing
            // If it's not then we don't do anything else
            // If we don't know who owns the current block (nullptr)
            //    Always pop it off
            // This is useful in situations such as if (cond) { body } else if ...
            //    As egress if will also change the current block 
            if (this->node != nullptr && this->node != node) {
                // std::cout << "Not popping block " << current_block->name << std::endl;
                return ShuLangVisitor::egressBodyNode(node);
            }

            // std::cout << "Popping block " << current_block->name << std::endl;
            if (continuation != nullptr) {
                current_block->instructions.push_back(std::make_shared<shuir::JumpNode>(continuation));
            }
            else {
                // std::cout << "\tBlock " << current_block->name << " has no continuation!" << std::endl;
            }

            current_block = next_block_stack.top().block;
            continuation = next_block_stack.top().continuation;
            this->node = next_block_stack.top().node;
            // std::cout << "\tNow on block " << current_block->name << std::endl;
            next_block_stack.pop();

            return ShuLangVisitor::egressBodyNode(node);
        }

        shulang::ShuLangNode* egressIfNode(shulang::IfNode* node) override {
            // std::cout << "Egress if node!!!" << std::endl;
            // TODO: Make the continuation block iff there's more instructions

            // We store what happens after the if in a new block
            // In order to avoid code duplication and exponential file size
            if (continuation == nullptr) {
                // No need to remake the continuation if it already exists
                continuation = std::make_shared<shuir::SIRBlock>(gen_block_name("continuation"));
                blocks.push_back(continuation);
                next_block_stack.push({continuation, nullptr, nullptr});
            }

            std::shared_ptr<shuir::SIRBlock> then_block = std::make_shared<shuir::SIRBlock>(gen_block_name("then"));
            blocks.push_back(then_block);
            std::shared_ptr<shuir::SIRBlock> else_destination = continuation;

            if (node->else_block != nullptr) {
                std::shared_ptr<shuir::SIRBlock> else_block = std::make_shared<shuir::SIRBlock>(gen_block_name("else"));
                blocks.push_back(else_block);
                next_block_stack.push({else_block, continuation, node->else_block.get()});
                else_destination = else_block;
            }

            std::shared_ptr<shuir::JumpIfElseNode> if_else = std::make_shared<shuir::JumpIfElseNode>(then_block, else_destination, completed.top());
            current_block->instructions.push_back(if_else);
        
            // The visitor well next visit the then_block
            // So we set current block to be the then_block
            current_block = then_block;
            // The body node responsible for the current block
            // Is obviously the then_block so we also set this
            this->node = node->then_block.get();
            // The contiuation for the then_block got set a couple lines up
            // std::cout << "\tCurrent then block: " << current_block->name << std::endl;

            return ShuLangVisitor::egressIfNode(node);
        };
};

shuir::ProgramNode select_SIR_instructions(shulang::ProgramNode* sl_program) {
    // Now at conditionals we have multiple blocks
    SLTranslator translator = SLTranslator("main");

    translator.walk(sl_program);

    shuir::ProgramNode node = shuir::ProgramNode();
    // TODO:
    // Is this a O(n) operation?
    // Should I pass a reference to a buffer instead
    // when initializing the translator?
    node.blocks = translator.blocks;
    return node;
}
