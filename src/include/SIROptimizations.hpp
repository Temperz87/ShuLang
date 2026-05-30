#include <Analysis.hpp>
#include <SIRAST.hpp>
#include <SIRCFG.hpp>

bool SIRDSE(UseDefInfo usedefs, const sir::SIRControlFlowGraph& cfg);
void SIRFold(sir::ProgramNode& node, std::unordered_map<sir::DefinitionNode*, int>& constants);
void SIRPropagate(sir::ProgramNode& node, std::unordered_map<sir::DefinitionNode*, int>& constants);
bool CFGMerge(sir::ProgramNode& program, const sir::SIRControlFlowGraph& cfg);