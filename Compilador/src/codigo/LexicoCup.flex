package codigo;
import java_cup.runtime.Symbol;

%%
%class LexicoCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
L1 = [a-z_]+
L2 = [A-Z_]+
NumeroM0 = [1-9][0-9]*
Numero = (0|{NumeroM0})(\.(0|{NumeroM0}[1-9]))?
Real = {Numero}("."[0-9]*[1-9]+)?
espacio=[ ,\s,\r,\n]+
Tab = \t|{espacio}{4}
Cadena   = \".*\"
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%
/*Palabras Reservadas*/
entero {return new Symbol(sym.Entero, yychar, yyline, yytext());}
real {return new Symbol(sym.Real, yychar, yyline, yytext());}
cadena {return new Symbol(sym.Cadena, yychar, yyline, yytext());}
boleano {return new Symbol(sym.Boleano, yychar, yyline, yytext());}
nulo {return new Symbol(sym.Nulo, yychar, yyline, yytext());}
si {return new Symbol(sym.Si, yychar, yyline, yytext());}
entonces {return new Symbol(sym.Entonces, yychar, yyline, yytext());}
sino {return new Symbol(sym.Sino, yychar, yyline, yytext());}
devolver {return new Symbol(sym.Devolver, yychar, yyline, yytext());}
verdadero {return new Symbol(sym.Verdadero, yychar, yyline, yytext());}
falso {return new Symbol(sym.Falso, yychar, yyline, yytext());}
desde {return new Symbol(sym.Desde, yychar, yyline, yytext());}
mientras {return new Symbol(sym.Mientras, yychar, yyline, yytext());}
incrementar {return new Symbol(sym.Incrementar, yychar, yyline, yytext());}
decrementar {return new Symbol(sym.Decrementar, yychar, yyline, yytext());}
hacer {return new Symbol(sym.Hacer, yychar, yyline, yytext());}
escribir {return new Symbol(sym.Escribir, yychar, yyline, yytext());}
clase {return new Symbol(sym.Clase, yychar, yyline, yytext());}
extiende {return new Symbol(sym.Extiende, yychar, yyline, yytext());}
incluir {return new Symbol(sym.Incluir, yychar, yyline, yytext());}
propiedades {return new Symbol(sym.Propiedades, yychar, yyline, yytext());}
metodos {return new Symbol(sym.Metodos, yychar, yyline, yytext());}
publicas {return new Symbol(sym.Publicas, yychar, yyline, yytext());}
privadas {return new Symbol(sym.Privadas, yychar, yyline, yytext());}
protegidas {return new Symbol(sym.Protegidas, yychar, yyline, yytext());}
Principal {return new Symbol(sym.Principal, yychar, yyline, yytext());}
eliminar {return new Symbol(sym.Eliminar, yychar, yyline, yytext());}
instanciar {return new Symbol(sym.Instanciar, yychar, yyline, yytext());}
constructor {return new Symbol(sym.Constructor, yychar, yyline, yytext());}
destructor {return new Symbol(sym.Destructor, yychar, yyline, yytext());}

{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"/*".*"*/" {/*Ignore*/}
( "\"" ) {return new Symbol(sym.Comillas, yychar, yyline, yytext());}

/*Operadores*/
"=" {return new Symbol(sym.Igual, yychar, yyline, yytext());}
"+" {return new Symbol(sym.Suma, yychar, yyline, yytext());}
"-" {return new Symbol(sym.Resta, yychar, yyline, yytext());}
"*" {return new Symbol(sym.Multiplicacion, yychar, yyline, yytext());}
"/" {return new Symbol(sym.Division, yychar, yyline, yytext());}
"%" {return new Symbol(sym.Modulo, yychar, yyline, yytext());}
"^" {return new Symbol(sym.Exponenciacion, yychar, yyline, yytext());}
"++" {return new Symbol(sym.Incremento, yychar, yyline, yytext());}
"--" {return new Symbol(sym.Decremento, yychar, yyline, yytext());}
"==" {return new Symbol(sym.Comparador, yychar, yyline, yytext());} 
"!=" {return new Symbol(sym.Diferente, yychar, yyline, yytext());}
"<=" {return new Symbol(sym.MenorIgual, yychar, yyline, yytext());}
">=" {return new Symbol(sym.MayorIgual, yychar, yyline, yytext());}
">" {return new Symbol(sym.Mayor, yychar, yyline, yytext());}
"<" {return new Symbol(sym.Menor, yychar, yyline, yytext());}
"AND" {return new Symbol(sym.And, yychar, yyline, yytext());}
"OR" {return new Symbol(sym.Or, yychar, yyline, yytext());}

/*Otros*/
":" {return new Symbol(sym.DosPuntos, yychar, yyline, yytext());} 
";" {return new Symbol(sym.PuntoComa, yychar, yyline, yytext());} 
"(" {return new Symbol(sym.ParentesisA, yychar, yyline, yytext());} 
")" {return new Symbol(sym.ParentesisC, yychar, yyline, yytext());} 
"[" {return new Symbol(sym.CorcheteA, yychar, yyline, yytext());} 
"]" {return new Symbol(sym.CorcheteC, yychar, yyline, yytext());} 
"{" {return new Symbol(sym.LlaveA, yychar, yyline, yytext());} 
"}" {return new Symbol(sym.LlaveC, yychar, yyline, yytext());} 
"," {return new Symbol(sym.Coma, yychar, yyline, yytext());}


/*Numeros, Identificadores y Cadenas*/
{Numero} {return new Symbol(sym.NumEntero, yychar, yyline, yytext());}
{Real} {return new Symbol(sym.NumReal, yychar, yyline, yytext());}
{L1}({L1}|{Numero})* {return new Symbol(sym.Identificador, yychar, yyline, yytext());}
{L2}({L1}|{Numero})* {return new Symbol(sym.IdClase, yychar, yyline, yytext());}
{Cadena}        {return new Symbol(sym.CadenaT, yychar, yyline, yytext());}
{Tab} {return new Symbol(sym.Tabulador, yychar, yyline, yytext());}
"." {return new Symbol(sym.Punto, yychar, yyline, yytext());}
 . {return new Symbol(sym.ERROR, yychar, yyline, yytext());}
