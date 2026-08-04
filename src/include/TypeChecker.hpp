#include <ShuLangAST.hpp>
#include <ShuLangVisitor.hpp>
#include <deque>
#include <unordered_map>
#include <utility>

using FunctionSignature = std::pair<int, std::vector<std::string>>;
struct Scope {
    std::unordered_map<std::string, std::string> variables;
    std::unordered_map<std::string, FunctionSignature> functions;
};

class TypeChecker : public ShuLangVisitor {
    private:
        // We'll need random access to walk the scopes
        // Hence a vector and not a deque
        std::vector<Scope> scope_stack = {
        {
            {},
            {
                {"print", {1, {"Void", "Any"}}},
                {"read_input", {0, {"Integer"}}},
            }
        }};

        std::deque<std::string> return_type_stack = { };
        bool caught_return = false;

        std::string lookup_variable(const std::string& name);
        FunctionSignature* lookup_function(const std::string& name);
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
        void visitNode(FunctionNode* node) override;
        void visitNode(ReturnNode* node) override;
};