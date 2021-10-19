package codigo;
import static codigo.Tokens.*;

%%
%class Lexico
%type Tokens
L=[a-zA-Z_]+
NumeroM0 = [1-9][0-9]*
Numero = (0|{NumeroM0})(\.(0|{NumeroM0}[1-9]))?
Punto = ["."]
Real = [0-9]("."[0-9]*[1-9]+)?
espacio=[ ,\s,\r,\n]+
Cadena   = \".*\"
%{
    public String lexeme;
%}
%%
/*Palabras Reservadas*/
entero |
real |
cadena |
boleano |
nulo |
si |
entonces |
sino |
devolver |
verdadero |
falso |
desde |
mientras |
incrementar |
decrementar |
hacer |
desde |
escribir |
clase |
extiende |
incluir |
propiedades |
metodos |
publicas |
privadas |
protegidas |
Principal |
eliminar |
instanciar |
constructor |
destructor {lexeme=yytext(); return Reservada;}

{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"/*".*"*/" {/*Ignore*/}

/*Operadores*/
"=" {lexeme=yytext();return Igual;}
"+" {lexeme=yytext();return Suma;}
"-" {lexeme=yytext();return Resta;}
"*" {lexeme=yytext();return Multiplicacion;}
"/" {lexeme=yytext();return Division;}
"%" {lexeme=yytext();return Modulo;}
"^" {lexeme=yytext();return Exponenciacion;}
"++" {lexeme=yytext();return Incremento;}
"--" {lexeme=yytext();return Decremento;}
"==" {lexeme=yytext();return Comparador;} 
"!=" {lexeme=yytext();return Diferente;}
"<=" {lexeme=yytext();return MenorIgual;}
">=" {lexeme=yytext();return MayorIgual;}
">" {lexeme=yytext();return Mayor;}
"<" {lexeme=yytext();return Menor;}
"AND" {lexeme=yytext();return And;}
"OR" {lexeme=yytext();return Or;}

/*Otros*/
":" {lexeme=yytext();return DosPuntos;} 
";" {lexeme=yytext();return PuntoComa;} 
"(" {lexeme=yytext();return ParentesisA;} 
")" {lexeme=yytext();return ParentesisC;} 
"[" {lexeme=yytext();return CorcheteA;} 
"]" {lexeme=yytext();return CorcheteC;} 
"," {lexeme=yytext();return Coma;}

/*Numeros, Identificadores y Cadenas*/
{Numero} {lexeme=yytext();return Entero;}
{Real} {lexeme=yytext();return Real;}
{L}({L}|{Numero})* {lexeme=yytext(); return Identificador;}
{Cadena}        {lexeme=yytext(); return Cadena;}
 . {return ERROR;}
