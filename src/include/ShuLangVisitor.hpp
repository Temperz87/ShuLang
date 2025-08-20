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

        ASTHolder ingressStatementNode(StatementNode* node, int childcount) { return this->ingressNode(node, childcount); }
        ShuLangNode* egressStatementNode(StatementNode* node) { return this->egressNode(node); }
        virtual void onIngressStatementNode(StatementNode* node) { };
        virtual void onEgressStatementNode(StatementNode* node) { };

        ASTHolder ingressPrintNode(PrintNode* node, int childcount) { return this->ingressNode(node, childcount); }
        ShuLangNode* egressPrintNode(PrintNode* node) { return this->egressNode(node); }
        virtual void onIngressPrintNode(PrintNode* node) { };
        virtual void onEgressPrintNode(PrintNode* node) { };

        ASTHolder ingressValueNode(ValueNode* node, int childcount) { return this->ingressNode(node, childcount); }
        ShuLangNode* egressValueNode(ValueNode* node) { return this->egressNode(node); }
        virtual void onIngressValueNode(ValueNode* node) { };
        virtual void onEgressValueNode(ValueNode* node) { };

        ASTHolder ingressIntegerNode(IntegerNode* node, int childcount) { return this->ingressNode(node, childcount); }
        ShuLangNode* egressIntegerNode(IntegerNode* node) { return this->egressNode(node); }
        virtual void onIngressIntegerNode(IntegerNode* node) { };
        virtual void onEgressIntegerNode(IntegerNode* node) { };

        ASTHolder ingressBooleanNode(BooleanNode* node, int childcount) { return this->ingressNode(node, childcount); }
        ShuLangNode* egressBooleanNode(BooleanNode* node) { return this->egressNode(node); }
        virtual void onIngressBooleanNode(BooleanNode* node) { };
        virtual void onEgressBooleanNode(BooleanNode* node) { };

        ASTHolder ingressVariableReferenceNode(VariableReferenceNode* node, int childcount) { return this->ingressNode(node, childcount); }
        ShuLangNode* egressVariableReferenceNode(VariableReferenceNode* node) { return this->egressNode(node); }
        virtual void onIngressVariableReferenceNode(VariableReferenceNode* node) { };
        virtual void onEgressVariableReferenceNode(VariableReferenceNode* node) { };

        ASTHolder ingressBindingNode(BindingNode* node, int childcount) { return this->ingressNode(node, childcount); }
        ShuLangNode* egressBindingNode(BindingNode* node) { return this->egressNode(node); }
        virtual void onIngressBindingNode(BindingNode* node) { };
        virtual void onEgressBindingNode(BindingNode* node) { };

        ASTHolder ingressOperatorApplicationNode(OperatorApplicationNode* node, int childcount) { return this->ingressNode(node, childcount); }
        ShuLangNode* egressOperatorApplicationNode(OperatorApplicationNode* node) { return this->egressNode(node); }
        virtual void onIngressOperatorApplicationNode(OperatorApplicationNode* node) { };
        virtual void onEgressOperatorApplicationNode(OperatorApplicationNode* node) { };

        ASTHolder ingressNotNode(NotNode* node, int childcount) { return this->ingressNode(node, childcount); }
        ShuLangNode* egressNotNode(NotNode* node) { return this->egressNode(node); }
        virtual void onIngressNotNode(NotNode* node) { };
        virtual void onEgressNotNode(NotNode* node) { };

        ASTHolder ingressBeginNode(BeginNode* node, int childcount) { return this->ingressNode(node, childcount); }
        ShuLangNode* egressBeginNode(BeginNode* node) { return this->egressNode(node); }
        virtual void onIngressBeginNode(BeginNode* node) { };
        virtual void onEgressBeginNode(BeginNode* node) { };

        ASTHolder ingressSelectOperatorNode(SelectOperatorNode* node, int childcount) { return this->ingressNode(node, childcount); }
        ShuLangNode* egressSelectOperatorNode(SelectOperatorNode* node) { return this->egressNode(node); }
        virtual void onIngressSelectOperatorNode(SelectOperatorNode* node) { };
        virtual void onEgressSelectOperatorNode(SelectOperatorNode* node) { };

        ASTHolder ingressBodyNode(BodyNode* node, int childcount) { return this->ingressNode(node, childcount); }
        ShuLangNode* egressBodyNode(BodyNode* node) { return this->egressNode(node); }
        virtual void onIngressBodyNode(BodyNode* node) { };
        virtual void onEgressBodyNode(BodyNode* node) { };

        ASTHolder ingressIfNode(IfNode* node, int childcount) { return this->ingressNode(node, childcount); }
        ShuLangNode* egressIfNode(IfNode* node) { return this->egressNode(node); }
        virtual void onIngressIfNode(IfNode* node) { };
        virtual void onEgressIfNode(IfNode* node) { };

        ASTHolder ingressProgramNode(ProgramNode* node, int childcount) { return this->ingressNode(node, childcount); }
        ShuLangNode* egressProgramNode(ProgramNode* node) { return this->egressNode(node); }
        virtual void onIngressProgramNode(ProgramNode* node) { };
        virtual void onEgressProgramNode(ProgramNode* node) { };


        ASTHolder ingressNode(ShuLangNode* node, int childcount) { 
            ASTHolder ret;
            ret.node = node;
            ret.waitingfor = childcount;
            return ret;
        }

        ShuLangNode* egressNode(ShuLangNode* node) { 
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
                // bind x : Integer to 5 Program(x)
                // If to the vector in the normal order
                // We end up with {bind, Program}
                // However, when we push onto a stack
                // It ends up with {Program, bind}
                // Then descends into the Program before the bind
                // Which is bad!!!
                std::vector<ShuLangNode*> children = current->children();
                for (int i = children.size() - 1; i >= 0; i--) {
                    ingress.push(children.at(i));
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