package practica1;

import PaqueteLectura.Lector;

public class Ej02Jugadores {

  
    public static void main(String[] args) {
        int DF = 15;
        double[] alturas = new double[DF];
        
        double total = 0;
        
        for (int i = 0; i < DF; i++) {
            System.out.print("Ingrese altura: ");
            alturas[i] = Lector.leerDouble();
            total += alturas[i]; // total = total + alturas[i]            
        }
        
        double promedio = total / DF;
        System.out.println("La altura promedio es: " + promedio);
        int cant = 0;
        
        for (int i = 0; i < DF; i++)
            if (alturas[i] > promedio)
                cant++;
       
        System.out.println("La cantidad de alturas mayores al promedio son: " + cant);
    }
    
}
