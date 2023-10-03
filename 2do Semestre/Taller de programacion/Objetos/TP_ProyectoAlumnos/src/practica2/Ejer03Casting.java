package practica2;

import PaqueteLectura.GeneradorAleatorio;


/**
 * @author vicen
 */
public class Ejer03Casting {
    
    public static void main(String[] args) {
        int DIAS = 5, TURNOS = 8;
        int dimDias = 0, dimTurnos = 0;
        Persona[][] casting = new Persona[DIAS][TURNOS];
        
        Persona per = Persona.leerPersona();
        
        while (dimDias < 5 && !per.getNombre().equals("ZZZ")) {
            dimTurnos = 0;
            while (dimDias < 5 && dimTurnos < 8 && !per.getNombre().equals("ZZZ")) {
                casting[dimDias][dimTurnos] = per;
                per = Persona.leerPersona();
                dimTurnos++;
            }
            dimDias++;
        }
        
        for (int i = 0; i < dimDias; i++) {
            for (int j = 0; j < dimTurnos; j++) {
                System.out.println("Persona a entrevistar el dia: " + (i + 1) + " turno: " + (j + 1) + ": " + casting[i][j].getNombre());
            }
        }
    }
}
