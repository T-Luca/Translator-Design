%{
/* Analizor lexical pentru limbajul Tiny - ANALEXC*/
#include <math.h>
%}

LETTER [A-Za-z]
DIGIT [0-9]
NAME [a-zA-Z][a-zA-Z0-9_]*
NUMBER [0-9][0-9]+
QCHAR \"(\\.|[^"\\])*\"

%%
    /*** Rules ***/

"//".*                   printf( "COMMENT: %s\n", yytext );
"int"                    printf( "INT: %s\n", yytext );
"if"                     printf( "IF: %s\n", yytext );
"else"                   printf( "ELSE: %s\n", yytext );
"!="                     printf( "OPERATOR: %s\n", yytext );
"return"                 printf( "RETURN: %s\n", yytext );
"("                      printf( "LPAR: %s\n", yytext );
")"                      printf( "RPAR: %s\n", yytext );
"{"                      printf( "LBRACE: %s\n", yytext );
"}"                      printf( "RBRACE: %s\n", yytext );
"["                      printf( "LBRACKET: %s\n", yytext );
"]"                      printf( "RBRACKET: %s\n", yytext );
"="                      printf( "ASSIGN: %s\n", yytext );
";"                      printf( "SEMICOLON: %s\n", yytext );
","                      printf( "COMMA: %s\n", yytext );
"+"                      printf( "PLUS: %s\n", yytext );
"-"                      printf( "MINUS: %s\n", yytext );
"*"                      printf( "TIMES: %s\n", yytext );
"/"                      printf( "DIVIDE: %s\n", yytext );
"=="                     printf( "EQUAL: %s\n", yytext );
"char"                   printf( "CHAR: %s\n", yytext );
"write"                  printf( "WRITE: %s\n", yytext );
"read"                   printf( "READ: %s\n", yytext );
">"                      printf( "GREATER: %s\n", yytext );
"<"                      printf( "LESS: %s\n", yytext );
"!"                      printf( "NOT: %s\n", yytext );
"length"                 printf( "LENGTH: %s\n", yytext );
"while"                  printf( "WHILE: %s\n", yytext );
{LETTER}                 printf( "LETTER: %s\n", yytext );
{DIGIT}                  printf( "DIGIT: %s\n", yytext );
{NAME}                   printf( "NAME: %s\n", yytext );
{NUMBER}                 printf( "NUMBER: %s\n", yytext );
{QCHAR}                  printf( "QCHAR: %s\n", yytext );
[ \t\n]+                 ;/* elimina spatiile albe si sfârsitul de linie */
.                        printf( "Caracter necunoscut: %s\n", yytext );

%%

void main( argc, argv )
int argc;
char **argv;
 {
  ++argv, --argc;
  if ( argc > 0 )
    yyin = fopen( argv[0], "r" );
  else
    yyin = stdin;

  yylex();
}

int yywrap() {
   return 1;
}
