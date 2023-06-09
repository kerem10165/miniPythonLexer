#include <iostream>
#include <memory>
#include <fstream>
#include "src/tokens.h"
#include <FlexLexer.h>
#include <magic_enum.hpp>

std::unique_ptr<std::string> identiferVal;

int main(int argc , char** argv)
{
    for(int i = 1 ; i < argc ; ++i)
    {
        std::ifstream infile(std::string{"test/"} + argv[i]);

        if(!infile.is_open())
        {
            std::cerr << "Error has occurred while file is reading";
            return -1;
        }

        std::cout << argv[i] << " named file is reading\n\n";

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

        std::cout << "\n\n"; 
    }
}