#include <SIRAST.hpp>

void SIRFold(sir::ProgramNode& node, std::unordered_map<sir::DefinitionNode*, int>& constants);
void SIRPropagate(sir::ProgramNode& node, std::unordered_map<sir::DefinitionNode*, int>& constants);
