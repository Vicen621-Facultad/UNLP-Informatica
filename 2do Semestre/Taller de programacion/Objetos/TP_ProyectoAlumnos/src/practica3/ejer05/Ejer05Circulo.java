package practica3.ejer05;

import PaqueteLectura.Lector;

/**
 * @author vicen
 */
public class Ejer05Circulo {

    public static void main(String[] args) {
        System.out.print("Ingrese el radio del circulo: ");
        double radius = Lector.leerDouble();
        System.out.print("Ingrese el color de releno: ");
        String fillColor = Lector.leerString();
        System.out.print("Ingrese el color de la linea: ");
        String lineColor = Lector.leerString();
        Circulo circulo = new Circulo(radius, fillColor, lineColor);
        
        System.out.println("Perimetro del circulo: " + circulo.calcularPerimetro());
        System.out.println("Area del circulo: " + circulo.calcularArea());
    }
    
}
