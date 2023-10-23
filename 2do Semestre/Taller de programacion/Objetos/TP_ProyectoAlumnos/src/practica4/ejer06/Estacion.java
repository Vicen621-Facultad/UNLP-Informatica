package practica4.ejer06;

public class Estacion {
    private String nombre;
    private final double latitud, longitud;
    private final double[][] registroTemp;
    private int anios, inicio;
    
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

    public double getLongitud() {
        return longitud;
    }

	public int getAnios() {
		return anios;
	}

	public void setAnios(int anios) {
		this.anios = anios;
	}

	public int getInicio() {
		return inicio;
	}

	public void setInicio(int inicio) {
		this.inicio = inicio;
	}
	
    public void setTemperatura(double temp, int mes, int anio) {
        registroTemp[mes - 1][anio - inicio] = temp;
    }
    
    public double getTemperatura(int mes, int anio) {
        return registroTemp[mes - 1][anio - inicio];
    }
    
    public String getFechaMayorTemperatura() {
        double max = -1;
		String maxString = null;
		
		for (int i = 0; i < anios; i++)
			for (int j = 0; j < 12; j++) {
				double temp = this.registroTemp[j][i];
				if (temp > max) {
					max = temp;
					maxString = (j + 1) + "/" + (i + getInicio());
				}
			}
        
        return maxString;
    }
	
	@Override
	public String toString() {
		return getNombre() + "(" + getLatitud() + " S - " + getLongitud() + " O)";
	}
}
