/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package codigo;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.FileReader;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * 
 */
public class loop {
    
    static BufferedReader bf;
    
    public static void main (String[] args) throws Exception{
        try {
            InputStreamReader isr = new InputStreamReader(System.in);
            
            bf = new BufferedReader(isr);
            String archivoProcesado;
            switch (args.length) {
                case 1:
                    String archivoEntrada =args[0];
                    if (archivoEntrada.equals("")) {
                        System.out.println("ERROR: No se recibio el archivo de entrada.");
                        break;
                    }
                    System.out.println("Archivo recibido: " + archivoEntrada);
                    if (!archivoEntrada.endsWith(".txt")) {
                        System.out.println("ERROR: La extension del archivo es invalida.");
                        break;
                    }
                    try {
                        new File(archivoEntrada);
                    } catch (Exception e) {
                        throw new Exception("ERROR: No se puede abrir el achivo. Verifique que la ruta sea correcta y que el nombre no lleve espacios");
                    }
                    
                    
                       
                    Sintax analizadorsintactico;
                    //semantico a; igual que el anterior 
                    try {
                        System.out.println("Iniciando analisis...");
                        Lexico AnalizadorLexico = new Lexico(new FileReader(archivoEntrada));
                        //analizadorsintactico = new Sintax(AnalizadorLexico);
                        //AnalizadorSintactico.parse();
                         //a = new semantico(AnalizadorSintactico.arbolSintactico);
                        //a.analizar();
                        System.out.println("Analisis finalizado.");
                    } catch (Exception e) {
                        throw new Exception("ERROR: Archivo no analizado: " + e.getMessage());
                    }
                    try {
                        System.out.println("********Ejecuatando archivo*******");
                        //Ejecucion ejecutar = new Ejecucion(a); aqui agregamos lo de asembler para generar el archivo de asembler
                       // ejecutar.ejecutar();
                        System.out.println("**************FIN*****************");
                    } catch (Exception e) {
                        System.out.println("ERROR DE EJECUCCION: " + e.getMessage());
                    }
                    break;
                case 0:
                    System.out.println("No se recibio un archivo");
                    break;
            }
            String entrada = bf.readLine();
        } catch (IOException ex) {
            Logger.getLogger(loop.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
