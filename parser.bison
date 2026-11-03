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
%nonassoc GREATER LESS EQUAL EQUIV
%left PLUS MINUS
%left DIV MULT MOD
%left OR AND
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
  expr PLUS expr { 
    $$ = ast_operation(PLUS, $1, $3); 
  }
  |
  expr MINUS expr { 
    $$ = ast_operation(MINUS, $1, $3); 
  }
  |
  expr DIV expr { 
    $$ = ast_operation(DIV, $1, $3); 
  }
  |
  expr MULT expr { 
    $$ = ast_operation(MULT, $1, $3); 
  }
  |
  expr MOD expr { 
    $$ = ast_operation(MOD, $1, $3); 
  }
  |
  expr EQUAL expr { 
    $$ = ast_operation(EQUAL, $1, $3); 
  }
  |
  expr EQUIV expr { 
    $$ = ast_operation(EQUIV, $1, $3); 
  }
  |
  expr GREATER expr { 
    $$ = ast_operation(GREATER, $1, $3); 
  }
  |
  expr LESS expr { 
    $$ = ast_operation(LESS, $1, $3); 
  }
  |
  expr OR expr { 
    $$ = ast_operation(OR, $1, $3); 
  }
  |
  expr AND expr { 
    $$ = ast_operation(AND, $1, $3); 
  }
  |
  expr NOT expr {
    $$ = ast_operation(NOT, $1, $3);
  }
// main parser aqui
%%


//colocar error message também eventualmente por favor 

