%{
#include<stdio.h>
#include<string.h>
struct ST
{
char lexeme[20];
char type[20];
int count;
}ST[100];
int cnt=0;
int cnt1=1;
%}

ID [a-zA-Z][a-zA-Z0-9]*
digit [0-9]


%%
{digit}+  {strcpy(ST[cnt].lexeme,yytext);strcpy(ST[cnt].type,"INTEGER");ST[cnt++].count=cnt;}
{digit}*\.{digit}+  {strcpy(ST[cnt].lexeme,yytext);strcpy(ST[cnt].type,"FLOAT");ST[cnt++].count=cnt;}
void|int|struct|char|double|string  {strcpy(ST[cnt].lexeme,yytext);strcpy(ST[cnt].type,"DATATYPE");ST[cnt++].count=cnt;}
typedef|struct|if|else|do|while|for|switch|main|continue|return  {strcpy(ST[cnt].lexeme,yytext);strcpy(ST[cnt].type,"KEYWORDS");ST[cnt++].count=cnt;}
"+"|"-"|"*"|"/"|"<"|">"|"="|"=="|"<="|">="  {strcpy(ST[cnt].lexeme,yytext);strcpy(ST[cnt].type,"OPERATORS");ST[cnt++].count=cnt;}
"#include"  {strcpy(ST[cnt].lexeme,yytext);strcpy(ST[cnt].type,"PREPROCESSOR DIRECTIVE");ST[cnt++].count=cnt;}
{ID}+".h"  {strcpy(ST[cnt].lexeme,yytext);strcpy(ST[cnt].type,"HEADER");ST[cnt++].count=cnt;}
{ID}+  {strcpy(ST[cnt].lexeme,yytext);strcpy(ST[cnt].type,"IDENTIFIER");ST[cnt++].count=cnt;}
"%d" | "%c" {strcpy(ST[cnt].lexeme,yytext);strcpy(ST[cnt].type,"STRING CONSTANT");ST[cnt++].count=cnt;}
. {strcpy(ST[cnt].lexeme,yytext);strcpy(ST[cnt].type,"TERMINAL");ST[cnt++].count=cnt;}

%%
main(int argc,char *argv[])
{
char filename[30];
int i=0;
yyin=fopen(argv[1],"r");
yylex();
printf("\n\t\tTOKEN TABLE\n");
printf("------------------------------------------------------------------------------------");
printf("SR|    LEXEME      |\t\tTYPE\n");
printf("------------------------------------------------------------------------------------");
for(i=0;i<cnt;i++)
{
printf("%2d|%10s|\t%s\n",ST[i].count,ST[i].lexeme,ST[i].type);
}
printf("------------------------------------------------------------------------------------");
}
int yywrap()
{
return 1;
}
