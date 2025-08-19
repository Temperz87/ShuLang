#include <ComplexDetector.hpp>
#include <ShuLangAST.hpp>
#include <ShuLangVisitor.hpp>
#include <ShuIRAST.hpp>
#include <ShuLangVisitor.hpp>
#include <iostream>
#include <llvm/IR/Metadata.h>
#include <memory>
#include <stack>
#include <string>
#include <unordered_set>
#include <vector>

class SLTranslator : public ShuLangVisitor {
    typedef struct {
        std::shared_ptr<shuir::SIRBlock> block;
        std::shared_ptr<shuir::SIRBlock> continuation;
        shulang::BodyNode* node;
    } block_cont_node_t;

    private:
        // Completed values, e.g. Immediate and operator values
        // There will be at most 2 values in here currently
        std::stack<std::shared_ptr<shuir::ValueNode>> completed;
        // What blocks are the destination of a jump
        std::unordered_set<std::string> have_reached;

        // Stores the next blocks and where to go afterwards
        std::stack<block_cont_node_t> next_block_stack;

        std::shared_ptr<shuir::SIRBlock> continuation = nullptr;
        // Node tells us which body node the current block corresponds to
        // So we don't accidentally egress too soon
        // (e.g. an if statement that only contains a nested if statement)
        shulang::BodyNode* node = nullptr;

        std::string gen_name(std::string name) {
            static int counter = 0;
            return name + std::to_string(counter++);
        }

        void mark_block_reachable(std::shared_ptr<shuir::SIRBlock> block) {
            if (!have_reached.contains(block->name)) {
                reachable_blocks.push_back(block);
                have_reached.insert(block->name);
            }
        }

        int type_to_width(std::string type) {
            if (type == "Integer")
                return 32;
            else if (type == "Boolean")
                return 1;
            return -1;
        }

    public:
        // List of blocks that are reachable 
        std::shared_ptr<shuir::SIRBlock> current_block;
        std::vector<std::shared_ptr<shuir::SIRBlock>> reachable_blocks;
        bool need_to_write_exit = true;

        SLTranslator(std::string initial_block_name) { 
            current_block = std::make_unique<shuir::SIRBlock>(initial_block_name);
            reachable_blocks.push_back(current_block);
            have_reached.insert(initial_block_name);
        };
    
        shulang::ShuLangNode* egressIntegerNode(shulang::IntegerNode* node) override {
            std::shared_ptr<shuir::ImmediateNode> imm = std::make_shared<shuir::ImmediateNode>(node->value, 32);
            completed.push(imm);
            return ShuLangVisitor::egressIntegerNode(node);
        }

        shulang::ShuLangNode* egressBooleanNode(shulang::BooleanNode* node) override {
            std::shared_ptr<shuir::ImmediateNode> ret;
            // So in our langauge we treat 0 as false and 1 as true
            // when we're at such a low level
            if (node->value) {
                ret = std::make_shared<shuir::ImmediateNode>(1, 1);
            }
            else {
                ret = std::make_shared<shuir::ImmediateNode>(0, 1);
            }
            completed.push(ret);
            return ShuLangVisitor::egressBooleanNode(node);
        }

        shulang::ShuLangNode* egressVariableReferenceNode(shulang::VariableReferenceNode* node) override {
            std::string identifier = node->identifier;
            int width = type_to_width(node->type);
            if (!current_block->variable_to_ref.contains(identifier)) {
                // std::vector<std::pair<std::string, shuir::ValueNode*>> candidates;
                // for (std::shared_ptr<shuir::SIRBlock> block : current_block->predecesors) {
                //     if (block->variable_to_ref.contains(identifier)) {
                //         std::shared_ptr<shuir::ReferenceNode> ref = block->variable_to_ref.at(identifier);
                //         // std::cout << "Discovered phi candidate " << ref->identifier << std::endl;
                //         candidates.push_back({block->name, dynamic_cast<shuir::ValueNode*>(ref.get())});
                //     }
                // }
                std::shared_ptr<shuir::PseudoPhiNode> phi = std::make_shared<shuir::PseudoPhiNode>(identifier, width);
                std::shared_ptr<shuir::DefinitionNode> def = std::make_shared<shuir::DefinitionNode>(gen_name(identifier), phi);
                current_block->instructions.insert(current_block->instructions.begin(), def);
                current_block->variable_to_ref.insert({identifier, def->identifier});
            }

            std::string new_id = current_block->variable_to_ref.at(node->identifier);
            std::shared_ptr<shuir::ReferenceNode> ref = std::make_shared<shuir::ReferenceNode>(new_id, width);
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
                // TODO: Validate operator is < or <= or = or != or > or >= or and or or or xor
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
            std::shared_ptr<shuir::DefinitionNode> def = std::make_shared<shuir::DefinitionNode>(gen_name(node->name), completed.top());

            if (current_block->variable_to_ref.contains(node->name))
                current_block->variable_to_ref[node->name] = def->identifier;
            else 
                current_block->variable_to_ref.insert({node->name, def->identifier});

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
                continuation->predecesors.insert(current_block);
                mark_block_reachable(continuation);
            }
            else {
                current_block->instructions.push_back(std::make_shared<shuir::ExitNode>());
                current_block->is_terminal = true;
                // std::cout << "\tBlock " << current_block->name << " has no continuation!" << std::endl;
            }

