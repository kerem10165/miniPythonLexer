#include <iostream>
#include <memory>
#include <fstream>
#include "src/tokens.h"
#include <FlexLexer.h>
#include <magic_enum.hpp>

std::unique_ptr<std::string> identiferVal;

int main()
{
    std::ifstream infile("test/test.py");

    std::unique_ptr<FlexLexer> lex = std::make_unique<yyFlexLexer>(infile , std::cerr);
    
    auto token = Start;

    while(token != EOF_)
    {
        std::cout << magic_enum::enum_name(token) << " ";
        if(identiferVal)
        {
            std::cout << "["<< *identiferVal << "] ";
            identiferVal = nullptr; 
        }   
        token = static_cast<Tokens>(lex->yylex());
    }

    std::cout << std::endl; 
}