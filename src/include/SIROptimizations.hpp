#include <Analysis.hpp>
#include <SIRAST.hpp>
#include <SIRCFG.hpp>

bool SIRFold(sir::FunctionDefinitionNode*, sir::AnalysisManager& am);
void SIRPropagate(sir::FunctionDefinitionNode*, sir::AnalysisManager& am);
bool SIRDSE(sir::FunctionDefinitionNode*, sir::AnalysisManager& am);
bool CFGMerge(sir::FunctionDefinitionNode*, sir::AnalysisManager& am);
bool CFGSimplify(sir::FunctionDefinitionNode*, sir::AnalysisManager& am);
