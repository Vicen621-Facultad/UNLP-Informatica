package practica2;
import PaqueteLectura.Lector;

/**
 * @author vicen
 */
public class Ejer01 {
    public static void main(String[] args) {
        System.out.print("Ingrese el nombre: ");
        String name = Lector.leerString();
        
        System.out.print("Ingrese DNI: ");
        int dni = Lector.leerInt();
        
        System.out.print("Ingrese Edad: ");
        int edad = Lector.leerInt();
        
        Persona persona = new Persona(name, dni, edad);
        System.out.println(persona.toString());
    }
}
