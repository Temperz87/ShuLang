#include <Analysis.hpp>
#include <SIRAST.hpp>
#include <SIRCFG.hpp>
#include <SIRVisitor.hpp>
#include <unordered_map>

using namespace sir;
using namespace std;

void UseDefAnalysis::walk(SIRBlock *block) {
  for (std::shared_ptr<InstructionNode> instr : block->instructions) {
    instr->accept(this);
  }
}

void UseDefAnalysis::visit(ReferenceNode *node) {
  auto lock = node->definition.lock();
  if (lock) {
    uses_found.insert(lock.get());
  }
}

void UseDefAnalysis::visit(SelectNode *node) {
  node->condition->accept(this);
  node->true_value->accept(this);
  node->false_value->accept(this);
}

void UseDefAnalysis::visit(AddNode *node) {
  node->lhs->accept(this);
  node->rhs->accept(this);
}

void UseDefAnalysis::visit(SubNode *node) {
  node->lhs->accept(this);
  node->rhs->accept(this);
}

void UseDefAnalysis::visit(MultNode *node) {
  node->lhs->accept(this);
  node->rhs->accept(this);
}

void UseDefAnalysis::visit(CmpNode *node) {
  node->lhs->accept(this);
  node->rhs->accept(this);
}

void UseDefAnalysis::visit(DefinitionNode *node) {
  node->binding->accept(this);
  for (DefinitionNode* def : uses_found) {
    usedefs[def].push_back(node);
  }
}

void UseDefAnalysis::visit(PhiNode *node) {
  for (auto candidate : node->candidates) {
    candidate.second->accept(this);
  }
}

void UseDefAnalysis::visit(PrintNode *node) { node->to_print->accept(this); }

void UseDefAnalysis::visit(JumpIfElseNode *node) {
  node->condition->accept(this);
  for (DefinitionNode* def : uses_found) {
    usedefs[def].push_back(node);
  }
}

UseDefInfo UseDefAnalysis::get_use_def_chains(const SIRControlFlowGraph &cfg) {
  UseDefAnalysis visitor;
  std::unordered_set<SIRBlock *> handling;
  std::deque<SIRBlock *> forwards;
  forwards.push_back(cfg.get_main());
  while (!forwards.empty()) {
    SIRBlock *curr = forwards.front();
    visitor.walk(curr);
    forwards.pop_front();
    handling.insert(curr);
    for (SIRBlock *block : cfg.get_outgoing(curr)) {
      if (!handling.contains(block)) {
        handling.insert(block);
        forwards.push_back(block);
      }
    }
  }

  return UseDefInfo(visitor.usedefs);
}
