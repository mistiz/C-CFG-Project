%{
#include "parser.tab.h"
%}

%%

"int"           { return INT; }
"main"          { return MAIN; }
"return"        { return RETURN; }

[0-9]+          { yylval = atoi(yytext); return NUMBER; }

"+"             { return PLUS; }
"-"             { return MINUS; }
"*"             { return MULTIPLY; }
"/"             { return DIVIDE; }

"("             { return LPAREN; }
")"             { return RPAREN; }
"{"             { return LBRACE; }
"}"             { return RBRACE; }
";"             { return SEMICOLON; }

[ \t\r\n]+      { /* ignore whitespace */ }

.               { return IDENTIFIER; }

%%

int yywrap() { return 1; }
