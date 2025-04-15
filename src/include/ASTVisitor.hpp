#pragma once

#include "AST.hpp"
#include <ctype.h>
#include <iostream>
#include <string.h>
#include <stack>
#include <vector>

struct ASTHolder {
    ASTNode node;
    std::vector<ASTNode> children;
    int expectedCount;
};

class ASTVisitor {
    private:

        std::stack<ASTNode> ingress;
        std::stack<ASTHolder> egress;

        ASTNode egress_step(ASTNode egressed) {
            ASTHolder last = egress.top();
            last.children.push_back(egressed);
            while (last.children.size() == last.expectedCount) {

                egressed = last.node.egressVisitor(this, last.children);

                // We're now done with the node
                if (this->egress.empty())
                    break; // Here there's nothing to do

                // However here we add it to the next node 
                this->egress.pop();
                last = egress.top();
                last.children.push_back(egressed);
            }

            return egressed;
        }

    public:
        ~ASTVisitor() {
            // delete this->ingress;
            // delete this->egress;
        }

        ASTVisitor() {
            this->ingress = std::stack<ASTNode>();
            this->egress = std::stack<ASTHolder>();
        }

        virtual ASTHolder ingressStatementNode(StatementNode node) { return this->ingressNode((ASTNode)node); }
        virtual ASTNode egressStatementNode(StatementNode node) { return this->egressNode((ASTNode)node); }

        virtual ASTHolder ingressPrintNode(PrintNode node) { return this->ingressNode((ASTNode)node); }
        virtual ASTNode egressPrintNode(PrintNode node) { return this->egressNode((ASTNode)node); }

        virtual ASTHolder ingressValueNode(ValueNode node) { return this->ingressNode((ASTNode)node); }
        virtual ASTNode egressValueNode(ValueNode node) { return this->egressNode((ASTNode)node); }

        virtual ASTHolder ingressIntegerNode(IntegerNode node) { return this->ingressNode((ASTNode)node); }
        virtual ASTNode egressIntegerNode(IntegerNode node) { return this->egressNode((ASTNode)node); }

        virtual ASTHolder ingressVariableReferenceNode(VariableReferenceNode node) { return this->ingressNode((ASTNode)node); }
        virtual ASTNode egressVariableReferenceNode(VariableReferenceNode node) { return this->egressNode((ASTNode)node); }

        virtual ASTHolder ingressBindingNode(BindingNode node) { return this->ingressNode((ASTNode)node); }
        virtual ASTNode egressBindingNode(BindingNode node) { return this->egressNode((ASTNode)node); }

        virtual ASTHolder ingressProgramNode(ProgramNode node) { return this->ingressNode((ASTNode)node); }
        virtual ASTNode egressProgramNode(ProgramNode node) { return this->egressNode((ASTNode)node); }


        virtual ASTHolder ingressNode(ASTNode node) { 
            ASTHolder ret;
            ret.node = node;
            ret.children = std::vector<ASTNode>();
            ret.expectedCount = node.children().size();
            return ret;
        }

        virtual ASTNode egressNode(ASTNode node) { 
            return node;
        }

        ASTNode walk(ASTNode start) {
            this->ingress.push(start);
            ASTNode ret;

            while (!this->ingress.empty()) {
                ASTNode current = this->ingress.top();
                this->ingress.pop();

                ASTHolder holder = current.ingressVisitor(this);

                if (holder.expectedCount == 0) {
                    // We know that we can't descend
                    // So we try to ascend
                    ASTNode egressed = holder.node.egressVisitor(this, holder.children);

                    // Because terminal parse nodes like Integer don't constitute a program
                    // We always have to ascend
                    // Hence it's safe to assign ret here
                    ret = this->egress_step(egressed);
                }
                else {
                    egress.push(holder);
                }
            }

            return ret;

            // Recursive code for reference
            // onIngress(start);
            // std::vector<ASTNode> children;
            // for (ASTNode child : start.children()) {
            //     children.push_back(walk(child));
            // }
            // return onEgress(start, children);
        }
};