lexer grammar VisualBasic6ProjectLexer;

//@lexer::header { 
//  package br.com.recatalog.parser.visualbasic6; 
//}

@lexer::members {
 public static final int HIDDEN_WHITESPACE = 1;
 public static final int HIDDEN_COMMENTS = 2;
}

options
{
	language = Java;
}

// [MS Transaction Server] <---
// AutoRefresh=1
PROPERTY_SECTION : '[' (~[\]])*? ']'
;

PROPERTY_KEY : (LETTERORDIGIT | '(' | ')')+
;

PROPERTY_VALUE : '=' (~[\r\n'])+ //('\r'? '\n' | EOF)
;

COMMENT :  '\'' (~[\n\r])*? ('\r'? '\n' | EOF) -> channel(2)
;

NEW_LINE: '\r'? '\n' -> skip
;

WS : [ \t]+ -> skip
;

fragment LETTERORDIGIT : [a-zA-Z0-9_];

// case insensitive chars
fragment A:('a'|'A');
fragment B:('b'|'B');
fragment C:('c'|'C');
fragment D:('d'|'D');
fragment E:('e'|'E');
fragment F:('f'|'F');
fragment G:('g'|'G');
fragment H:('h'|'H');
fragment I:('i'|'I');
fragment J:('j'|'J');
fragment K:('k'|'K');
fragment L:('l'|'L');
fragment M:('m'|'M');
fragment N:('n'|'N');
fragment O:('o'|'O');
fragment P:('p'|'P');
fragment Q:('q'|'Q');
fragment R:('r'|'R');
fragment S:('s'|'S');
fragment T:('t'|'T');
fragment U:('u'|'U');
fragment V:('v'|'V');
fragment W:('w'|'W');
fragment X:('x'|'X');
fragment Y:('y'|'Y');
fragment Z:('z'|'Z');

/*
grammar Vbp;


@lexer::header { 
  package br.com.bicam.parser.visualbasic6; 
}


@parser::header {
  package br.com.bicam.parser.visualbasic6;
//  import br.com.bicam.util.Watch;
  import br.com.arcatalog.util.Watch;
}

@parser::members {
   Watch elapsedTime = new Watch();
}

options
{
	language = Java;
}


// module ----------------------------------

startRule : module EOF;

module : 
	 (propertySection | propriety)+
;

propertySection :
 Name=PROPERTY_SECTION propriety+
;

// AutoRefresh=1
propriety :
 propertyKey=PROPERTY_KEY propertyValue=PROPERTY_VALUE
;

// [MS Transaction Server] <---
// AutoRefresh=1
PROPERTY_SECTION : '[' (~[\]])* ']'
;

PROPERTY_KEY : (LETTERORDIGIT | '(' | ')')+
;

PROPERTY_VALUE : '=' (~[\r\n])+ ('\r'? '\n' | EOF)
;

COMMENT :  '\'' (~[\n\r])* ('\r'? '\n' | EOF) -> skip
;

NEW_LINE: '\r'? '\n' -> skip
;

WS : [ \t]+ -> skip
;

fragment LETTERORDIGIT : [a-zA-Z0-9_];
*/