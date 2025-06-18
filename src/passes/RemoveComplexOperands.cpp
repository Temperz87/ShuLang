#include <ShuLangAST.hpp>
#include <ShuLangVisitor.hpp>
#include <RemoveComplexOperands.hpp>
#include <memory>
#include <string>
#include <vector>

std::string gen_tmp_name() {
    static int tmp_counter = 0;
    return "tmp" + std::to_string(tmp_counter++);
}

// Is this scuffed? YES!
// Do I care? YES!
// Is this making me insecure? YES!
// Will I fix it? Maybe.........
class ComplexDetector : public ShuLangVisitor {
    private:
        bool is_complex = false;
    public:
        bool NeedToRebind(ShuLangNode* node) {
            walk(node);
            bool ret = is_complex;
            is_complex = false;
            return ret;
        }

        ShuLangNode* egressOperatorApplicationNode(OperatorApplicationNode* node) override {
            is_complex = true;
            return ShuLangVisitor::egressOperatorApplicationNode(node);
        }
};

// This class takes in an AST that doesn't have to be atomic
// And tries to ensure its children are
class target_complex : public ShuLangVisitor {
    private:
        std::unique_ptr<VariableReferenceNode> generate_binding(std::unique_ptr<ValueNode> complex_value) {
            std::unique_ptr<BindingNode> fresh;
            fresh->name = gen_tmp_name();
            fresh->value = std::move(complex_value);
            bindings.push_back(std::move(fresh));
            return std::make_unique<VariableReferenceNode>(fresh->name);
        }

    public:
        std::vector<std::unique_ptr<BindingNode>> bindings;
        
        ShuLangNode* egressOperatorApplicationNode(OperatorApplicationNode* node) override {
            // The bindings in the class clearly get propagated through every egress
            // So we must have unique bindings for every time we Atomify

            // For operators, their lhs and rhs must be atomic
            ComplexDetector det;
            if (det.NeedToRebind(node->lhs.get())) {
                node->lhs = generate_binding(std::move(node->lhs));
            }

            if (det.NeedToRebind(node->rhs.get())) {
                node->rhs = generate_binding(std::move(node->rhs));
            }

            return ShuLangVisitor::egressOperatorApplicationNode(node);
        }

        ShuLangNode* egressPrintNode(PrintNode* node) override {
            ComplexDetector det;
            // to_print must be atomic
            if (det.NeedToRebind(node->to_print.get())) {
                node->to_print = generate_binding(std::move(node->to_print));
            }
            return ShuLangVisitor::egressPrintNode(node);
        }
};

void remove_complex_operands(ProgramNode* program) {
    for (long i = 0; i < program->nodes.size(); i++) {
        target_complex visitor = target_complex();
        visitor.walk(program->nodes.at(i).get());

        int len = visitor.bindings.size();
        for (int j = 0; j < len; j++) {
            program->nodes.insert(program->nodes.begin() + j, std::move(visitor.bindings.at(j)));
        }
    }
}
