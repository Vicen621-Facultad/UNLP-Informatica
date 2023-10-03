package practica2;


/**
 * @author vicen
 */
public class Ejer05Partidos {
    
    public static void main(String[] args) {
        int DF = 20, dimL = 0;
        Partido[] partidos = new Partido[DF];
        
        Partido part = Partido.leerPartido();
        
        while (dimL <= DF && !part.getVisitante().equals("ZZZ")) {
            partidos[dimL] = part;
            dimL++;
            part = Partido.leerPartido();
        }
        
        int river = 0;
        int golesBoca = 0;
        
        for (int i = 0; i < dimL; i++) {
            Partido p = partidos[i];
            if (p.getGanador().toLowerCase().equals("river"))
                river++;
            
            if (p.getLocal().toLowerCase().equals("boca"))
                golesBoca += p.getGolesLocal();
            
            System.out.println(p.toString());
        }
        
        System.out.println("Cantidad de partidos ganados de river: " + river);
        System.out.println("Cantidad de goles de boca de local: " + golesBoca);
    }
    
}
