package practica3.ejer05;

public class Circulo {
    double radius;
    String fillColor, lineColor;
    
    public Circulo(double radius, String fillColor, String lineColor) {
        this.radius = radius;
        this.fillColor = fillColor;
        this.lineColor = lineColor;
    }

    public double getRadius() {
        return radius;
    }

    public void setRadius(double radius) {
        this.radius = radius;
    }

    public String getFillColor() {
        return fillColor;
    }

    public void setFillColor(String fillColor) {
        this.fillColor = fillColor;
    }

    public String getLineColor() {
        return lineColor;
    }

    public void setLineColor(String lineColor) {
        this.lineColor = lineColor;
    }
    
    public double calcularPerimetro() {
        return 2 * Math.PI * radius;
    }
    
    public double calcularArea() {
        return Math.PI * Math.pow(radius, 2);
    }
}