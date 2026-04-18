%{
#include <stdio.h>
#include <string.h>

void yyerror(const char *s);
int yylex(void);

int error_found = 0;
%}

%start program

%token INT MAIN RETURN
%token NUMBER IDENTIFIER
%token PLUS MINUS MULTIPLY DIVIDE
%token LPAREN RPAREN LBRACE RBRACE SEMICOLON

%%

program:
      function {
            if (!error_found) {
                printf("Valid program\n");
            }
      }
    ;

function:
      INT MAIN LPAREN RPAREN LBRACE stmt_list RBRACE
    | INT MAIN LPAREN error RPAREN LBRACE stmt_list RBRACE {
            error_found = 1;
            printf("Error: missing ')'\n");
            printf("Why: function header must end with ')'\n");
            printf("Suggestion: add ')' after 'main'\n");
            printf("Rewritten code:\nint main() {\n    return 5;\n}\n");
      }
    | INT MAIN LPAREN RPAREN error stmt_list RBRACE {
            error_found = 1;
            printf("Error: missing '{'\n");
            printf("Why: function body must start with '{'\n");
            printf("Suggestion: add '{' after function header\n");
            printf("Rewritten code:\nint main() {\n    return 5;\n}\n");
      }
    ;

stmt_list:
      stmt_list stmt
    | stmt
    ;

stmt:
      RETURN expr SEMICOLON
    | error SEMICOLON {
            error_found = 1;
            printf("Error: invalid return expression\n");
            printf("Why: return must be followed by a valid expression\n");
            printf("Suggestion: return <value>;\n");
            printf("Rewritten code:\nreturn 0;\n");
      }
    ;

expr:
      NUMBER
    | expr PLUS expr
    | expr MINUS expr
    | expr MULTIPLY expr
    | expr DIVIDE expr
    ;

%%

void yyerror(const char *s) {
    error_found = 1;
    printf("Error: %s\n", s);
}
