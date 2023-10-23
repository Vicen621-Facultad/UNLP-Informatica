package parcialturnof.personas;

/**
 * @author vicen
 */
public class Encargado extends Empleado {
    private int empleados;
    
    public Encargado(String nombre, int DNI, int ingreso, double sueldo, int empleados) {
        super(nombre, DNI, ingreso, sueldo);
        this.empleados = empleados;
    }

    public int getEmpleados() {
        return empleados;
    }

    public void setEmpleados(int empleados) {
        this.empleados = empleados;
    }
    
    @Override
    public double getSueldoACobrar() {
        return super.getSueldoACobrar() + getEmpleados() * 1000;
    }

}
