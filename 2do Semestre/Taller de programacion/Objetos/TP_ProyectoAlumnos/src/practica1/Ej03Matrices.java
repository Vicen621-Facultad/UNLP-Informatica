package practica1;

import PaqueteLectura.*;

public class Ej03Matrices {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int DF = 5;
	int[][] matriz = new int[DF][DF];
        
        for (int i = 0; i < DF; i++)
            for (int j = 0; j < DF; j++)
                matriz[i][j] = GeneradorAleatorio.generarInt(31);
        
        for (int i = 0; i < DF; i++)
            for (int j = 0; j < DF; j++)
                System.out.println(String.format("Posicion (%d, %d): %d", i, j, matriz[i][j]));
        
        int fila1 = 0;
        
        for (int i = 0; i < DF; i++)
            fila1 += matriz[1][i];
        
        System.out.println("Suma de la fila 1: " + fila1);
        
        // Inicializo vector en 0
        int[] vector = new int[DF];
        for (int i = 0; i < DF; i++)
            for (int j = 0; j < DF; j++)
                vector[i] += matriz[j][i];
        
        for (int i = 0; i < DF; i++)
            System.out.println("Suma de la columna " + i + ": " + vector[i]);
        
        System.out.print("Ingresar entero a buscar: ");
        int leido = Lector.leerInt();
        
        boolean encontrado = false;
        int i = 0, j = 0;
        while (!encontrado && i < 5) {
            while (!encontrado && j < 5) {
                if (matriz[i][j] == leido)
                    encontrado = true;
                else
                    j++;
            }
            if (!encontrado) {
                i++;
                j = 0;
            }
        }
        
        if (encontrado)
            System.out.println(String.format("El valor existe en la posicion: (%d; %d)", i, j));
        else
            System.out.println("El valor no existe");
    }
}
