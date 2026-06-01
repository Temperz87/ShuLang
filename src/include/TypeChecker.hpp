#include <ShuLangAST.hpp>
#include <ShuLangVisitor.hpp>
#include <unordered_map>
#include <utility>

class TypeChecker : public ShuLangVisitor {
    private:
        // We'll need random access to walk the scopes
        // Hence a vector and not a deque
        std::vector<std::unordered_map<std::string, std::string>> scope_stack = { {} };
        std::unordered_map<std::string, std::pair<int, std::vector<std::string>>> function_types = {
            {"print", {1, {"Void", "Any"}}},
            {"read_input", {0, {"Integer"}}},
        };
        void assert_same(std::string expected, std::string actual, std::string error_msg);

    public: 
        void visitNode(BindingNode* node) override;
        void visitNode(VariableReferenceNode* node) override;
        void visitNode(OperatorApplicationNode* node) override;
        void visitNode(NotNode* node) override;
        void visitNode(BeginNode* node) override;
        void visitNode(SelectOperatorNode* node) override;
        void visitNode(CallNode* node) override;
        void visitNode(IfNode* node) override;
        void visitNode(WhileNode* node) override;
};