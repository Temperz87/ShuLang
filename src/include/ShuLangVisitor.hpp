#pragma once

#include <ShuLangAST.hpp>
#include <stack>

using namespace shulang;

class ShuLangVisitor {
    private:
        std::stack<ShuLangNode*> ingress;
        std::stack<childholder<ShuLangNode>> egress;

        ShuLangNode* egress_step(ShuLangNode* egressed) {
            if (egress.empty())
                return egressed;

            childholder<ShuLangNode>* last = &egress.top();
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
        typedef childholder<ShuLangNode> ASTHolder;

        ~ShuLangVisitor() {
            // delete this->ingress;
            // delete this->egress;
        }

        ShuLangVisitor() {
            this->ingress = std::stack<ShuLangNode*>();
            this->egress = std::stack<ASTHolder>();
        }

        virtual ASTHolder ingressStatementNode(StatementNode* node, int childcount) { return this->ingressNode(node, childcount); }
        virtual ShuLangNode* egressStatementNode(StatementNode* node) { return this->egressNode(node); }

        virtual ASTHolder ingressPrintNode(PrintNode* node, int childcount) { return this->ingressNode(node, childcount); }
        virtual ShuLangNode* egressPrintNode(PrintNode* node) { return this->egressNode(node); }

        virtual ASTHolder ingressValueNode(ValueNode* node, int childcount) { return this->ingressNode(node, childcount); }
        virtual ShuLangNode* egressValueNode(ValueNode* node) { return this->egressNode(node); }

        virtual ASTHolder ingressIntegerNode(IntegerNode* node, int childcount) { return this->ingressNode(node, childcount); }
        virtual ShuLangNode* egressIntegerNode(IntegerNode* node) { return this->egressNode(node); }

        virtual ASTHolder ingressVariableReferenceNode(VariableReferenceNode* node, int childcount) { return this->ingressNode(node, childcount); }
        virtual ShuLangNode* egressVariableReferenceNode(VariableReferenceNode* node) { return this->egressNode(node); }

        virtual ASTHolder ingressBindingNode(BindingNode* node, int childcount) { return this->ingressNode(node, childcount); }
        virtual ShuLangNode* egressBindingNode(BindingNode* node) { return this->egressNode(node); }

        virtual ASTHolder ingressOperatorApplicationNode(OperatorApplicationNode* node, int childcount) { return this->ingressNode(node, childcount); }
        virtual ShuLangNode* egressOperatorApplicationNode(OperatorApplicationNode* node) { return this->egressNode(node); }

        virtual ASTHolder ingressProgramNode(ProgramNode* node, int childcount) { return this->ingressNode(node, childcount); }
        virtual ShuLangNode* egressProgramNode(ProgramNode* node) { return this->egressNode(node); }

        virtual ASTHolder ingressNode(ShuLangNode* node, int childcount) { 
            ASTHolder ret;
            ret.node = node;
            ret.waitingfor = childcount;
            return ret;
        }

        virtual ShuLangNode* egressNode(ShuLangNode* node) { 
            return node;
        }

        ShuLangNode* walk(ShuLangNode* start) {
            this->ingress.push(start);
            ShuLangNode* ret;

            while (!this->ingress.empty()) {
                ShuLangNode* current = this->ingress.top();
                this->ingress.pop();

                ASTHolder holder = current->ingressVisitor(this);


                // Take the example of
                // bind x : Integer to 5 print(x)
                // If to the vector in the normal order
                // We end up with {bind, print}
                // However, when we push onto a stack
                // It ends up with {print, bind}
                // Then descends into the print before the bind
                // Which is bad!!!
                std::vector<std::shared_ptr<ShuLangNode>> children = current->children();
                for (int i = children.size() - 1; i >= 0; i--) {
                    ingress.push(children.at(i).get());
                }

                if (holder.waitingfor == 0) {
                    // We know that we can't descend
                    // So we try to ascend
                    ShuLangNode* egressed = holder.node->egressVisitor(this);

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
            // std::vector<ShuLangNode> children;
            // for (ShuLangNode child : start.children()) {
            //     children.push_back(walk(child));
            // }
            // return onEgress(start, children);
        }
};