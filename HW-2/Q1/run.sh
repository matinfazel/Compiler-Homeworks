flex simple_expr.l
bison -d -t simple-expr.y
gcc lex.yy.c simple-expr.tab.c -lm