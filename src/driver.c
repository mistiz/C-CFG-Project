#include <stdio.h>

int yyparse(void);

int main() {
    // Do NOT print anything here.
    // The parser.y handles ALL messages.
    yyparse();
    return 0;
}
