/*
Demo que crea objetos Libro invocando a los constructores definidos. 
 */
package practica3;

/**
 *
 * @author vsanz
 */
public class Demo01ConstructoresLibro {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Autor autor1 = new Autor("Herbert Schildt", "si", "tambien");

        Libro libro1 = new Libro("Java: A Beginner's Guide", "Mcgraw-Hill", 2014, autor1, "978-0071809252", 21.72);

        Autor autor2 = new Autor("John Horton", "no", "tampoco");
        Libro libro2 = new Libro("Learning Java by Building Android Games",
                "CreateSpace Independent Publishing", autor2, "978-1512108347");
        
        System.out.println(libro1.toString());
        System.out.println(libro2.toString());
        System.out.println("Autor de libro 1: " + libro1.getPrimerAutor().toString());
        System.out.println("Precio del libro2: " + libro2.getPrecio());
        System.out.println("Año edición del libro2: " + libro2.getAñoEdicion());
        Libro libro3 = new Libro();
    }

}
