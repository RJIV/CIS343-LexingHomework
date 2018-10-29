%option yylineno

%{

/******************************************************************************
* zjs.lex								      *
* Lexing Homework							      *
* CIS 343								      *
* Author:								      *
*	R.J. Hamilton							      *
******************************************************************************/


#include <stdio.h>
%}

%%

END|end|Exit|exit		{printf("Exiting program\n");}	 
;				{printf("END_STATEMENT\n");}
POINT|Point|point		{printf("Plotting point\n");}
LINE|Line|line			{printf("Drawing line\n");}
CIRCLE|Circle|circle		{printf("Drawing circle\n");}
RECTANGLE|Rectangle|rectangle	{printf("Drawing rectangle\n");}
SET_COLOR			{printf("Setting the color\n");}
[0-9]+				{printf("INT\n");}
[0-9]+\.[0-9]+			{printf("FLOAT\n");}
\n|\t|[ ]			;
.				{printf("Can't recognize token '%s' "
				 "on line %d\n", yytext, yylineno);}

%%

void printLexeme()
{
	printf("(%s)\n", yytext);
}

int main(int argc, char** argv)
{
	yylex();
	return 0;
}

int yywrap(void)
{
	return 1;
}
