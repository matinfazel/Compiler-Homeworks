//Definitions 
%{
#include <stdio.h>
#include <math.h>

extern int yylex();
extern int yyparse();
extern FILE *yyin;
extern double pow(double x, double y);
extern double sin(double x);
extern double cos(double x);
extern double tan(double x);
extern double log(double x);
extern double exp(double x);
void print_expr(double x);
int count = 0;
int tmp[10];
char tmp1[10][20];
%}

%union {
  double num;
  char str[20];
}



%token EOL
%token <num> NUMBER
%type <num> exp
%token <str> VARIABLE
%token PLUS
%token MINUS
%token MUL
%token DEVIDE
%token MOD
%token POW
%token EQUAL
%token OPEN_PRANTES
%token CLOSE_PRANTES
%token SIN
%token COS 
%token TAN
%token COT
%token EXP
%token LN


%left PLUS MINUS
%left MUL POW MOD
%left OPEN_PRANTES CLOSE_PRANTES

// Rules
%%
input:
|   line input
;

line:
    exp { if ((int) ($1) == ($1)) printf("%d\n",(int) ($1)); else printf("%f\n",$1);}
   
    |EOL;
/**/
exp: 
    NUMBER { $$ = $1;}
|   exp PLUS exp {$$ = $1 + $3;}
|   exp MINUS exp {$$ = $1 - $3;}
|   exp MUL exp {$$ = $1 * $3;}
|   exp DEVIDE exp {$$ = $1 / $3;}
|   exp POW exp {$$ = pow ($1,$3);}
|   exp MOD exp {$$ = (double)( (int) ($1) % (int) ($3));}
|   VARIABLE EQUAL exp {  strcpy(tmp1[count], $1);tmp[count] = $3; count++; $$ = $3; }
|   VARIABLE { $$ = tmp[count];
    for (int i = 0 ;i < count;i++)
      if (strcmp(tmp1[i], $1) == 0)
          $$ = tmp[i];

            }
|   SIN OPEN_PRANTES exp CLOSE_PRANTES { $$ = (double) (sin($3));}
|   COS OPEN_PRANTES exp CLOSE_PRANTES { $$ = (double) (cos($3));}
|   TAN OPEN_PRANTES exp CLOSE_PRANTES { $$ = (double) (tan($3));}
|   COT OPEN_PRANTES exp CLOSE_PRANTES { $$ = 1.0 / (double) (tan($3));}
|   EXP OPEN_PRANTES exp CLOSE_PRANTES { $$ = (double) (exp($3));}
|   LN OPEN_PRANTES exp CLOSE_PRANTES { $$ = (double) (log($3));}

;
%%
int main() {
  FILE * ptr = fopen("parse.txt", "r");
  yyin = ptr;
  yyparse();
  return 0;
}


yyerror(char* s){
  printf("ERROR : %s\n", s);
  return 0;
}


void print_expr(double x){
    printf("%lf\n",x);

}
