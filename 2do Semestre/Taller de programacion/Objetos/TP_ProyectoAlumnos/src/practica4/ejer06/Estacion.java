package practica4.ejer06;

public class Estacion {
    private String nombre;
    private double latitud, longitud;
    private double[][] registroTemp;
    int anios, inicio;
    
    public Estacion(String nombre, double latitud, double longitud, int anios, int inicio) {
        this.nombre = nombre;
        this.latitud = latitud;
        this.longitud = longitud;
        this.anios = anios;
        this.inicio = inicio;
        this.registroTemp = new double[12][anios];
        
        for (int i = 0; i < anios; i++)
            for (int j = 0; j < 12; j++)
                this.registroTemp[j][i] = 99999;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getLatitud() {
        return latitud;
    }

    public void setLatitud(double latitud) {
        this.latitud = latitud;
    }

    public double getLongitud() {
        return longitud;
    }

    public void setLongitud(double longitud) {
        this.longitud = longitud;
    }
    
    public void setTemperatura(double temp, int mes, int anio) {
        registroTemp[mes - 1][anio - inicio] = temp;
    }
    
    public double getTemperatura(int mes, int anio) {
        return registroTemp[mes - 1][anio - inicio];
    }
    
    public String getFechaMayorTemperatura() {
        int mes = 0;
        int anio = 0;
        int max = -1;
        
        return "";
    }

}
