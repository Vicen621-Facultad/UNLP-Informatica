package practica4.ejer02;

public class Ejer02Empleados {

    public static void main(String[] args) {
        Empleado entrenador = new Entrenador(5, "Jose", 100, 5);
        Empleado jugador = new Jugador(10, 20, "Martin", 200, 1);
        
        System.out.println("Entrenador: " + entrenador.toString());
        System.out.println("Jugador: " + jugador.toString());
    }
    
}
