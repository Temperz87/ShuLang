#pragma once

#include <ShuLangAST.hpp>
#include <ShuLangVisitor.hpp>

// Is this scuffed? YES!
// Do I care? YES!
// Is this making me insecure? YES!
// Will I fix it? Maybe.........
class ComplexDetector : public ShuLangVisitor {
    private:
        bool is_complex = false;
    public:
        static bool IsComplex(ShuLangNode* node);
        void onEgressOperatorApplicationNode(OperatorApplicationNode* node) override;
        void onEgressNotNode(NotNode* node) override;
        void onEgressSelectOperatorNode(SelectOperatorNode* node) override;
        void onEgressCallNode(CallNode* node) override;
};
