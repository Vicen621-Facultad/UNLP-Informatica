/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica4.ejer01;

/**
 *
 * @author alumnos
 */
public class Circulo extends Figura {
    private double radio;

    public Circulo(double radio, String relleno, String linea) {
        super(relleno, linea);
        this.radio = radio;
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    @Override
    public double calcularArea() {
        return 2 * Math.PI * getRadio();
    }

    @Override
    public double calcularPerimetro() {
        return Math.PI * getRadio() * getRadio();
    }
    
    @Override
    public String toString() {
        return super.toString() + " Radio: " + getRadio();
    }
}
