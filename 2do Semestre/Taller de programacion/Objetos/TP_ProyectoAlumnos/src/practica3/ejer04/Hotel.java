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
    private Habitacion[] habitaciones;
    
    public Hotel(int cantHabitaciones) {
        this.dimF = cantHabitaciones;
        this.habitaciones = new Habitacion[this.dimF];
        
        for (int i = 0; i < dimF; i++)
            this.habitaciones[i] = new Habitacion();
    }
    
    public void asignarHabitacion(Persona persona, int numHabitacion) {
        habitaciones[numHabitacion - 1].setPersona(persona);
    }
    
    public void aumentarPrecio(double aumento) {
        for (int i = 0; i < dimF; i++) {
            Habitacion habitacion = habitaciones[i];
            habitacion.setCosto(habitacion.getCosto() + aumento);
        }
    }
    
    @Override
    public String toString() {
        String ret = "";
        
        for (int i = 0; i < dimF; i++) {
            if (!ret.equals(""))
                ret += "\n";
            
            ret += String.format(
                    "{Habitacion %d: %.2f, %s",
                    i + 1,
                    habitaciones[i].getCosto(), 
                    habitaciones[i].isOcupada() ? "Ocupada" : "Libre"
            );
            
            if (habitaciones[i].isOcupada())
                ret += ", " + habitaciones[i].getPersona().toString();
            
            ret += "}";
        }
        
        return ret;
    }
}
