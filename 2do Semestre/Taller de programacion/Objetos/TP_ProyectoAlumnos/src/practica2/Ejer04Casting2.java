package practica2;

import PaqueteLectura.Lector;


/**
 * @author vicen
 */
public class Ejer04Casting2 {
    
    public static void main(String[] args) {
        int DIAS = 5, TURNOS = 8, totalTurnos = 0;
        // Inicializo en 0
        int[] dimsL = new int[DIAS];
        Persona[][] casting = new Persona[DIAS][TURNOS];
        
        Persona per = Persona.leerPersona();
        System.out.print("Ingrese el dia a presentarse: ");
        int dia = Lector.leerInt() - 1;
        
        while (totalTurnos < 40 && !per.getNombre().equals("ZZZ")) {
            if (dimsL[dia] >= 8) 
                System.out.println("No hay mas turnos para el dia: " + dia + 1);
            else {
                casting[dia][dimsL[dia]] = per;
                dimsL[dia]++;
            }
            
            per = Persona.leerPersona();
            System.out.print("Ingrese el dia a presentarse: ");
            dia = Lector.leerInt() - 1;
        }
       
        for (int i = 0; i < DIAS; i++) {
            System.out.println("Cantidad de inscriptos para el dia " + (i + 1) + ": " + dimsL[i]);
            for (int j = 0; j < dimsL[i]; j++) {
                System.out.println("Persona a entrevistar el dia: " + (i + 1) + " turno: " + (j + 1) + ": " + casting[i][j].getNombre());               
            }
        }
    }
}
