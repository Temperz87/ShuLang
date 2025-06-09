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
        std::stack<ASTNode*> ingress;
        std::stack<childholder<ASTNode>> egress;

        ASTNode* egress_step(ASTNode* egressed) override {
            childholder<ASTNode>* last = &egress.top();
            last->waitingfor -= 1;
            while (last->waitingfor == 0) {
                egressed = last->node->egressVisitor(this);

                // We're now done with the node
                if (this->egress.size() <= 1)
                    break; // Here there's nothing to do

                // However here we add it to the next node 
                this->egress.pop();

                last = &egress.top();
                last->waitingfor -= 1;
            }

            return egressed;
        }

    public:
        typedef childholder<ASTNode> ASTHolder;

        ~ASTVisitor() {
            // delete this->ingress;
            // delete this->egress;
        }

        ASTVisitor() {
            this->ingress = std::stack<ASTNode*>();
            this->egress = std::stack<ASTHolder>();
        }

        virtual ASTHolder ingressStatementNode(StatementNode* node, int childcount) override { return this->ingressNode(node, childcount); }
        virtual ASTNode* egressStatementNode(StatementNode* node) override { return this->egressNode(node); }

        virtual ASTHolder ingressPrintNode(PrintNode* node, int childcount) override { return this->ingressNode(node, childcount); }
        virtual ASTNode* egressPrintNode(PrintNode* node) override { return this->egressNode(node); }

        virtual ASTHolder ingressValueNode(ValueNode* node, int childcount) override { return this->ingressNode(node, childcount); }
        virtual ASTNode* egressValueNode(ValueNode* node) override { return this->egressNode(node); }

        virtual ASTHolder ingressIntegerNode(IntegerNode* node, int childcount) override { return this->ingressNode(node, childcount); }
        virtual ASTNode* egressIntegerNode(IntegerNode* node) override { return this->egressNode(node); }

        virtual ASTHolder ingressVariableReferenceNode(VariableReferenceNode* node, int childcount) override { return this->ingressNode(node, childcount); }
        virtual ASTNode* egressVariableReferenceNode(VariableReferenceNode* node) override { return this->egressNode(node); }

        virtual ASTHolder ingressBindingNode(BindingNode* node, int childcount) override { return this->ingressNode(node, childcount); }
        virtual ASTNode* egressBindingNode(BindingNode* node) override { return this->egressNode(node); }

        virtual ASTHolder ingressOperatorApplicationNode(OperatorApplicationNode* node, int childcount) override { return this->ingressNode(node, childcount); }
        virtual ASTNode* egressOperatorApplicationNode(OperatorApplicationNode* node) override { return this->egressNode(node); }

        virtual ASTHolder ingressProgramNode(ProgramNode* node, int childcount) override { return this->ingressNode(node, childcount); }
        virtual ASTNode* egressProgramNode(ProgramNode* node) override { return this->egressNode(node); }

        virtual ASTHolder ingressNode(ASTNode* node, int childcount) override { 
            ASTHolder ret;
            ret.node = node;
            ret.waitingfor = childcount;
            return ret;
        }

        virtual ASTNode* egressNode(ASTNode* node) override { 
            return node;
        }

        ASTNode* walk(ASTNode* start) {
            this->ingress.push(start);
            ASTNode* ret;

            while (!this->ingress.empty()) {
                ASTNode* current = this->ingress.top();
                this->ingress.pop();

                ASTHolder holder = current->ingressVisitor(this);
                for (ASTNode* node : current->children())
                    ingress.push(node);

                if (holder.waitingfor == 0) {
                    // We know that we can't descend
                    // So we try to ascend
                    ASTNode* egressed = holder.node->egressVisitor(this);

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