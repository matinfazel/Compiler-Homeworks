%{
    //Definitions
    #include<stdio.h>
    #include <string.h>
    int count =0;
    int c = 1;
%}

%%
    //rules
.*\/\/.* {;}
.*\/\*.* {c = -1;}
.*\*\/.* {c = 1;}
\n {count++;}
.* {   
    
    if (c==1) {
        FILE * ptr = fopen("q2_new.cpp","a");
        fprintf (ptr, "%s\n",yytext);
        fclose(ptr);
    }
    
    }
%%
int yywrap(){}

int main(){
    FILE * f = fopen("q2.cpp","r");
    FILE * ptr = fopen("q2_new.cpp","w"); // making new file without comments as test.txt
    yyin = f;
    yylex();
    printf("I see the number : %d",count);
    
}