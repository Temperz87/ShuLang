#include <Analysis.hpp>
#include <SIRVisitor.hpp>
#include <SIRCFG.hpp>
#include <SIRAST.hpp>
#include <optional>

using namespace sir;
using namespace std;

std::optional<int> KnownConstant::GetIntValue(sir::ValueNode* node) {
    KnownConstant visitor;
    node->accept(&visitor);
    return visitor.lastValue;
}
