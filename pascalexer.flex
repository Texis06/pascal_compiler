%{

int yyline = 1;
%}

digit [0-9]
alpa [a-zA-Z]
whitespace [\n\t\s]


%%
{whitespace}+ {  }
#.*\n { yyline++; }
\n { yyline++; }
[0-9] {digit}
[a-zA-z] {alpha}

\-?[0-9] {
    yylval.intValue = atoi(yytext);
}

"+"                         { return PLUS;       } 
"-"                         { return MINUS;      }
"*"                         { return MULT;       }
"/"                         { return DIV;        }
">"                         { return GREATER;    }
"<"                         { return LESS;       }
"="                         { return EQUAL;      }
"("                         { return LPAREN;     }
")"                         { return RPAREN;     }
";"                         { return SEMICOLON;  }
","                         { return COMMA;      }
":="                        { return ASSIGN;     } 
":"                         { return COLON;      }
"."                         { return DOT;        }
"{"                         { return LBRACE;     }
"}"                         { return RBRACE;     }
[_{letter}]([_{letter}{digit}])+ { return ID;         }
{digit}+                    { return NUM;        }
{digit}\.{digit}+           { return REAL;       }
begin                       { return BEGIN;      }
end                         { return END;        }
if                          { return IF;         }    
else                        { return else;       }
program                     { return PROGRAM;    }
var                         { return VAR;        }
while                       { return WHILE;      }
do                          { return DO;         } 
then                        { return THEN;       }
boolean                     { return BOOL;       }
not                         { return NOT;        }