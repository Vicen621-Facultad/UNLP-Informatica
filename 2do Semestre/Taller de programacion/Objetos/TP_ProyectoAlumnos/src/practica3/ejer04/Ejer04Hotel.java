package practica3.ejer04;

/**
 *
 * @author vicen
 */
public class Ejer04Hotel {

    public static void main(String[] args) {
        Hotel hotel = new Hotel(20);
        hotel.asignarHabitacion(Persona.leerPersona(), 10);
        hotel.asignarHabitacion(Persona.leerPersona(), 15);
        
        hotel.aumentarPrecio(1000);
        
        System.out.println(hotel.toString());
    }
    
}
