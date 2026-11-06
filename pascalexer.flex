
%{
#include "tokens.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

YYSTYPE yylval;

int yyline = 1;
%}

%option noyywrap caseless

digit       [0-9]
letter      [a-zA-Z]
whitespace  [ \t]+

%%

{whitespace}  { }
\n            { yyline++; }

"+"           { return PLUS; }
"-"           { return MINUS; }
"*"           { return MULT; }
"/"           { return DIV; }
">"           { return GREATER; }
"<"           { return LESS; }
"="           { return EQUAL; }
"("           { return LPAREN; }
")"           { return RPAREN; }
";"           { return SEMICOLON; }
","           { return COMMA; }
":="          { return ASSIGN; }
":"           { return COLON; }
"."           { return DOT; }
"{"           { return LBRACE; }
"}"           { return RBRACE; }
"<>"          { return NEQ; }

false         { return FALSE_; }
true          { return TRUE_; }
mod           { return MOD; }
begin         { return BEGING; }
end           { return END; }
if            { return IF; }
else          { return ELSE; }
program       { return PROGRAM; }
var           { return VAR; }
while         { return WHILE; }
do            { return DO; }
then          { return THEN; }
boolean       { return BOOL; }
not           { return NOT; }

{digit}+\.{digit}+ {
    yylval.realValue = atof(yytext);
    return REAL;
}

{digit}+ {
    yylval.intValue = atoi(yytext);
    return NUM;
}

{letter}[_a-zA-Z0-9]* {
    yylval.stringValue = strdup(yytext);
    return ID;
}

. {
    printf("Unknown character: %s (line %d)\n", yytext, yyline);
}

%%

int main(void) {
    int token;

    printf("Starting lexer...\n");

    while ((token = yylex()) != 0) {

        switch (token) {

            case PLUS:      printf("PLUS\n"); break;
            case MINUS:     printf("MINUS\n"); break;
            case MULT:      printf("MULT\n"); break;
            case DIV:       printf("DIV\n"); break;
            case GREATER:   printf("GREATER\n"); break;
            case LESS:      printf("LESS\n"); break;
            case EQUAL:     printf("EQUAL\n"); break;
            case MOD:       printf("MOD\n"); break;
            case NEQ:       printf("NOT EQUAL\n"); break;

            case LPAREN:    printf("LPAREN\n"); break;
            case RPAREN:    printf("RPAREN\n"); break;
            case SEMICOLON: printf("SEMICOLON\n"); break;
            case COMMA:     printf("COMMA\n"); break;
            case ASSIGN:    printf("ASSIGN\n"); break;
            case COLON:     printf("COLON\n"); break;
            case DOT:       printf("DOT\n"); break;
            case LBRACE:    printf("LBRACE\n"); break;
            case RBRACE:    printf("RBRACE\n"); break;

            case BEGING:    printf("BEGIN\n"); break;
            case END:       printf("END\n"); break;
            case IF:        printf("IF\n"); break;
            case ELSE:      printf("ELSE\n"); break;
            case PROGRAM:   printf("PROGRAM\n"); break;
            case VAR:       printf("VAR\n"); break;
            case WHILE:     printf("WHILE\n"); break;
            case DO:        printf("DO\n"); break;
            case THEN:      printf("THEN\n"); break;
            case BOOL:      printf("BOOL\n"); break;
            case NOT:       printf("NOT\n"); break;

            case NUM:
                printf("NUM: %d\n", yylval.intValue);
                break;

            case REAL:
                printf("REAL: %f\n", yylval.realValue);
                break;

            case ID:
                printf("ID: %s\n", yylval.stringValue);
                free(yylval.stringValue);
                break;

            default:
                printf("Unknown token: %d\n", token);
                break;
        }
    }

    printf("Lexer finished.\n");

    return EXIT_SUCCESS;
}
