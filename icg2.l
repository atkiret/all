ALPHA [A-Za-z]
DIGIT [0-9]
%%
if                 return IF;
then                 return THEN;
else                 return ELSE;
{ALPHA}({ALPHA}|{DIGIT})*    return ID;
{DIGIT}+             {yylval=atoi(yytext); return NUM;}
">="		return GE;
"<="		return LE;
[ \t]                 ;
\n                yyterminate();
.                 return yytext[0];
%%
