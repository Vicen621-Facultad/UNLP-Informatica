package practica4.ejer02;

public class Entrenador extends Empleado {
    private int campeonatos;

    public Entrenador(int campeonatos, String nombre, double sueldo, int antiguedad) {
        super(nombre, sueldo, antiguedad);
        this.campeonatos = campeonatos;
    }

    public int getCampeonatos() {
        return campeonatos;
    }

    public void setCampeonatos(int campeonatos) {
        this.campeonatos = campeonatos;
    }

    @Override
    public double calcularSueldoACobrar() {
        double aux = super.calcularSueldoACobrar();
        
        if (getCampeonatos() >= 1 && getCampeonatos() <= 4)
            aux += 5000; // Entre 1 y 4
        else if (getCampeonatos() >= 5 && getCampeonatos() <= 10)
            aux += 30000; // Entre 5 y 10
        else if (getCampeonatos() > 10)
            aux += 50000; // Mas que 10
        
        return aux;
    }
    
    @Override
    public double calcularEfectividad() {
        return getCampeonatos() / getAntiguedad();
    }
}
