lexer grammar VisualBasic6CompUnitLexer;

/* 
SYNTAX - LINE CONTINUATION
	The line continuation character "_" is actually two characters.
	There must always be a space before the underscore.
	This is an underscore character that must be prefixed by a space (" _").
	The line continuation character cannot be followed by any other characters (including comments).
	You cannot have a line continuation character in the middle of a literal string.
*/

/*
To place multiple statements on the same line
Separate the statements with a colon (:), as in the following example.

1) cuidado para diferenci�-lo de label;
2) ":" deve ser seguido de espa�o ": " ou estar na final da linha, ou seja, seguido de eol (\r\n)

Ex:
text1.Text = "Hello" : text1.BackColor = System.Drawing.Color.Red
*/

//@lexer::header { 
//  package br.com.arcatalog.parser.vb6; 
//}

@lexer::members {
// public int HIDDEN_WHITESPACE = 2; //Especificar "1" e n�o "HIDDEN_WHITESPACE" ERRO a ser corrigido
// public int HIDDEN_COMMENT = 3;
 
 public boolean startOfLine = true;
 public boolean insideUIProperty = false;
 public boolean lineNumber = false;
}

tokens {  IDENTIFIER
         ,FLOAT
         ,INTEGER
         ,STRING_LITERAL
         ,LABEL }
         
channels { HIDDEN_WHITESPACE 
           , HIDDEN_COMMENT
           }
        
// keywords
ELSE_DIRECTIVE : '#' E L S E ;
ELSEIF_DIRECTIVE : '#' E L S E I F; 
END_ENUM : E N D   WS+   E N U M ;
END_FUNCTION : E N D   WS+   F U N C T I O N ;
END_IF : E N D   WS+   I F ;
END_IF_DIRECTIVE : '#' E N D    WS+   I F ; 
END_PROPERTY : E N D   WS+   P R O P E R T Y ;
END_SELECT : E N D   WS+   S E L E C T ;
END_SUB : E N D   WS+   S U B ;
END_TYPE : E N D   WS+   T Y P E ;
END_WITH : E N D   WS+   W I T H ;
EXIT_DO : E X I T   WS+   D O ;
EXIT_FOR : E X I T   WS+   F O R ;
EXIT_FUNCTION : E X I T   WS+   F U N C T I O N ;
EXIT_PROPERTY : E X I T   WS+   P R O P E R T Y ;
EXIT_SUB : E X I T   WS+   S U B ;
IF_DIRECTIVE : '#' I F ;
LIKE : L I K E ;
LINE_INPUT : L I N E  WS+   I N P U T ;
LOCK_READ : L O C K   WS+   R E A D ;
LOCK_WRITE : L O C K  WS+   W R I T E ;
LOCK_READ_WRITE : L O C K WS+ R E A D   WS+   W R I T E ;
//MACRO_IF : '#' I F ;
//MACRO_ELSEIF : '#' E L S E I F ;
//MACRO_ELSE : '#' E L S E ;
//MACRO_END_IF : '#' E N D   WS+   I F ;
ON_ERROR : O N   WS+   E R R O R ;
//OPTION_BASE : O P T I O N   WS+   B A S E ;
//OPTION_EXPLICIT : O P T I O N  WS+  ((E X P L I C I T) | (E X P L I C I T WS O N)) ;
                 
