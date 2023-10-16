package coros.personas;

public class Director extends Persona {
    private int antiguedad;

    public Director(String nombre, int DNI, int edad, int antiguedad) {
        super(nombre, DNI, edad);
        this.antiguedad = antiguedad;
    }
    
    public int getAntiguedad() {
        return this.antiguedad;
    }
    
    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
}