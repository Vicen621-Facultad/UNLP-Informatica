package practica4.ejer02;

public class Jugador extends Empleado {
    private int partidos, goles;

    public Jugador(int partidos, int goles, String nombre, double sueldo, int antiguedad) {
        super(nombre, sueldo, antiguedad);
        this.partidos = partidos;
        this.goles = goles;
    }

    public int getPartidos() {
        return partidos;
    }

    public void setPartidos(int partidos) {
        this.partidos = partidos;
    }

    public int getGoles() {
        return goles;
    }

    public void setGoles(int goles) {
        this.goles = goles;
    }

    @Override
    public double calcularSueldoACobrar() {
        double aux = super.calcularSueldoACobrar();
        
        if (this.calcularEfectividad() > 0.5)
            aux += this.getSueldo();
        
        return aux;
    }

    @Override
    public double calcularEfectividad() {
        return getGoles() / getPartidos();
    }
}
