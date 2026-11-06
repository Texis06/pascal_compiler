
#ifndef TOKENS_H
#define TOKENS_H

typedef enum {
    PLUS = 256,
    MINUS,
    MULT,
    DIV,
    GREATER,
    LESS,
    EQUAL,
    MOD,
    LPAREN,
    RPAREN,
    SEMICOLON,
    COMMA,
    ASSIGN,
    COLON,
    DOT,
    NEQ,
    LBRACE,
    RBRACE,
    ID,
    NUM,
    REAL,
    BEGING,
    END,
    IF,
    ELSE,
    PROGRAM,
    VAR,
    WHILE,
    DO,
    THEN,
    BOOL,
    NOT,
    TRUE_,
    FALSE_,

} TokenType;

typedef union {
    int intValue;
    double realValue;
    char *stringValue;
} YYSTYPE;


extern YYSTYPE yylval;

#endif
