#include <Analysis.hpp>
#include <SIRAST.hpp>
#include <SIRCFG.hpp>

bool SIRDSE(const UseDefInfo& usedefs, const sir::SIRControlFlowGraph& cfg);
void SIRFold(sir::FunctionDefinitionNode* function, std::unordered_map<sir::DefinitionNode*, int>& constants);
void SIRPropagate(sir::FunctionDefinitionNode* function, std::unordered_map<sir::DefinitionNode*, int>& constants);
bool CFGMerge(sir::FunctionDefinitionNode* function, const sir::SIRControlFlowGraph& cfg);
bool CFGSimplify(sir::FunctionDefinitionNode* function, const sir::SIRControlFlowGraph& cfg, const SCCPResults& sccp);