//OPTION_EXPLICIT_OFF : O P T I O N   WS+   E X P L I C I T WS O F F ;
//OPTION_COMPARE : O P T I O N   WS+   C O M P A R E ;
//OPTION_PRIVATE_MODULE : O P T I O N   WS+   P R I V A T E WS+ M O D U L E ;
PROPERTY_GET : P R O P E R T Y   WS+   G E T ;
PROPERTY_LET : P R O P E R T Y   WS+   L E T ;
PROPERTY_SET : P R O P E R T Y   WS+   S E T ;
//======================================  keyword ===================================
ACCESS : A C C E S S ;
ADDRESSOF : A D D R E S S O F ;
ALIAS :   A L I A S ;
AND : A N D ;
ANY :	A N Y ;
APPACTIVATE : A P P A C T I V A T E ;
APPEND : A P P E N D ;
AS : A S ;
ATTRIBUTE : A T T R I B U T E ;
BEEP : B E E P ;
BEGIN : B E G I N ;
BINARY : B I N A R Y ;
BOOLEAN : B O O L E A N ;
BYREF :  B Y R E F ;
BYTE :  B Y T E ;
BYVAL :  B Y V A L ;
CALL : C A L L ;
CASE : C A S E ;
CHDIR :  C H D I R ;
CHDRIVE : C H D R I V E ;
CLASS :  C L A S S ;
CLOSE : C L O S E ;
COLLECTION :  C O L L E C T I O N ; 
CONST :  C O N S T ;
DATE : D A T E ;
DECLARE : D E C L A R E ;
DEFBOOL : D E F B O O L ;
DEFBYTE : D E F B Y T E ;
DEFCUR : D E F C U R ;
DEFDATE : D E F D A T E ;
DEFDBL : D E F D B L ;
DEFDEC : D E F D E C ;
DEFINT : D E F I N T ;
DEFLNG : D E F L N G  ;
DEFLNGLNG : D E F L N G L N G ;
DEFLNGPTR : D E F L N G P T R ;
DEFOBJ : D E F O B J ;
DEFSNG : D E F S N G ;
DEFSTR : D E F S T R ;
DEFVAR : D E F V A R ;
DELETESETTING : D E L E T E S E T T I N G ;
DIM : D I M ;
DO : D O ;

DO_WHILE : D O WS+ W H I L E ;
DO_UNTIL : D O WS+ U N T I L ;

DOEVENTS : D O E V E N T S ;
DOUBLE :  D O U B L E ;
EACH : E A C H  ;
ELSE :  E L S E ;
ELSEIF : E L S E I F ;
EMPTY : E M P T Y ;
END :  E N D ;
ENUM : E N U M  ;
ERASE : E R A S E ;
ERROR : E R R O R ;
EVENT : E V E N T ;
EXIT : E X I T ;
FALSE : F A L S E ;
FILECOPY : F I L E C O P Y ;
FLOAT :  F L O A T ;
FOR : F O R ;
FUNCTION : F U N C T I O N ;
GET : G E T ;
GLOBAL : G L O B A L ;
GOSUB : G O S U B  ;
GOTO : G O T O ;
IF : I F ;
//IIF : I I F ;
IN : I N ;
IS : I S ;
INPUT : I N P U T ;
INTEGER : I N T E G E R ;
KILL : K I L L ;
LEN : L E N ;
LET : L E T ;
LIB : L I B ;
LOAD : L O A D ;
LOCK : L O C K ;
LONG : L O N G ;
LOOP : L O O P;
LOOP_WHILE : L O O P  WS+ W H I L E ;
LOOP_UNTIL : L O O P  WS+ U N T I L ;

