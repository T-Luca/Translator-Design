%defines "parser.tab.h"
%{

#pragma warning(disable:4996)
extern int yylex(); // lexical analyzer
extern int yyerror(const char*);

%}

%token INT IF ELSE NEQUAL EQUAL RETURN LPAR RPAR LBRACE RBRACE LBRACK RBRACK ASSIGN 
       SEMICOLON COMMA PLUS MINUS TIMES DIVIDE OR AND CHAR WRITE READ GREATER LESS
       NOT LENGTH WHILE NAME NUMBER QCHAR LBRACKET RBRACKET DIGIT COMMENT LETTER	 

%%

program				: ext_declaration
					| program ext_declaration
					;

ext_declaration		: declaration
					| funct_def
					;

declaration			: INT declarator_list SEMICOLON
					;

declarator_list		: declarator
					| declarator_list COMMA declarator
					;

declarator			: NAME
					| LETTER
					;

funct_def			: INT declarator LPAR param_type_list_opt RPAR comp_state
					;

param_type_list_opt	: /*empty*/
					| param_type_list
					;

param_type_list		: param_declaration
					| param_type_list COMMA param_declaration
					;

param_declaration	: INT declarator
					;

state				: SEMICOLON
					| expr SEMICOLON
					| comp_state
					| IF LPAR expr RPAR state
					| IF LPAR expr RPAR state ELSE state
					| WHILE LPAR expr RPAR state
					| RETURN expr SEMICOLON
					;

comp_state			: LBRACE declaration_list_opt state_list_opt RBRACE
					;

declaration_list_opt: /*empty*/
					| declaration_list
					;

state_list_opt		: /*empty*/
					| state_list
					;

declaration_list	: declaration
					| declaration_list declaration
					;

state_list			: state
					| state_list state
					;

expr				: assign_expr
					| expr COMMA assign_expr
					;

assign_expr			: logical_OR_expr
					| NAME ASSIGN assign_expr
					| LETTER ASSIGN assign_expr
					;


logical_OR_expr		: logical_AND_expr
					| logical_OR_expr OR logical_AND_expr
					;

logical_AND_expr	: equality_expr
					| logical_AND_expr AND equality_expr
					;

equality_expr		: relation_expr
					| equality_expr EQUAL relation_expr
					| equality_expr NEQUAL relation_expr
					;

relation_expr		: add_expr
					| relation_expr LESS add_expr
					| relation_expr GREATER add_expr
					;

add_expr			: mult_expr
					| add_expr PLUS mult_expr
					| add_expr MINUS mult_expr	
					;

mult_expr			: unary_expr
					| mult_expr TIMES unary_expr
					| mult_expr DIVIDE unary_expr
					;

unary_expr			: postfix_expr
					| MINUS unary_expr
					;

postfix_expr		: prim_expr
					| NAME LPAR argu_expr_list_opt RPAR
					;

argu_expr_list_opt	: /*empty*/
					| argu_expr_list
					;

prim_expr			: NAME
					| LETTER
					| DIGIT
					| LPAR expr RPAR
					;

argu_expr_list		: assign_expr
					| argu_expr_list COMMA assign_expr
					;

%%