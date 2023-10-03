package practica2;
import PaqueteLectura.GeneradorAleatorio;

/**
 * @author vicen
 */
public class Ejer02 {
    
    public static void main(String[] args) {
        int DF = 15;
        int dimL = 0;
        Persona[] personas = new Persona[DF];
        
        GeneradorAleatorio.iniciar();
        
        Persona per = new Persona(
                GeneradorAleatorio.generarString(4),
                GeneradorAleatorio.generarInt(10000),
                GeneradorAleatorio.generarInt(100)
        );
        
        while (per.getEdad() != 0 && dimL < DF) {
            personas[dimL] = per;
            dimL++;
            per = new Persona(
                GeneradorAleatorio.generarString(4),
                GeneradorAleatorio.generarInt(10000),
                GeneradorAleatorio.generarInt(100)
            );
        }
        
        int menos65 = 0;
        Persona menorDNI = new Persona(null, 10000, 0);
        
        for (int i = 0; i < dimL; i++) {
            if (personas[i].getEdad() < 65)
                menos65++;
            
            if (personas[i].getDNI() < menorDNI.getDNI())
                menorDNI = personas[i];
        }
        
        System.out.println("Cantidad de personas de menos de 65 años: " + menos65);
        System.out.println(menorDNI.toString());
    }
}
