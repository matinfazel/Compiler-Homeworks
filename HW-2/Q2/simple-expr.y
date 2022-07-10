//Definitions 
%{
#include <stdio.h>
#include <math.h>
void print_hash_table();
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
int value[20];
char key[20][20];
int line_num = 0;
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
%token OPEN_BRACKET
%token CLOSE_BRACKET
%token COLON
%token COMMA
%token DOUBLE_COTATION

// Rules
%%
input:
|   line input { line_num++ ;}
;

line:
    exp
    | OPEN_BRACKET 
    | CLOSE_BRACKET {printf("------------------This is Hash Table------------------\n");print_hash_table();}
    | EOL;
/**/
exp: 
    NUMBER { $$ = $1;}
|   VARIABLE COLON exp COMMA { value[count] = $3;
          strcpy(key[count], $1); count++;    }  
|  DOUBLE_COTATION VARIABLE DOUBLE_COTATION COLON exp COMMA { value[count] = $5;
          strcpy(key[count], $2); count++;    }    
 

;

/*printf("var is %s\n",$1); printf("key is %lf\n", $3);*/
%%
int main() {
  FILE * ptr = fopen("parse.txt", "r");
  yyin = ptr;
  yyparse();
  return 0;
}
void print_hash_table(){
  for (int i=0;i<count;i++){

    printf("%s --> %d\n", key[i],value[i]);
  }

}

yyerror(char* s){
  printf("ERROR : %s in line %d\n", s , line_num);
  return 0;
}


void print_expr(double x){
    printf("%lf\n",x);

}
