package practica1;

import PaqueteLectura.GeneradorAleatorio;

public class Ej01Tabla {

    /**
     * Carga un vector que representa la tabla del 2
     */
    public static void main(String[] args) {
        int DF = 11;
        int[] tabla = new int[DF]; // indices de 0 a 10
        
        for (int i = 0; i < DF; i++) 
            tabla[i] = 2 * i;
        
        GeneradorAleatorio.iniciar();
        int random = GeneradorAleatorio.generarInt(DF + 1);
        while (random != 11) {
            System.out.println("Doble de: " + random + ": " + tabla[random]);
            random = GeneradorAleatorio.generarInt(DF + 1);
        }
    }
    
}
