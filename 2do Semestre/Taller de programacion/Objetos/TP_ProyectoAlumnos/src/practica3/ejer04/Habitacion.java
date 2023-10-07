/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3.ejer04;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author alumnos
 */
public class Habitacion {
   private double costo;
    private Persona persona;
    
    public Habitacion() {
        this.costo = GeneradorAleatorio.generarDouble(6000) + 2000; // Numero aleatorio entre 2000 y 8000
        this.persona = null;
    }
    
    public boolean isOcupada() {
        return persona != null;
    }

    public double getCosto() {
        return costo;
    }
    
    public double setCosto(double costo) {
        this.costo = costo;
    }

    public Persona getPersona() {
        return persona;
    }

    public void setPersona(Persona persona) {
        this.persona = persona;
    }
    
    
}
