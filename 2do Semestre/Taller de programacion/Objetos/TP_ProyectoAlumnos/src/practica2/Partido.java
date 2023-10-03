/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica2;

import PaqueteLectura.Lector;


public class Partido {
    private String local;
    private String visitante;
    private int golesLocal; 
    private int golesVisitante;
    
    public Partido(){
    
    }

    public Partido(String unLocal, String unVisitante, int unGolLocal, int unGolVisitante){
        local = unLocal;
        visitante = unVisitante;
        golesLocal = unGolLocal;
        golesVisitante = unGolVisitante;
    }

    
    public String getLocal() {
        return local;
    }

    public String getVisitante() {
        return visitante;
    }

    public int getGolesLocal() {
        return golesLocal;
    }

    public int getGolesVisitante() {
        return golesVisitante;
    }

    public void setLocal(String unEquipo) {
        local = unEquipo;
    }

    public void setVisitante(String unEquipo) {
        visitante = unEquipo;
    }

    public void setGolesLocal(int unosGoles) {
        golesLocal = unosGoles;
    }

    public void setGolesVisitante(int unosGoles) {
        golesVisitante = unosGoles;
    }
    
    public boolean hayGanador(){
         return (golesLocal!=golesVisitante); 
    }
    
    public boolean hayEmpate(){
         return ((golesLocal==golesVisitante));
    }
    
    public String getGanador(){
         String ganador=new String();
         if (golesLocal>golesVisitante){
             ganador = local;
         }
         else {
             if (golesLocal<golesVisitante){
                 ganador = visitante;
             }
         }
         return ganador;
                 
    }	

    public String toString() {
        return "{" +  local + " " +  golesLocal + " VS " + visitante + " " + golesVisitante + "}";
    }
    
    public static Partido leerPartido() {
        Partido partido = new Partido();
        System.out.print("Ingrese equipo local: ");
        partido.setLocal(Lector.leerString());
        
        System.out.print("Ingrese equipo visitante: ");
        partido.setVisitante(Lector.leerString());
        
        System.out.print("Ingrese goles local: ");
        partido.setGolesLocal(Lector.leerInt());
        
        System.out.print("Ingrese goles visitante: ");
        partido.setGolesVisitante(Lector.leerInt());
        return partido;
    }
}