LSET : L S E T ;
MKDIR : M K D I R ;
NAME : N A M E ;
NEXT : N E X T ;
NEW : N E W ;
NOT : N O T ;
NOTHING : N O T H I N G ;
NULL : N U L L ;
MOD : M O D ;
OBJECT : O B J E C T ;
OFF : O F F ;
ON : O N ;
OPEN : O P E N ;
OPTION : O P T I O N ;
OPTIONAL : O P T I O N A L ;
OR : O R ;
OUTPUT : O U T P U T ;
PARAMARRAY :  P A R A M A R R A Y ;
PRESERVE : P R E S E R V E ;
PRINT :  P R I N T ;
PRIVATE : P R I V A T E ;
PROPERTY : P R O P E R T Y ;
PUBLIC : P U B L I C ;
PTRSAFE : P T R S A F E ;
PUT : P U T ;
RAISEEVENT : R A I S E E V E N T ;
RANDOM : R A N D O M ;
RANDOMIZE : R A N D O M I Z E ;
READ : R E A D  ;
REDIM : R E D I M  ;
REM : R E M ;
RESET :  R E S E T ;
RESUME : R E S U M E ;
RMDIR : R M D I R ;
RSET : R S E T  ;
SAVESETTING : S A V E S E T T I N G ;
SEEK : S E E K ;
SELECT : S E L E C T ;
SENDKEYS :  S E N D K E Y S ;
SET : S E T ;
SETATTR :  S E T A T T R ;
SHARED : S H A R E D ;
SINGLE : S I N G L E ;
STATIC : S T A T I C;
STEP : S T E P  ;
STOP : S T O P ;
STRING :  S T R I N G ;
SUB : S U B ;
TEXT :  T E X T ;
THEN : T H E N  ;
TIME : T I M E  ;
TO : T O;
TRUE : T R U E ;
TYPE : T Y P E ; 
TYPEOF : T Y P E O F ;
UNLOAD : U N L O A D ;
UNLOCK :  U N L O C K ;
UNTIL :  U N T I L ;
VARIANT : V A R I A N T ;
VERSION : V E R S I O N ;
WEND : W E N D  ;
WHILE : W H I L E ;
WIDTH : W I D T H ;
WITH : W I T H ;
WITHEVENTS : W I T H E V E N T S ;
WRITE : W R I T E  ;

ANDALSO : A N D A L S O ; 
BASE : B A S E ; 
COMPARE : C O M P A R E ; 
EQV : E Q V ; 
EXPLICIT : E X P L I C I T ; 
FRIEND : F R I E N D ; 
IMP : I M P ; 
IMPLEMENTS : I M P L E M E N T S ; 
LINE : L I N E ; 
MACRO : M A C R O ; 
ME : M E ; 
MODULE : M O D U L E ; 
RETURN : R E T U R N ; 
SAVEPICTURE : S A V E P I C T U R E ; 
SPC : S P C ; 
TAB : T A B ; 
XOR : X O R ; 


BEGINPROPERTY: B E G I N P R O P E R T Y ;
ENDPROPERTY: E N D P R O P E R T Y ;  

HASH_CHAR : '#' ;
AMP_CHAR : '&' ;
NOT_CHAR : '!' ;
PERCENT :  '%' ;
AT : '@' ;
DOLAR : '$' ;

COLON_CHAR : ':' ;
SEMI_CHAR : ',' ;
SEMI_COLON_CHAR : ';' ;
DOT_CHAR :   '.' ;
LPAREN_CHAR : '(' ;
RPAREN_CHAR : ')' ;
EXPONENT_CHAR : '^' ;
PLUS_CHAR : '+' ;
MINUS_CHAR : '-' ;
MULT_CHAR : '*' ;
DIV_CHAR : '/' ;
MOD_CHAR : '\\' ;
EQUAL_CHAR : '=' ;
LT_CHAR : '<' ;
LE_CHAR : '<=' ;
GT_CHAR : '>' ;
GE_CHAR : '>=' ;
NOT_EQUAL : '<>' ;
PARAM_EQUALS : ':=' ;

//NOTE: LABEL SYNTAX => https://docs.microsoft.com/en-us/office/vba/language/glossary/vbe-glossary#line-label
LABEL_COL1 :  {getCharPositionInLine() == 0}? (LETTER | DIGIT | '_')+? ':' -> type(LABEL) ; 
LINENUMBER :  {getCharPositionInLine() == 0}? DIGIT+ {lineNumber = true;};
LABEL_COLX :  {lineNumber == true}? (LETTER | DIGIT | '_')+? ':'  {lineNumber = false; setType(LABEL);} ;

LINE_CONTINUATION : ' _' '\r'? '\n' -> skip;

