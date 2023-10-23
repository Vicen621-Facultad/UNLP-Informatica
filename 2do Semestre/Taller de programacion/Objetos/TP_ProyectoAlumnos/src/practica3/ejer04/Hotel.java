package practica3.ejer04;

public class Hotel {
    private int dimF;
    private Habitacion[] habitaciones;
    
    public Hotel(int cantHabitaciones) {
        this.dimF = cantHabitaciones;
        this.habitaciones = new Habitacion[this.dimF];
        
        for (int i = 0; i < dimF; i++)
            this.habitaciones[i] = new Habitacion(i + 1);
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
            
            ret += habitaciones[i].toString();
        }
        
        return ret;
    }
}
