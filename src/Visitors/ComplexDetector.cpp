#include <ComplexDetector.hpp>
#include <ShuLangAST.hpp>
#include <ShuLangVisitor.hpp>

// Is this scuffed? YES!
// Do I care? YES!
// Is this making me insecure? YES!
// Will I fix it? Maybe.........
bool ComplexDetector::IsComplex(ShuLangNode* node) {
    ComplexDetector det;
    node->accept(&det);
    return det.is_complex;
}

void ComplexDetector::visitNode(OperatorApplicationNode* node) {
    is_complex = true;
}

void ComplexDetector::visitNode(NotNode* node) {
    is_complex = true;
}

void ComplexDetector::visitNode(SelectOperatorNode* node) {
    is_complex = true;
}

void ComplexDetector::visitNode(CallNode* node) {
    is_complex = true;
}