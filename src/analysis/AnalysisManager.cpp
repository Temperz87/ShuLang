#include <Analysis.hpp>
#include <SIRVisitor.hpp>
#include <SIRCallGraph.hpp>
#include <SIRCFG.hpp>
#include <SIRAST.hpp>
#include <unordered_map>
#include <vector>

using namespace sir;
using namespace std;

IPSCCPResults* AnalysisManager::getIPSCCPResults() {
    if (ipsccp_results == nullptr)
        ipsccp_results = IPSCCP(*getCallGraph());

    return ipsccp_results.get();
}

CallGraph* AnalysisManager::getCallGraph() { 
    if (callgraph == nullptr)
        callgraph = make_unique<CallGraph>(functions);

    return callgraph.get();
}

UseDefInfo* AnalysisManager::getUseDefChains(FunctionDefinitionNode* node) { 
    if (!usedef_infos.contains(node) || usedef_infos[node] == nullptr) 
        usedef_infos[node] = UseDefAnalysis::get_use_def_chains(*getCFG(node));
    return usedef_infos[node].get();
}
            
SIRControlFlowGraph* AnalysisManager::getCFG(FunctionDefinitionNode* node) { 
    if (!cfgs.contains(node) || cfgs[node] == nullptr) {
        std::vector<SIRBlock*> blocks;
        for (const auto& block : node->blocks) 
            blocks.push_back(block.get());

        cfgs[node] = make_unique<SIRControlFlowGraph>(blocks);
    }

    return cfgs[node].get();
}

void AnalysisManager::invalidateFunction(FunctionDefinitionNode* node) { 
    if (cfgs.contains(node))
        cfgs[node] = nullptr;
    if (usedef_infos.contains(node))
        usedef_infos[node] = nullptr;

    // TODO: Proper IPSCCP scheduling!!!
    ipsccp_results = nullptr;
}
