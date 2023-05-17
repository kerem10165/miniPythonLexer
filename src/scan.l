%{
  #include <iostream>
  #include <memory>
  #include "tokens.h"

  extern std::unique_ptr<std::string> identiferVal;
%}


%option c++
%option noyywrap

%%

[ \n]           { }
"#".*           { 
                  identiferVal = std::make_unique<std::string>(yytext , yyleng);
                  identiferVal->insert(0 , "Comment : ");
                  return ONE_LINE_COMMENT; 
                }
"import"        { return IMPORT; }
"if"            { return IF; }
"else"          { return ELSE; }
"elif"          { return ELIF; }
"while"         { return WHILE; }
"for"           { return FOR; }
"break"         { return BREAK; }
"and"           { return AND; }
"or"            { return OR; }
"not"           { return NOT; }
"print"         { return PRINT; }
"def"           { return DEF; }
"return"        { return RETURN; }
"True"          { return TRUE; }
"False"         { return FALSE; }
[0-9]+          { 
                  identiferVal = std::make_unique<std::string>(yytext , yyleng);
                  return NUM; 
                }
[a-zA-Z_][a-zA-Z0-9_]*  { 
                          identiferVal = std::make_unique<std::string>(yytext , yyleng);
                          return IDENTIFIER;
                        }
"=="            { return EQ; }
"!="            { return NEQ; }
">"             { return GT; }
"<"             { return LT; }
">="            { return GTE; }
"<="            { return LTE; }
"="             { return ASSIGN; }
"+"             { return PLUS; }
"-"             { return MINUS; }
"*"             { return MUL; }
"/"             { return DIV; }
"("             { return LPARAN; }
")"             { return RPARAN; }
"{"             { return LBRACE; }
"}"             { return RBRACE; }
[\"].*[\"]      {
                  identiferVal = std::make_unique<std::string>(yytext , yyleng); 
                  return QUOTES; 
                }
":"             { return COLON; }
";"             { return SEMICOLON; }
","             { return COMMA; }
"["             { return OB; }
"]"             { return CB; }
.               { return ERROR; }

<<EOF>> { return EOF_; }

%%