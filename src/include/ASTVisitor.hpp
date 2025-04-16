#pragma once

#include <AST.hpp>
#include <ctype.h>
#include <iostream>
#include <string.h>
#include <stack>
#include <vector>
#include <Visitor.hpp>

class ASTVisitor : public Visitor {
    private:
        std::stack<ASTNode> ingress;
        std::stack<childholder<ASTNode>> egress;

        ASTNode egress_step(ASTNode egressed) {
            childholder<ASTNode> last = egress.top();
            last.children.push_back(egressed);
            last.waitingfor -= 1;
            while (last.waitingfor == 0) {

                egressed = last.node.egressVisitor(this, last.children);

                // We're now done with the node
                if (this->egress.empty())
                    break; // Here there's nothing to do

                // However here we add it to the next node 
                this->egress.pop();
                last = egress.top();
                last.children.push_back(egressed);
                last.waitingfor -= 1;
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
            this->egress = std::stack<childholder<ASTNode>>();
        }

        virtual childholder<ASTNode> ingressStatementNode(StatementNode node, int childcount) override { return this->ingressNode((ASTNode)node, childcount); }
        virtual ASTNode egressStatementNode(StatementNode node, std::vector<ASTNode> newchildren) override { return this->egressNode((ASTNode)node, newchildren); }

        virtual childholder<ASTNode> ingressPrintNode(PrintNode node, int childcount)  { return this->ingressNode((ASTNode)node, childcount); }
        virtual ASTNode egressPrintNode(PrintNode node, std::vector<ASTNode> newchildren) override { return this->egressNode((ASTNode)node, newchildren); }

        virtual childholder<ASTNode> ingressValueNode(ValueNode node, int childcount) override { return this->ingressNode((ASTNode)node, childcount); }
        virtual ASTNode egressValueNode(ValueNode node, std::vector<ASTNode> newchildren) override { return this->egressNode((ASTNode)node, newchildren); }

        virtual childholder<ASTNode> ingressIntegerNode(IntegerNode node, int childcount) override { return this->ingressNode((ASTNode)node, childcount); }
        virtual ASTNode egressIntegerNode(IntegerNode node, std::vector<ASTNode> newchildren) override { return this->egressNode((ASTNode)node, newchildren); }

        virtual childholder<ASTNode> ingressVariableReferenceNode(VariableReferenceNode node, int childcount) override { return this->ingressNode((ASTNode)node, childcount); }
        virtual ASTNode egressVariableReferenceNode(VariableReferenceNode node, std::vector<ASTNode> newchildren) override { return this->egressNode((ASTNode)node, newchildren); }

        virtual childholder<ASTNode> ingressBindingNode(BindingNode node, int childcount) override { return this->ingressNode((ASTNode)node, childcount); }
        virtual ASTNode egressBindingNode(BindingNode node, std::vector<ASTNode> newchildren) override { return this->egressNode((ASTNode)node, newchildren); }

        virtual childholder<ASTNode> ingressProgramNode(ProgramNode node, int childcount) override { return this->ingressNode((ASTNode)node, childcount); }
        virtual ASTNode egressProgramNode(ProgramNode node, std::vector<ASTNode> newchildren) override { return this->egressNode((ASTNode)node, newchildren); }


        virtual childholder<ASTNode> ingressNode(ASTNode node, int childcount) override { 
            childholder<ASTNode> ret;
            ret.node = node;
            ret.children = std::vector<ASTNode>();
            ret.waitingfor = childcount;
            return ret;
        }

        virtual ASTNode egressNode(ASTNode node, std::vector<ASTNode> newchildren) override { 
            return node;
        }

        ASTNode walk(ASTNode start) {
            this->ingress.push(start);
            ASTNode ret;

            while (!this->ingress.empty()) {
                ASTNode current = this->ingress.top();
                this->ingress.pop();

                childholder<ASTNode> holder = current.ingressVisitor(this);

                if (holder.waitingfor == 0) {
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