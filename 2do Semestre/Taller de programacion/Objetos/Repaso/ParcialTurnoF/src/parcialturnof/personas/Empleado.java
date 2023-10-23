package parcialturnof.personas;

/**
 * @author vicen
 */
public abstract class Empleado {
    private String nombre;
    private int DNI, ingreso;
    private double sueldo;

    public Empleado(String nombre, int DNI, int ingreso, double sueldo) {
        this.nombre = nombre;
        this.DNI = DNI;
        this.ingreso = ingreso;
        this.sueldo = sueldo;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public String getNombre() {
        return nombre;
    }

    public int getDNI() {
        return DNI;
    }

    public int getIngreso() {
        return ingreso;
    }
    
    public double getSueldoACobrar() {
        double aux = this.getSueldo();
        
        if (2023 - getIngreso() > 20)
            aux *= 1.1;
        
        return aux;
    }
    
    @Override
    public String toString() {
        return "Nombre: " + this.getNombre() + 
                ", DNI: " + this.getDNI() + 
                ", Sueldo a cobrar: " + this.getSueldoACobrar();
    }
}
