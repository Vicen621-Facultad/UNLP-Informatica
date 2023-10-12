package practica4.ejer06;

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
    
    public abstract double calcularPromedio(int pos);
	
	@Override
	public String toString() {
		return getEstacion().toString() + ":\n";
	}
}
