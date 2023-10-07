package practica3.ejer03;

import practica3.Libro;

/**
 * @author alumnos
 */
public class Estante {
    private int dimL = 0;
    private int dimF;
    private Libro[] libros;
    
    public Estante(int dimF) {
        this.dimF = dimF;
        libros = new Libro[dimF];
    }
    
    public int getCantLibros() {
        return this.dimL;
    }
    
    public boolean isLleno() {
        return dimL == dimF;
    }
    
    public void agregarAlEstante(Libro libro) {
        if (!isLleno()) 
            libros[dimL++] = libro; 
    }
    
    /**
     * Recibe un titulo y lo busca en el vector
     * @param titulo Titulo a buscar
     * @return El libro si se encuentra, null en otro caso
     */
    public Libro buscarLibro(String titulo) {
        int i = 0;
        
        while (i < dimL && !libros[i].getTitulo().equals(titulo))
            i++;
        
        if (i < dimL)
            return libros[i];
        else
            return null;
    }
}
