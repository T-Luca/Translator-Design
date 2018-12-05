%option noyywrap
%option yylineno

%{
#include "parser.tab.h"
%}

DIGIT		[0-9]
NUMBER		[0-9][0-9]+
LETTER		[a-zA-Z]
NAME [a-zA-Z][a-zA-Z0-9_]*
QCHAR \"(\\.|[^"\\])*\"

%%
"//"					return COMMENT;
int						return INT;
char					return CHAR;
if						return IF;
else					return ELSE;
"!="					return NEQUAL;
return					return RETURN;
"("						return LPAR;
")"						return RPAR;
"{"						return LBRACE;
"}"						return RBRACE;
"["						return LBRACKET;
"]"						return RBRACKET;
"="						return ASSIGN;
";" 					return SEMICOLON;
","						return COMMA;
"+"						return PLUS;
"-"						return MINUS;
"*"						return TIMES;
"/"						return DIVIDE;
"=="					return EQUAL;
"||"					return OR;
"&&"					return AND;
write					return WRITE;
read					return READ;
"<"						return LESS;
">"						return GREATER;
"!"						return NOT;
length					return LENGTH;
while					return WHILE;
{DIGIT}+				return DIGIT;
{LETTER}				return LETTER;
{NAME}					return NAME;
{NUMBER}				return NUMBER;
{QCHAR}					return QCHAR;
[ \t\n]					;
%%