#include <Analysis.hpp>
#include <SIRVisitor.hpp>
#include <SIRCFG.hpp>
#include <SIRAST.hpp>
#include <cstddef>
#include <unordered_map>

bool UseDefInfo::HasUses(sir::DefinitionNode* node) const {
    return UseCount(node) != 0;
}

size_t UseDefInfo::UseCount(sir::DefinitionNode* node) const {
    auto it = usedefs.find(node);
    return it != usedefs.end()? it->second.size() : 0;
}
