#include <SIRAST.hpp>
#include <SIRVisitor.hpp>

std::unordered_map<sir::DefinitionNode*, int> analyze_constants(const sir::ProgramNode& program);
class KnownConstant : sir::SIRVisitor {
    private:
        std::optional<int> lastValue;

    public:

    void visit(sir::ImmediateNode* node) {
        lastValue = node->number;
    }
      
    static std::optional<int> GetIntValue(sir::ValueNode* node);
};
