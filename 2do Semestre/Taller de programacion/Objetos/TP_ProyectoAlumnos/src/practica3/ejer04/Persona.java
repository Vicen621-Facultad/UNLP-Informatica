/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3.ejer04;

import PaqueteLectura.Lector;


public class Persona {
    private String nombre;
    private int DNI;
    private int edad; 
    
    public Persona(String unNombre, int unDNI, int unaEdad){
        nombre = unNombre;
        DNI = unDNI;
        edad = unaEdad; 
    }
    
    public Persona(){
     
    }

    public int getDNI() {
        return DNI;
    }

    public int getEdad() {
        return edad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setDNI(int unDNI) {
        DNI = unDNI;
    }

    public void setEdad(int unaEdad) {
        edad = unaEdad;
    }

    public void setNombre(String unNombre) {
        nombre = unNombre;
    }
    
    public String toString(){
        String aux; 
        aux = "Mi nombre es " + nombre + ", mi DNI es " + DNI + " y tengo " + edad + " años.";
        return aux;
    }
    
    public static Persona leerPersona() {
        Persona persona = new Persona();
        System.out.print("Ingrese nombre: ");
        persona.setNombre(Lector.leerString());
        
        System.out.print("Ingrese DNI: ");
        persona.setDNI(Lector.leerInt());
        
        System.out.print("Ingrese Edad: ");
        persona.setEdad(Lector.leerInt());
        
        return persona;
    }
}