STMT_DELIMITER : (': ' | ': _' '\r'? '\n' | ':' '\r'? '\n');
           
COMMENT : (    '\'' (LINE_CONTINUATION | ~('\r' | '\n'))* 
            |   REM WS (LINE_CONTINUATION | ~('\r' | '\n'))*
            |   REM '\r'? '\n') -> channel(HIDDEN_COMMENT) ;
           
IMAGE_VALUE: '$'? '"' ~('"')*?  '"' ':' ([0-9] | [A-F])+ ; 

SHORTCUT : '^' ~[}]+? '}' | '^' [a-zA-Z0-9{}()]+ ;

CURLY_LITERAL : '{' ~[}]*? '}' {startOfLine = false;} ;
DATELITERAL : '#' ~[#,\r\n]*? '#' {startOfLine = false;} ;

HEXLITERAL : '&H' [0-9A-F]+  {startOfLine = false;} ;
 
COLORLITERAL : '&H' [0-9A-F]+? '&' {startOfLine = false;} ; 

STRING_LITERAL1 : '"'  (~[\r\n"])*? '"' -> type(STRING_LITERAL) ; 
STRING_LITERAL2 : '"' ( ESCAPE_STRING | ~[\r\n"])* '"' -> type(STRING_LITERAL); // DON'T USE *?... WONT WORK!

INT : DIGIT+  -> type(INTEGER)  ;                                     
INT_INDICATOR : DIGIT+ TYPE_INDICATOR -> type(INTEGER)  ;             

FLOAT_NO_EXPOENT     : DIGIT+ '.' DIGIT* -> type(FLOAT)  ;
FLOAT_NO_SIGNIFICAND : DIGIT* '.' DIGIT+  -> type(FLOAT)   ;

EXPONENTIAL : DIGIT+ [Ee] [+-] DIGIT+ ;

BRACKET_IDENTIFIER : '[' ~(']')+? ']' -> type(IDENTIFIER) ;

ID : NAME_START_CHAR NAME_CHAR* {lineNumber = false; setType(IDENTIFIER);} ;

ID_TYPEINDICATOR : NAME_START_CHAR NAME_CHAR*  TYPE_INDICATOR -> type(IDENTIFIER) ; 

FILENUMBER : '#' [a-zA-Z0-9_]+ ; 

NEWLINE : '\r'? '\n' {lineNumber = false;};

WS : [ \t]+ -> channel(HIDDEN_WHITESPACE) ;

fragment
ESCAPE_STRING : '""' ;

fragment
TYPE_INDICATOR :   '&'|'%'|'#'|'@'|'$' ;  //  '!' retirado de typeIndicator porque � qualificador de result set
//  
///*===
// -> Heran�a da linguagem BASIC - Vari�veis terminadas com os seguintes caracteres
// -> N�o tem qualquer significado em VB ou VB.Net
//      %                 Integer
//      &                 Long
//      !                 Single
//      #                 Double
//      $                 String
//      @                 Currency
//===*/ 
//
fragment
 LETTER : [a-zA-Z]
        | '\u00C3'  // �
        | '\u00C7'  // �
        | '\u00D5'  // �     
        | '\u00E3'  // �
        | '\u00E2'  // �
        | '\u00C2'  // �
        | '\u00F5'  // �
        | '\u00FA'  // �
        | '\u00DA'  // �                  
        | '\u00E7'  // �
        ;

fragment
 DIGIT : [0-9] ;

fragment
 NAME_CHAR : NAME_START_CHAR
	        |  DIGIT
	;

fragment
NAME_START_CHAR : [a-zA-Z_]
        | '\u00C3'  // �
        | '\u00C7'  // �
        | '\u00D5'  // �     
        | '\u00E3'  // �
        | '\u00E2'  // �
        | '\u00C2'  // �
        | '\u00F5'  // �
        | '\u00FA'  // �
        | '\u00DA'  // �                  
        | '\u00E7'  // �
        ;

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