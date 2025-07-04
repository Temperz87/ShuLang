// Hello "big serious person" looking at this heap of stuff
// This pass is HARD
// and as such I've deferred it until later 
// :3

#include <ComplexDetector.hpp>
#include <ShuLangAST.hpp>
#include <ShuLangVisitor.hpp>
#include <iostream>
#include <memory>
#include <unordered_map>
#include <unordered_set>
#include <vector>

// std::string gen_tmp_name() {
//     static int tmp_counter = 0;
//     std::cout << "Called gen tmp name" << std::endl;
//     return "short_circ" + std::to_string(tmp_counter++);
// }

// class TransformToShortCircuit : public ShuLangVisitor {
//     private:
//         std::vector<std::shared_ptr<StatementNode>>& adding_left;
//         std::vector<std::shared_ptr<StatementNode>>& adding_right;

//         std::unordered_map<ValueNode*, StatementNode*> replacements;

//     public:
//         std::shared_ptr<IfNode> to_add = nullptr;

//         ASTHolder ingressOperatorApplicationNode(OperatorApplicationNode* node, int childcount) {
//             if (to_add == nullptr) {
//                 to_add = std::make_shared<IfNode>();
//                 adding_left = to_add->then_block;
//                 adding_right = to_add->else_block;
//             }


//             if (node->op == "and") {
                
//             };
//         }
// }

// class MarkShortCircuit : public ShuLangVisitor {
//     private:
//         OperatorApplicationNode* has_lock = nullptr;
//         std::string tmp_binding;
//         std::unordered_map<ValueNode*, std::shared_ptr<IfNode>> associations;

//         std::unordered_set<ValueNode*> marks;

//         inline void replace_with_mark(std::shared_ptr<ValueNode>& node) {
//             if (marks.contains(node.get())) {
//                 std::shared_ptr<VariableReferenceNode> ref = std::make_shared<VariableReferenceNode>(tmp_binding);
//                 ref->type = "Boolean";
//                 node = ref;
//             };
//         }

//     public:
//         std::vector<std::shared_ptr<IfNode>> to_add;
    
//         ShuLangNode* egressBindingNode(BindingNode* node) override {
//             replace_with_mark(node->value);
//             return ShuLangVisitor::egressBindingNode(node);
//         }

//         ShuLangNode* egressPrintNode(PrintNode* node) override {
//             replace_with_mark(node->to_print);
//             return ShuLangVisitor::egressPrintNode(node);
//         }
        
//         ShuLangNode* egressIfNode(IfNode* node) override { 
//             replace_with_mark(node->condition);
//             return ShuLangVisitor::egressNode(node); 
//         }

//         // ASTHolder ingressOperatorApplicationNode(OperatorApplicationNode* node, int childcount) override {
//         //     if (has_lock == nullptr) {
//         //         has_lock = node;
//         //         tmp_binding = gen_tmp_name();
//         //     }

//         //     return ShuLangVisitor::ingressOperatorApplicationNode(node, childcount);
//         // }

//         ShuLangNode* egressOperatorApplicationNode(OperatorApplicationNode* node) override {
//             if (node->op == "and") {
//                 std::shared_ptr<IfNode> ifnode = std::make_shared<IfNode>();

//                 std::shared_ptr<BindingNode> false_binding = std::make_shared<BindingNode>();
//                 false_binding->name = tmp_binding;
//                 false_binding->ty = "Boolean";
//                 false_binding->value = std::make_shared<BooleanNode>(false);
//                 ifnode->else_block.push_back(false_binding);

//                 if (associations.contains(node->lhs.get())) {
//                     ifnode->condition = std::make_shared<VariableReferenceNode>(tmp_binding); 
//                 }
//                 else {
//                     ifnode->condition = node->lhs;
//                 }

//                 if (associations.contains(node->rhs.get())) {
//                     ifnode->then_block.push_back(associations.at(node->rhs.get()));
//                     to_add.erase(to_add.begin() + to_add.size() - 1);
//                 }
//                 else {
//                     std::shared_ptr<BindingNode> then_binding = std::make_shared<BindingNode>();
//                     then_binding->name = tmp_binding;
//                     then_binding->ty = "Boolean";
//                     then_binding->value = node->rhs;
//                     ifnode->then_block.push_back(then_binding);
//                 }

//                 to_add.push_back(ifnode);
//                 marks.insert(node);
//                 associations.insert({node, ifnode});
//             }
//             else if (node->op == "or") {
//                 std::shared_ptr<IfNode> ifnode = std::make_shared<IfNode>();

//                 std::shared_ptr<BindingNode> true_binding = std::make_shared<BindingNode>();
//                 true_binding->name = tmp_binding;
//                 true_binding->ty = "Boolean";
//                 true_binding->value = std::make_shared<BooleanNode>(true);
//                 ifnode->then_block.push_back(true_binding);

//                 if (associations.contains(node->lhs.get())) {
//                     ifnode->condition = std::make_shared<VariableReferenceNode>(tmp_binding); 
//                 }
//                 else {
//                     ifnode->condition = node->lhs;
//                 }

//                 if (associations.contains(node->rhs.get())) {
//                     ifnode->else_block.push_back(associations.at(node->rhs.get()));
//                     to_add.erase(to_add.begin() + to_add.size() - 1);
//                 }
//                 else {
//                     std::shared_ptr<BindingNode> else_binding = std::make_shared<BindingNode>();
//                     else_binding->name = tmp_binding;
//                     else_binding->ty = "Boolean";
//                     else_binding->value = node->rhs;
//                     ifnode->else_block.push_back(else_binding);
//                 }

//                 to_add.push_back(ifnode);
//                 marks.insert(node);
//                 associations.insert({node, ifnode});
//             }

//             // if (has_lock == node) {
//             //     has_lock = nullptr;
//             // }

//             return ShuLangVisitor::egressOperatorApplicationNode(node);
//         }
// };

void short_circuitify(ProgramNode* program) {
    // for (long i = 0; i < program->nodes.size(); i++) {
    //     MarkShortCircuit c;
    //     c.walk(program->nodes.at(i).get());
    //     program->nodes.insert(program->nodes.begin() + i, c.to_add.begin(), c.to_add.end());
    //     i += c.to_add.size();
    // }
}
