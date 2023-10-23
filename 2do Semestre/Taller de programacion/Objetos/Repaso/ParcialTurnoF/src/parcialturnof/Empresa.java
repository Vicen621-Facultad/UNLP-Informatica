package parcialturnof;

import parcialturnof.personas.Director;
import parcialturnof.personas.Encargado;

/**
 * @author vicen
 */
public class Empresa {
    private String nombre, direccion;
    private Director director;
    private Encargado[] sucursales;
    private int dimF;

    public Empresa(String nombre, String direccion, Director director, int sucursales) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.director = director;
        this.dimF = sucursales;
        
        // Java inicializa todo el vector en null
        this.sucursales = new Encargado[this.dimF];
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Director getDirector() {
        return director;
    }

    public void setDirector(Director director) {
        this.director = director;
    }
    
    public Encargado[] getSucursales() {
        return this.sucursales;
    }
    
    public int getDimF() {
        return this.dimF;
    }
    
    public void addEncargado(Encargado encargado, int sucursal) {
        this.sucursales[sucursal - 1] = encargado;
    }
    
    @Override
    public String toString() {
        String aux = "- Nombre: " + this.getNombre() +
                "\n- Direccion: " + this.getDireccion() + 
                "\n- Director: " + this.getDirector().toString() + 
                "\n- Encargados:\n";
        
        for (int i = 0; i < this.getDimF(); i++) {
            aux += (i + 1) + ": ";
            
            if (getSucursales()[i] == null)
                aux += "Sin encargado";
            else
                aux += getSucursales()[i].toString();
            
            aux += "\n";
        }
        
        return aux;
    }
}