            current_block = next_block_stack.top().block;
            continuation = next_block_stack.top().continuation;
            // this->node = next_block_stack.top().node;
            this->node = next_block_stack.top().node;
            // std::cout << "\tNow on block " << current_block->name << std::endl;
            next_block_stack.pop();
            // std::cout << "Egressed body node" << std::endl;

            need_to_write_exit = true;
            return ShuLangVisitor::egressBodyNode(node);
        }

        shulang::ShuLangNode* egressNotNode(shulang::NotNode* node) override {
            // Neat trick I found on stack overflow
            std::shared_ptr<shuir::CmpNode> op = std::make_shared<shuir::CmpNode>("=");
            op->lhs = completed.top();
            completed.pop();
            op->rhs = std::make_shared<shuir::ImmediateNode>(0, 1);
            completed.push(op);
            return ShuLangVisitor::egressNotNode(node);
        }

        shulang::ShuLangNode* egressSelectOperatorNode(shulang::SelectOperatorNode* node) override {
            // Write primitive select
            // Then we'll optimize later
            std::shared_ptr<shuir::ValueNode> false_value = completed.top();
            completed.pop();
            std::shared_ptr<shuir::ValueNode> true_value = completed.top();
            completed.pop();
            std::shared_ptr<shuir::ValueNode> cond_value = completed.top();
            completed.pop();
            // std::cout << false_value << " " << true_value << " " << cond_value << std::endl;
            std::shared_ptr<shuir::SelectNode> select = std::make_shared<shuir::SelectNode>(true_value->width, cond_value, true_value, false_value);
            completed.push(select);
            return ShuLangVisitor::egressSelectOperatorNode(node);
        }

        shulang::ShuLangNode* egressIfNode(shulang::IfNode* node) override {
            // std::cout << "Egress if node!!!" << std::endl;

            // We store what happens after the if in a new block
            // In order to avoid code duplication and exponential file size
            if (continuation == nullptr) {
                // No need to remake the continuation if it already exists
                continuation = std::make_shared<shuir::SIRBlock>(gen_name("continuation"));
                // blocks.push_back(continuation);
                next_block_stack.push({continuation, nullptr, nullptr});
            }

            std::shared_ptr<shuir::SIRBlock> then_block = std::make_shared<shuir::SIRBlock>(gen_name("then"));
            mark_block_reachable(then_block);
            then_block->predecesors.insert(current_block);
            std::shared_ptr<shuir::SIRBlock> else_destination = continuation;

            if (node->else_block != nullptr) {
                std::shared_ptr<shuir::SIRBlock> else_block = std::make_shared<shuir::SIRBlock>(gen_name("else"));
                mark_block_reachable(else_block);
                next_block_stack.push({else_block, continuation, node->else_block.get()});
                else_destination = else_block;
            }

            else_destination->predecesors.insert(current_block);
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
            need_to_write_exit = true;
            return ShuLangVisitor::egressIfNode(node);
        };

        shulang::ShuLangNode* egressProgramNode(shulang::ProgramNode* node) override {
            return ShuLangVisitor::egressProgramNode(node);
        }
};

// TODOO: There's potentially undefined behavior here
shuir::ProgramNode select_SIR_instructions(shulang::ProgramNode* sl_program) {
    // Now at conditionals we have multiple blocks
    SLTranslator translator = SLTranslator("main");

    translator.walk(sl_program);
    if (translator.need_to_write_exit) {
        translator.current_block->instructions.push_back(std::make_shared<shuir::ExitNode>());
        translator.current_block->is_terminal = true;
    }

    shuir::ProgramNode node = shuir::ProgramNode();
    // TODO:
    // Is this a O(n) operation?
    // Should I pass a reference to a buffer instead
    // when initializing the translator?
    node.blocks = translator.reachable_blocks;
    return node;
}
