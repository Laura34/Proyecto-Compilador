/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package codigo;

import java.io.File;

/**
 *
 * @author Laura
 */

public class Principal {
    public static void main(String[] args) {
        /*Se envian las reglas a JFlex para crear la clase Lexer*/
        
        //"ruta" se sustituye con la ruta del proyecto hasta el archivo .flex con las reglas
        //String ruta = "C:/Users/Laura/Documents/Compiladores/AnalizadorLexico/src/codigo/Lexer.flex";
        String ruta = "C:/Users/Usuario 1/Desktop/Proyecto-Compilador/Compilador/src/codigo/Lexico.flex";
        generarLexer(ruta);
    }
    public static void generarLexer(String ruta){
        File archivo = new File(ruta);
        JFlex.Main.generate(archivo);
    }
}
