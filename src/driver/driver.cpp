#include <AST.hpp>
#include <ASTPrinter.hpp>
#include <ctype.h>
#include <fstream>
#include <iostream>
#include <parser.hpp>
#include <string.h>
#include <vector>
#include <RemoveComplexOperands.hpp>
#include <tokenizer.hpp>
#include <Uniquification.hpp>

int main(int argc, char** argv) {
    if (argc != 2)
        std::cout << "Expected 1 argument but got " << argc - 1 << " arguments instead" << std::endl;

    std::ifstream myfile;
    myfile.open(argv[1]);
    if (!myfile.is_open()) {
        std::cout << "Error opening file " << argv[1] << std::endl;
        return -1;
    }

    std::cout << "-----TOKENIZATION-----" << std::endl;
    std::vector<token> token_list;
    int tokens = tokenize(myfile, token_list);
    myfile.close();


    for (int i = 0; i < tokens; i++) {  
        token t = token_list.at(i);
        std::string ty;
        token_type_to_string(ty, t.type);
        std::cout << "(" << t.value << ", " << ty << ")" << std::endl;
    }


    std::cout << "-----PARSING-----" << std::endl;
    ProgramNode* program = begin_parse(token_list, argv[1]);
    ASTPrinter().walk(program);

    std::cout << "-----UNIQUIFICATION-----" << std::endl;
    Uniquification().walk(program);
    ASTPrinter().walk(program);


    std::cout << "-----REMOVE COMPLEX OPERANDS-----" << std::endl;
    remove_complex_operands(program->nodes);
    ASTPrinter().walk(program);
    return 0;
}
