#include <ComplexDetector.hpp>
#include <ShuLangAST.hpp>
#include <ShuLangVisitor.hpp>

// Is this scuffed? YES!
// Do I care? YES!
// Is this making me insecure? YES!
// Will I fix it? Maybe.........
bool ComplexDetector::IsComplex(ShuLangNode* node) {
    ComplexDetector det;
    det.walk(node);
    return det.is_complex;
}

ShuLangNode* ComplexDetector::egressOperatorApplicationNode(OperatorApplicationNode* node) {
    is_complex = true;
    return ShuLangVisitor::egressOperatorApplicationNode(node);
}