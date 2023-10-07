package practica3.ejer03;

import practica3.Autor;
import practica3.Libro;

/**
 *
 * @author alumnos
 */
public class Ejer03Estantes {

    public static void main(String[] args) {
        Estante estante = new Estante(20);
        
        estante.agregarAlEstante(new Libro("a", "b", new Autor("a", "b", "c"), "c"));
        estante.agregarAlEstante(new Libro("k", "b¿n", new Autor("a¿k", "j", "g"), "f"));
        estante.agregarAlEstante(new Libro("v", "m", new Autor("a¿l", "a", "h"), "d"));
        // estante.agregarAlEstante(new Libro("Mujercitas", "editorial", new Autor("Louisa May Alcott", "si", "Pensilvania"), "10-10"));
        
        Libro mujercitas = estante.buscarLibro("Mujercitas");
        if (mujercitas != null)
            System.out.println("Autor de mujercitas: " + mujercitas.getPrimerAutor().toString());
        else
            System.out.println("Mujercitas no está en este estante");
    }
    
}
