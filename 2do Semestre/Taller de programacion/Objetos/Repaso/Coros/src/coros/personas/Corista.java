package coros.personas;

public class Corista extends Persona {
    private int tono;
    
    public Corista(String nombre, int DNI, int edad, int tono) {
        super(nombre, DNI, edad);
        this.tono = tono;
    }
    
    public int getTono() {
        return this.tono;
    }
    
    public void setTono(int tono) {
        this.tono = tono;
    }
}