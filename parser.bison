%token
  ID
  BEGIN
  END
  PROGRAM
  VAR
  WHILE
  IF
  ELSE
  DO 
  THEN
  INTEGER 
  REAL
  BOOL
  PLUS
  MINUS
  DIV 
  MULT
  GREATER
  LESS
  EQUAL
  EQUIV
  NOT
  OR
  AND
  LPAREN
  RPAREN
  SEMICOLON
  COLON
  COMMA
  DOT

// falta precedências dos operadores
%left PLUS MINUS
%left DIV MULT MOD
%left OR AND GREATER LESS EQUAL EQUIV
%right NOT
%start program 

// quando forem criados headers/variaveis globais colocar aqui

%code requires{
  #include <stdio.h>
  #include <stdlib.h>

  extern Expr* root;
}

%%

program: expr = {root = $1;}

expr:
// main parser aqui
%%


//colocar error message também eventualmente por favor 

