#include <iostream>

#include "parser.tab.h"
#pragma warning(disable:4996)

using namespace std;

extern int yyparse();
extern FILE *yyin;
extern int yylineno;

int main()
{
	yyin = fopen("passedtest.txt", "r+");
	if (yyin == NULL)
	{
		cout << "\n Error ! \n";
	}
	else
	{
		cout << "I am parsing! \n";
		if (yyparse() == 0) {
			printf("Correct syntax in the given program! \n\n");
		}	
	}
}

int yyerror(const char* msg)
{
	fprintf(stderr,"Error on line %d | type error: %s\n", yylineno, msg); 
	return 0;
}

