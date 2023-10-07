package practica3.ejer01;

import PaqueteLectura.Lector;

/**
 * @author vicen
 */
public class Ejer01Triangulo {

    public static void main(String[] args) {
        System.out.print("Ingrese el lado 1: ");
        double lado1 = Lector.leerDouble();
        System.out.print("Ingrese el lado 2: ");
        double lado2 = Lector.leerDouble();
        System.out.print("Ingrese el lado 3: ");
        double lado3 = Lector.leerDouble();
        
        System.out.print("Ingrese color de relleno: ");
        String relleno = Lector.leerString();
        System.out.print("Ingrese color de linea: ");
        String linea = Lector.leerString();
        
        Triangulo triangulo = new Triangulo(lado1, lado2, lado3, relleno, linea);
        System.out.println("Perimetro del triangulo: " + triangulo.calcularPerimetro());
        System.out.println("Area del triangulo: " + triangulo.calcularArea());
    }
}
