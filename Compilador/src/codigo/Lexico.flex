package codigo;
import static codigo.Tokens.*;

%%
%class Lexico
%type Tokens
L1 = [a-z_]+
L2 = [A-Z_]+
NumeroM0 = [1-9][0-9]*
Numero = (0|{NumeroM0})(\.(0|{NumeroM0}[1-9]))?
Real = {Numero}("."[0-9]*[1-9]+)?
espacio=[ ,\s,\r]+
Tab = \t|{espacio}{4}
Cadena   = \".*\"
%{
    public String lexeme;
%}
%%
/*Palabras Reservadas*/
entero {lexeme=yytext(); return Entero;}
real {lexeme=yytext(); return Real;}
cadena {lexeme=yytext(); return Cadena;}
boleano {lexeme=yytext(); return Boleano;}
nulo {lexeme=yytext(); return Nulo;}
si {lexeme=yytext(); return Si;}
entonces {lexeme=yytext(); return Entonces;}
sino {lexeme=yytext(); return Sino;}
devolver {lexeme=yytext(); return Devolver;}
verdadero {lexeme=yytext(); return Verdadero;}
falso {lexeme=yytext(); return Falso;}
desde {lexeme=yytext(); return Desde;}
mientras {lexeme=yytext(); return Mientras;}
incrementar {lexeme=yytext(); return Incrementar;}
decrementar {lexeme=yytext(); return Decrementar;}
hacer {lexeme=yytext(); return Hacer;}
escribir {lexeme=yytext(); return Escribir;}
clase {lexeme=yytext(); return Clase;}
extiende {lexeme=yytext(); return Extiende;}
incluir {lexeme=yytext(); return Incluir;}
propiedades {lexeme=yytext(); return Propiedades;}
metodos {lexeme=yytext(); return Metodos;}
publicas {lexeme=yytext(); return Publicas;}
privadas {lexeme=yytext(); return Privadas;}
protegidas {lexeme=yytext(); return Protegidas;}
Principal {lexeme=yytext(); return Principal;}
eliminar {lexeme=yytext(); return Eliminar;}
instanciar {lexeme=yytext(); return Instanciar;}
constructor {lexeme=yytext(); return Constructor;}
destructor {lexeme=yytext(); return Destructor;}

{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"/*".*"*/" {/*Ignore*/}
"\n" {return Linea;}
( "\"" ) {lexeme=yytext(); return Comillas;}

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
"{" {lexeme=yytext();return LlaveA;} 
"}" {lexeme=yytext();return LlaveC;} 
"," {lexeme=yytext();return Coma;}

/*Numeros, Identificadores y Cadenas*/
{Numero} {lexeme=yytext();return NumEntero;}
{Real} {lexeme=yytext();return NumReal;}
{L1}({L1}|{Numero})* {lexeme=yytext(); return Identificador;}
{L2}({L1}|{Numero})* {lexeme=yytext(); return IdClase;}
{Cadena} {lexeme=yytext(); return CadenaT;}
{Tab} {lexeme=yytext(); return Tabulador;}
"." {lexeme=yytext();return Punto;}
 . {return ERROR;}
