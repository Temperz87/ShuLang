#include <ShuLangAST.hpp>
#include <ShuLangPrinter.hpp>
#include <fstream>
#include <iostream>
#include <parser.hpp>
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
    // Recursive descent parsing
    shulang::ProgramNode* program = begin_parse(token_list, argv[1]);
    ShuLangPrinter().walk(program);

    std::cout << "-----UNIQUIFICATION-----" << std::endl;
    // If I do somethingl ike
    // bind x to 5 bind x to 6
    // that becomes bind x.0 to 5 bind x.1 to 6
    // every variable gets a unique name
    Uniquification().walk(program);
    ShuLangPrinter().walk(program);


    std::cout << "-----REMOVE COMPLEX OPERANDS-----" << std::endl;
    // Say I do bind x to (1 + 2) + (3 + 4)
    // that gets changed to bind tmp0 to 1 + 2 bind tmp1 to 3 + 4 bind x to tmp0 + tmp1
    // this makes going into ShuIR easier
    remove_complex_operands(program->nodes);
    ShuLangPrinter().walk(program);
    return 0;
}
