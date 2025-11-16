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

void ComplexDetector::onEgressOperatorApplicationNode(OperatorApplicationNode* node) {
    is_complex = true;
}

void ComplexDetector::onEgressNotNode(NotNode* node) {
    is_complex = true;
}

void ComplexDetector::onEgressSelectOperatorNode(SelectOperatorNode* node) {
    is_complex = true;
}

void ComplexDetector::onEgressCallNode(CallNode* node) {
    is_complex = true;
}