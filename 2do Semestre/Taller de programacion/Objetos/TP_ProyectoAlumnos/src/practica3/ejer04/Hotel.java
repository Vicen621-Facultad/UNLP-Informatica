/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3.ejer04;

/**
 *
 * @author alumnos
 */
public class Hotel {
    private int dimF;
    private int dimL = 0;
    private Habitacion[] habitaciones;
    
    public Hotel(int habitaciones) {
        this.dimF = habitaciones;
        this.habitaciones = new Habitacion[this.dimF];
        
        for (int i = 0; i < dimL; i++)
            habitaciones[i] = new Habitacion();
    }
    
    public void asignarHabitacion(Persona persona, int numHabitacion) {
        habitaciones[numHabitacion].setPersona(persona);
    }
    
    public void aumentarPrecio(double aumento) {
        for (int i = 0; i < dimL; i++) {
            Habitacion habitacion = habitaciones[i];
            habitacion.setCosto(habitacion.getCosto() + aumento);
        }
    }
    
    
}
