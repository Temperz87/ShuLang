#include <ShuLangAST.hpp>
#include <ShuLangVisitor.hpp>
#include <string>
#include <unordered_map>

using namespace shulang;

class Uniquification : public ShuLangVisitor {
    private:
        int unique_id = 0;
        std::unordered_map<std::string, std::string> map;

    public: 
        void visitNode(BindingNode* node) override {
            // Check if we've already assigned a name
            if (map.find(node->identifier) == map.end()) {
                // If so look it up!
                std::string unique_name = node->identifier + "." + std::to_string(unique_id++);
                map.insert({node->identifier, unique_name});
            }

            node->identifier = map.at(node->identifier);
            descendIntoChildren(node);
        }

        void visitNode(VariableReferenceNode* node) override {
            node->identifier = map.at(node->identifier);
            descendIntoChildren(node);
        }
};

void uniquify(shulang::ProgramNode* ast) {
    Uniquification u;
    ast->accept(&u);
}
