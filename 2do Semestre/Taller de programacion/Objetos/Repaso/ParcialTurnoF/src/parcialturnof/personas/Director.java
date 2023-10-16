package parcialturnof.personas;

/**
 * @author vicen
 */
public class Director extends Empleado {
    private double viaticos;
    
    public Director(String nombre, int DNI, int ingreso, double sueldo, double viaticos) {
        super(nombre, DNI, ingreso, sueldo);
        this.viaticos = viaticos;
    }

    public double getViaticos() {
        return viaticos;
    }

    public void setViaticos(double viaticos) {
        this.viaticos = viaticos;
    }

    @Override
    public double getSueldoACobrar() {
        return super.getSueldoACobrar() + getViaticos();
    }
}
