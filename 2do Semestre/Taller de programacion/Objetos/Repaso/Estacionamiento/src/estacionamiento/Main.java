package estacionamiento;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Main {

    public static void main(String[] args) {
        Estacionamiento estacionamiento = new Estacionamiento(
                "Test", 
                "Escalabrini Ortiz 2320", 
                "08:00",
                "21:00",
                3,
                3
        );
        
        GeneradorAleatorio.iniciar();
        
        for (int i = 0; i < 6; i++)
            estacionamiento.setAuto(
                    new Auto(GeneradorAleatorio.generarString(4), "AA00" + i + "AA"), 
                    GeneradorAleatorio.generarInt(3) + 1,
                    GeneradorAleatorio.generarInt(3) + 1
            );
        
        System.out.println(estacionamiento.toString());
        System.out.println("Cantidad de autos ubicados en la plaza 1: " + estacionamiento.getAutosPlaza(1));
        
        System.out.print("Ingrese patente a buscar: ");
        String patente = Lector.leerString();
        System.out.println(estacionamiento.getPosicion(patente));
    }
}
