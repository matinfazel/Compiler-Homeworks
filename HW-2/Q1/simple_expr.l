%{
    #include <math.h>
    #include <string.h>
    #include "simple-expr.tab.h"
%}

%%

[\+\-]?[0-9]+ { yylval.num = atof(yytext); return NUMBER;}
[\+\-]?[0-9]*\.[0-9]+ { yylval.num = atof(yytext); return NUMBER; }
\+ {return PLUS;}
\- {return MINUS;}
\* {return MUL;}
% {return MOD;}
\/ {return DEVIDE; printf("find\n");}
\^ {return POW;}
= {return EQUAL;}
sin {return SIN;}
cos {return COS;}
cot {return COT;}
tan {return TAN;}
exp {return EXP;}
ln {return LN;}
\( {return OPEN_PRANTES;}
\) {return CLOSE_PRANTES;}
[a-zA-Z]+ { strcpy(yylval.str,yytext) ;return VARIABLE;}

\n {return EOL;}
. {}
%%
int yywrap(){}