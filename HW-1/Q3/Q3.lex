%{
/* example illustrating the use of states in lex 

   declare a state called INPUT using: %s INPUT

   enter a state using: BEGIN INPUT

   match a token only if in a certain state: <INPUT>\".*\"
*/
%}

%s INPUT
%s OUTPUT

%%

[ \t\n]+                ;
inputfile      BEGIN INPUT;
<INPUT>\".*\"   { ECHO; printf(" is the input file\n"); }
outputfile      BEGIN OUTPUT;
<OUTPUT>\".*\"   { ECHO; printf(" is the output file\n"); }

\".*\"          { ECHO; printf("\n"); }

.                //{ ECHO; printf("\n"); };

%%

int yywrap(){}

int main(){
   

    //yyin = f;
    yylex();
    //printf("I see the number : %d",count);

    
}
