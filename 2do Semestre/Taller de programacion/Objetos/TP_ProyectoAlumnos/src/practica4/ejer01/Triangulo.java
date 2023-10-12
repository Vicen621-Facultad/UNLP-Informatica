package practica4.ejer01;

/**
 * @author vicen
 */
public class Triangulo extends Figura{
    private double lado1, lado2, lado3;

    public Triangulo(double lado1, double lado2, double lado3, String relleno, String linea) {
        super(relleno, linea);
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
    }

    public double getLado1() {
        return lado1;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }
    
    @Override
    public double calcularPerimetro() {
        return lado1 + lado2 + lado3;
    }
    
    @Override
    public double calcularArea() {
        double s = this.calcularPerimetro() / 2;
        return Math.sqrt(s * (s - lado1) * (s - lado2) * (s - lado3));
    }
    
    @Override
    public String toString() {
        String aux = super.toString();
        aux += " Lado1: " + getLado1();
        aux += " Lado2: " + getLado2();
        aux += " Lado3: " + getLado3();
        
        return aux;
    }
}
