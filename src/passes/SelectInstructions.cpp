#include <ComplexDetector.hpp>
#include <ShuLangAST.hpp>
#include <ShuLangVisitor.hpp>
#include <SIRAST.hpp>
#include <ShuLangVisitor.hpp>
#include <llvm/IR/Metadata.h>
#include <memory>
#include <stack>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <vector>

class SLTranslator : public ShuLangVisitor {
    private:
        // Completed values, e.g. Immediate and operator values
        // There will be at most 2 values in here currently
        std::stack<std::shared_ptr<sir::ValueNode>> completed;
        
        // What blocks are the destination of a jump
        std::unordered_set<sir::SIRBlock*> have_reached;
        
        // Stores the next blocks and where to go afterwards
        std::shared_ptr<sir::SIRBlock> continuation = nullptr;

        // Node tells us which body node the current block corresponds to
        // So we don't accidentally egress too soon
        // (e.g. an if statement that only contains a nested if statement)

        std::string gen_name(std::string name) {
            static int counter = 0;
            return name + std::to_string(counter++);
        }

        void mark_block_reachable(std::shared_ptr<sir::SIRBlock> block) {
            if (!have_reached.contains(block.get())) {
                reachable_blocks.push_back(block);
                have_reached.insert(block.get());
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
        std::shared_ptr<sir::SIRBlock> current_block;
        std::vector<std::shared_ptr<sir::SIRBlock>> reachable_blocks;
        bool need_to_write_exit = true;

        SLTranslator(std::string initial_block_name) { 
            current_block = std::make_shared<sir::SIRBlock>(initial_block_name);
            reachable_blocks.push_back(current_block);
            have_reached.insert(current_block.get());
        };
    
        void visitNode(shulang::IntegerNode* node) override {
            descendIntoChildren(node);
            std::shared_ptr<sir::ImmediateNode> imm = std::make_shared<sir::ImmediateNode>(node->value, 32);
            completed.push(imm);
        }

        void visitNode(shulang::BooleanNode* node) override {
            descendIntoChildren(node);
            std::shared_ptr<sir::ImmediateNode> ret;
            // So in our langauge we treat 0 as false and 1 as true
            // when we're at such a low level
            if (node->value) {
                ret = std::make_shared<sir::ImmediateNode>(1, 1);
            }
            else {
                ret = std::make_shared<sir::ImmediateNode>(0, 1);
            }
            completed.push(ret);
        }

        void visitNode(shulang::VariableReferenceNode* node) override {
            descendIntoChildren(node);
            std::string identifier = node->identifier;
            int width = type_to_width(node->type);
            if (!current_block->variable_to_ref.contains(identifier)) {
                std::shared_ptr<sir::PseudoPhiNode> phi = std::make_shared<sir::PseudoPhiNode>(identifier, width);
                std::shared_ptr<sir::DefinitionNode> def = std::make_shared<sir::DefinitionNode>(current_block.get(), gen_name(identifier), phi);
                current_block->instructions.insert(current_block->instructions.begin(), def);
                current_block->variable_to_ref[identifier] = def;
            }

            std::shared_ptr<sir::DefinitionNode> definition = current_block->variable_to_ref.at(node->identifier);
            std::shared_ptr<sir::ReferenceNode> ref = std::make_shared<sir::ReferenceNode>(definition, width);
            completed.push(ref);
        }

        void visitNode(shulang::OperatorApplicationNode* node) override {
            descendIntoChildren(node);
            std::shared_ptr<sir::BinOpNode> ret;
            if (node->op == "+") {
                ret = std::make_shared<sir::AddNode>();
            }
            else if (node->op == "-") {
                ret = std::make_shared<sir::SubNode>();
            }
            else if (node->op == "*") {
                ret = std::make_shared<sir::MultNode>();
            }
            else {
                // TODO: Validate operator is < or <= or = or != or > or >= or and or or or xor
                ret = std::make_shared<sir::CmpNode>(node->op);
            }
            ret->rhs = completed.top();
            completed.pop();
            ret->lhs = completed.top();
            completed.pop();
            completed.push(ret);
        }

        // The only top level nodes we can have at this point are statements
        // Because I don't wanna do s-expressions
        void visitNode(shulang::BindingNode* node) override {
            descendIntoChildren(node);
            // std::cout << "Creating binding node!" << std::endl;
            std::shared_ptr<sir::DefinitionNode> def = std::make_shared<sir::DefinitionNode>(current_block.get(), gen_name(node->identifier), completed.top());
            if (current_block->variable_to_ref.contains(node->identifier))
                current_block->variable_to_ref[node->identifier] = def;
            else 
                current_block->variable_to_ref[node->identifier] = def;

            completed.pop();
            // Becauase the value isn't complex
            // We can ALWAYS use the completed vector
            // And assume it has the exact right size 
            current_block->instructions.push_back(def);
        }

        void visitNode(shulang::NotNode* node) override {
            descendIntoChildren(node);

            // Neat trick I found on stack overflow
            std::shared_ptr<sir::CmpNode> op = std::make_shared<sir::CmpNode>("=");
            op->lhs = completed.top();
            completed.pop();
            op->rhs = std::make_shared<sir::ImmediateNode>(0, 1);
            completed.push(op);
        }

        void visitNode(shulang::SelectOperatorNode* node) override {
            if (!(ComplexDetector::IsComplex(node->true_value.get()) && ComplexDetector::IsComplex(node->false_value.get()))) {
                // Both branches are already primitives
                //  and therefore evaluated
                // Hence no reason to create two blocks
                node->condition->accept(this);
                std::shared_ptr<sir::ValueNode> condition = completed.top();
                completed.pop();
                node->true_value->accept(this);
                std::shared_ptr<sir::ValueNode> true_value = completed.top();
                completed.pop();
                node->false_value->accept(this);
                std::shared_ptr<sir::ValueNode> false_value = completed.top();
                completed.pop();
                std::shared_ptr<sir::SelectNode> final = std::make_shared<sir::SelectNode>(true_value->width, condition, true_value, false_value);
                completed.push(final);
                return;
            }

            // Translate select into two blocks to ensure lazy evaluation
            std::shared_ptr<sir::SIRBlock> then_block = std::make_shared<sir::SIRBlock>(gen_name("select_true"));
            std::shared_ptr<sir::SIRBlock> else_block = std::make_shared<sir::SIRBlock>(gen_name("select_false"));
            std::shared_ptr<sir::SIRBlock> select_cont = std::make_shared<sir::SIRBlock>(gen_name("select_cont"));
            std::vector<std::pair<sir::SIRBlock*, std::shared_ptr<sir::ValueNode>>> candidates;
            node->condition->accept(this);
            std::shared_ptr<sir::JumpIfElseNode> if_else = std::make_shared<sir::JumpIfElseNode>(current_block.get(), then_block, else_block, completed.top());
            current_block->instructions.push_back(if_else);
            mark_block_reachable(then_block);
            then_block->predecesors.insert(current_block);
            else_block->predecesors.insert(current_block);
            mark_block_reachable(else_block);
            
            // True block
            current_block = then_block;
            node->true_value->accept(this);
            std::shared_ptr<sir::DefinitionNode> def_true = std::make_shared<sir::DefinitionNode>(current_block.get(), gen_name("select_true_val"), completed.top());
            std::shared_ptr<sir::ReferenceNode> ref_true = std::make_shared<sir::ReferenceNode>(def_true, def_true->width);
            current_block->instructions.push_back(def_true);
            current_block->instructions.push_back(std::make_shared<sir::JumpNode>(current_block.get(), select_cont));
            select_cont->predecesors.insert(current_block);
            mark_block_reachable(select_cont);
            candidates.push_back({current_block.get(), ref_true});
            completed.pop();

            // False block
            current_block = else_block;
            node->false_value->accept(this);
            std::shared_ptr<sir::DefinitionNode> def_false = std::make_shared<sir::DefinitionNode>(current_block.get(), gen_name("select_false_val"), completed.top());
            std::shared_ptr<sir::ReferenceNode> ref_false = std::make_shared<sir::ReferenceNode>(def_false, def_false->width);
            current_block->instructions.push_back(def_false);
            current_block->instructions.push_back(std::make_shared<sir::JumpNode>(current_block.get(), select_cont));
            select_cont->predecesors.insert(current_block);
            candidates.push_back({current_block.get(), ref_false});
            completed.pop();

            // Write final value
            current_block = select_cont;

            // First create a PHI node now
            //  As we know both candidates
            std::shared_ptr<sir::PhiNode> phi = std::make_shared<sir::PhiNode>(candidates, type_to_width(node->type));
            std::shared_ptr<sir::DefinitionNode> def = 
                std::make_shared<sir::DefinitionNode>(current_block.get(), gen_name("select_final"), phi);
            current_block->instructions.push_back(def);
            completed.push(std::make_shared<sir::ReferenceNode>(def, phi->width));
        }

        void visitNode(CallNode* node) override {
            descendIntoChildren(node);
            if (node->function_name == "print") {
                std::shared_ptr<sir::PrintNode> print = 
                    std::make_shared<sir::PrintNode>(current_block.get(), completed.top(), node->arguments.at(0)->type);
                completed.pop();
                current_block->instructions.push_back(print);
            }
            else if (node->function_name == "read_input") {
                std::shared_ptr<sir::InputNode> input = std::make_shared<sir::InputNode>();
                std::shared_ptr<sir::DefinitionNode> def = 
                    std::make_shared<sir::DefinitionNode>(current_block.get(), gen_name("input_result"), input);
                completed.push(std::make_shared<sir::ReferenceNode>(def, def->width));
                current_block->instructions.push_back(def);
            }
            // TODO: every function call is an intrinsic right now
            //  However that won't always be the case
        }

        void visitNode(shulang::IfNode* node) override {
            // We store what happens after the if in a new block
            // In order to avoid code duplication and exponential file size
            std::shared_ptr<sir::SIRBlock> previous_continuation = continuation;
            if (continuation == nullptr) {
                // No need to remake the continuation if it already exists
                continuation = std::make_shared<sir::SIRBlock>(gen_name("continuation"));
            }

            // Create then block
            std::shared_ptr<sir::SIRBlock> then_block = std::make_shared<sir::SIRBlock>(gen_name("then"));

            // Create else destination if applicable
            std::shared_ptr<sir::SIRBlock> else_destination = continuation;
            if (node->else_block != nullptr) {
                std::shared_ptr<sir::SIRBlock> else_block = std::make_shared<sir::SIRBlock>(gen_name("else"));
                // next_block_stack.push({else_block, continuation, node->else_block.get()});
                else_destination = else_block;
            }

            node->condition->accept(this);
            mark_block_reachable(then_block);
            then_block->predecesors.insert(current_block);
            mark_block_reachable(else_destination);
            else_destination->predecesors.insert(current_block);
            std::shared_ptr<sir::JumpIfElseNode> if_else = std::make_shared<sir::JumpIfElseNode>(current_block.get(), then_block, else_destination, completed.top());
            completed.pop();
            current_block->instructions.push_back(if_else);
            
            // Visit then block
            current_block = then_block;
            node->then_block->accept(this);
            if (current_block != continuation) {
                current_block->instructions.push_back(std::make_shared<sir::JumpNode>(current_block.get(), continuation));
                continuation->predecesors.insert(current_block);
                mark_block_reachable(continuation);
            }

            // Visit else block if exists
            if (node->else_block != nullptr) {
                current_block = else_destination;
                node->else_block->accept(this);
                if (current_block != continuation) {
                    current_block->instructions.push_back(std::make_shared<sir::JumpNode>(current_block.get(), continuation));
                    continuation->predecesors.insert(current_block);
                    mark_block_reachable(continuation);
                }
            }

            // Write rest of the code to the continuation
            current_block = continuation;
            continuation = previous_continuation;
        }

        void visitNode(WhileNode* node) override {
            std::shared_ptr<sir::SIRBlock> previous_continuation = continuation;
            std::shared_ptr<sir::SIRBlock> loop_condition = std::make_shared<sir::SIRBlock>(gen_name("loop_condition"));
            std::shared_ptr<sir::SIRBlock> loop_body = std::make_shared<sir::SIRBlock>(gen_name("loop_body"));
            std::shared_ptr<sir::SIRBlock> loop_continuation = std::make_shared<sir::SIRBlock>(gen_name("loop_continuation"));

            // Translate loop condition
            std::shared_ptr<sir::JumpNode> jump = std::make_shared<sir::JumpNode>(current_block.get(), loop_condition);
            current_block->instructions.push_back(jump);
            loop_condition->predecesors.insert(current_block);
            mark_block_reachable(loop_condition);   
            current_block = loop_condition;

            // We don't want an if to jump outside the loop
            //  Hence setting the continuation to nullptr forces a creation of a new cont
            continuation = nullptr;
            node->condition->accept(this); 
            std::shared_ptr<sir::JumpIfElseNode> jump_cond_body = std::make_shared<sir::JumpIfElseNode>(current_block.get(), loop_body, loop_continuation, completed.top());
            current_block->instructions.push_back(jump_cond_body);
            completed.pop();
            loop_body->predecesors.insert(current_block);
            mark_block_reachable(loop_body);
            loop_continuation->predecesors.insert(current_block);
            mark_block_reachable(loop_continuation);

            // Translate loop body
            current_block = loop_body;
            continuation = nullptr;
            node->body->accept(this);
            jump = std::make_shared<sir::JumpNode>(current_block.get(), loop_condition);
            current_block->instructions.push_back(jump);
            loop_condition->predecesors.insert(current_block);
            
            // Loop done, insert all instructions after loop
            current_block = loop_continuation;
            continuation = previous_continuation;
        }

};

// TODO: There's potentially undefined behavior here
sir::ProgramNode select_SIR_instructions(shulang::ProgramNode* sl_program) {
    SLTranslator translator = SLTranslator("main");
    sl_program->accept(&translator);
    if (translator.need_to_write_exit) {
        translator.current_block->instructions.push_back(std::make_shared<sir::ExitNode>(translator.current_block.get()));
        translator.current_block->is_terminal = true;
    }

    sir::ProgramNode node = sir::ProgramNode();
    node.blocks = std::move(translator.reachable_blocks);
    return node;
}
