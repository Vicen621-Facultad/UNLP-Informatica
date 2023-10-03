package practica1;

import PaqueteLectura.Lector;

public class Ej05Clientes {

    public static void main(String[] args) {
        int PERSONAS = 5, CATEGORIAS = 4;
        int[][] puntajes = new int[PERSONAS][CATEGORIAS];
        
        for (int i = 0; i < PERSONAS; i++) {
            System.out.println("Cliente numero: " + (i + 1));
            System.out.print("Ingrese Atencion Al Cliente: ");
            puntajes[i][0] = Lector.leerInt();
            System.out.print("Ingrese Calidad de la comida: ");
            puntajes[i][1] = Lector.leerInt();
            System.out.print("Ingrese Precio: ");
            puntajes[i][2] = Lector.leerInt();
            System.out.print("Ingrese Ambiente: ");
            puntajes[i][3] = Lector.leerInt();
        }
        
        double[] promedios = new double[CATEGORIAS];
        
        for (int i = 0; i < CATEGORIAS; i++) {
            for (int j = 0; j < PERSONAS; j++)
                promedios[i] = puntajes[i][j];
            promedios[i] /= PERSONAS;
            System.out.println("Promedio de categoria" + i + ": " + promedios[i]);
        }   
    }
    
}
