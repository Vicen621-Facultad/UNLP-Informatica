package practica1;

import PaqueteLectura.Lector;

public class Ej04Oficinas {
    public static void main(String[] args) {
        int PISOS = 8, OFI = 4;
        // Inicializo la matriz en 0
        int[][] oficinas = new int[PISOS][OFI];
        
        System.out.print("Ingrese numero de piso: ");
        int pisoActual = Lector.leerInt();
        System.out.print("Ingrese numero de oficina: ");
        int ofiActual = Lector.leerInt();
        while (pisoActual != 9) {
            oficinas[pisoActual - 1][ofiActual - 1]++;
            
            System.out.print("Ingrese numero de piso: ");
            pisoActual = Lector.leerInt();
            System.out.print("Ingrese numero de oficina: ");
            ofiActual = Lector.leerInt();
        }
        
        for (int i = 0; i < PISOS; i++)
            for (int j = 0; j < OFI; j++)
                System.out.println(String.format("A la oficina (%d, %d) fueron: %d personas", i + 1, j + 1, oficinas[i][j]));
    }
}
