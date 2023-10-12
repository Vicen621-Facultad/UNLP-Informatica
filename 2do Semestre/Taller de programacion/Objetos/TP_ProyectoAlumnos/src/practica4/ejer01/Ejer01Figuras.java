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
public class Ejer01Figuras {

    public static void main(String[] args) {
        Figura circulo = new Circulo(5, "azul", "rojo");
        Figura triangulo = new Triangulo(3, 3, 5, "verde", "naranja");
        
        System.out.println("Circulo: " + circulo.toString());
        System.out.println("Triangulo: " + triangulo.toString());
        
        circulo.despintar();
        triangulo.despintar();
        
        System.out.println("Circulo despintado: " + circulo.toString());
        System.out.println("Triangulo despintado: " + triangulo.toString());
    }
    
}
