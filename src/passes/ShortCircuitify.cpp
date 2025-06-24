#include <ComplexDetector.hpp>
#include <ShuLangAST.hpp>
#include <ShuLangVisitor.hpp>
#include <memory>
#include <unordered_map>
#include <vector>

std::string gen_tmp_name() {
    static int tmp_counter = 0;
    return "short_circ" + std::to_string(tmp_counter++);
}

class MarkShortCircuit : public ShuLangVisitor {
    private:
        std::unordered_map<ValueNode*, std::shared_ptr<VariableReferenceNode>> marks;

        inline void replace_with_mark(std::shared_ptr<ValueNode>& node) {
            ValueNode* ptr = node.get();
            if (marks.contains(ptr)) {
                node = marks.at(ptr);
            };
        }

    public:
        std::vector<std::shared_ptr<IfNode>> bindings;

        ShuLangNode* egressBindingNode(BindingNode* node) override {
            replace_with_mark(node->value);
            return ShuLangVisitor::egressBindingNode(node);
        }

        ShuLangNode* egressPrintNode(PrintNode* node) override {
            replace_with_mark(node->to_print);
            return ShuLangVisitor::egressPrintNode(node);
        }
        
        ShuLangNode* egressIfNode(IfNode* node) override { 
            replace_with_mark(node->condition);
            return ShuLangVisitor::egressNode(node); 
        }

        ShuLangNode* egressOperatorApplicationNode(OperatorApplicationNode* node) override {
            replace_with_mark(node->lhs);
            replace_with_mark(node->rhs);
            if (node->op == "and" || node->op == "or") {
                // If the rhs is atomic 
                // Then because ShuLang is call by value
                // It'll stil get evaluated
                // So we'll instead use primitive functions
                
                // However if the rhs is complex we can benefit from short circuiting
                if (ComplexDetector::IsComplex(node->rhs.get())) {
                    std::shared_ptr<IfNode> ifnode = std::make_shared<IfNode>();
                    ifnode->condition = node->lhs;
                    
                    // Generate binding nodes
                    // Note we do Python esque scoping for if's
                    // Hence the same name being used
                    std::string unique_name = gen_tmp_name();
                    
                    std::shared_ptr<BindingNode> thn = std::make_shared<BindingNode>();
                    thn->ty = "Boolean";
                    thn->name = unique_name;
                    ifnode->then_block.push_back(thn);

                    std::shared_ptr<BindingNode> els = std::make_shared<BindingNode>();
                    els->ty = "Boolean";
                    els->name = unique_name;
                    ifnode->else_block.push_back(els);

                    if (node->op == "and") {
                        thn->value = node->rhs;
                        els->value = std::make_shared<BooleanNode>(false);
                    }
                    else if (node->op == "or") {
                        thn->value = std::make_shared<BooleanNode>(true);
                        els->value = node->rhs;
                    }

                    bindings.push_back(ifnode);

                    std::shared_ptr<VariableReferenceNode> ref = std::make_shared<VariableReferenceNode>(unique_name);
                    ref->type = "Boolean";
                    marks.insert({node, ref});
                }
            }
            return ShuLangVisitor::egressOperatorApplicationNode(node);
        }
};

void short_circuitify(ProgramNode* program) {
    for (long i = 0; i < program->nodes.size(); i++) {
        MarkShortCircuit c;
        c.walk(program);
        for (std::shared_ptr<IfNode> node : c.bindings) {
            program->nodes.insert(program->nodes.begin() + i, node);
            i += 1;
        }
    }
}
