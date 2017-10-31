%{
#include<stdio.h>
%}
%token DATATYPE,IDENTIFIER,NUMBER,EOL,LB,RB,COMMA,HASH,LT,GT,INCLUDE,HEADER_FILE,DEFINE,OCB,CCB,STATEMENT, BLOCK
%%
pgm:header other {printf("Valid Expression\n");}
header: HASH INCLUDE LT HEADER_FILE GT header| HASH DEFINE IDENTIFIER NUMBER header|;
other:fun_name part other|;
fun_name:declaration LB parameters RB;
part:block|EOL;
block: OCB stmt CCB;
stmt:STATEMENT stmt|block stmt|;
parameters:declaration t|;
t:COMMA declaration t|;
declaration:DATATYPE IDENTIFIER;
%%
extern FILE *yyin;
extern char *yytext;
main()
{
char fname[25];
printf("\nEnter file name:");
scanf("%s", fname);
yyin=fopen(fname, "r");
while(!feof(yyin))
yyparse();
fclose(yyin);
printf("\nString parsed successfully.\n");
}
yyerror(char *s)
{
 printf("\nError occured:%s:%s\nCannot Parse\n",s,yytext);
}
int yywrap()
{
return 1;
}
