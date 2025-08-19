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
        ShuLangNode* egressOperatorApplicationNode(OperatorApplicationNode* node) override;
        ShuLangNode* egressNotNode(NotNode* node) override;
        ShuLangNode* egressSelectOperatorNode(SelectOperatorNode* node) override;
};
