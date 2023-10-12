package practica4.ejer06;

//TODO: Hacer 2 subclases de este sistema, uno para el mensual y otro para el anual
public abstract class Sistema {
    private Estacion estacion;

    public Sistema(Estacion estacion) {
        this.estacion = estacion;
    }

    public Estacion getEstacion() {
        return estacion;
    }

    public void setEstacion(Estacion estacion) {
        this.estacion = estacion;
    }
    
    //TODO: Ver si este metodo necesita tener codigo adentro
    public abstract double calcularPromedio();
}
