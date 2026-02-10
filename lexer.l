%{
#include "y.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}

DIGIT   [0-9]
ID      [a-zA-Z_][a-zA-Z0-9_]*

%%

"="     { return ASSIGN; }
";"     { return SEMI; }

"+"     { return PLUS; }
"-"     { return MINUS; }
"*"     { return MUL; }
"/"     { return DIV; }

"("     { return LPAREN; }
")"     { return RPAREN; }

{DIGIT}+ {
            yylval.num = atoi(yytext);
            return NUMBER;
         }

{ID}    {
            yylval.id = strdup(yytext);
            return ID;
        }

[ \t\n]+   ;   // ignore whitespace

.       {
            printf("❌ LEXICAL ERROR: Invalid token '%s'\n", yytext);
            exit(0);
        }

%%

int yywrap(){
    return 1;
}
