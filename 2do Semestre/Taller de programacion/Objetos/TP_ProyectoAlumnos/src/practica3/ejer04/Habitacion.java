package practica3.ejer04;

import PaqueteLectura.GeneradorAleatorio;

public class Habitacion {
	private int numero;
	private double costo;
    private Persona persona;
    
    public Habitacion(int numero) {
        this.costo = GeneradorAleatorio.generarDouble(6000) + 2000; // Numero aleatorio entre 2000 y 8000
        this.persona = null;
		this.numero = numero;
    }
    
	/**
	 * Devulve true si la habitacion esta ocupada, sino devuelve false
	 * @return True si la habitacion esta ocupada, False de otra manera
	 */
    public boolean isOcupada() {
        return persona != null;
    }
	
    public double getCosto() {
        return costo;
    }
    
    public void setCosto(double costo) {
        this.costo = costo;
    }

    public Persona getPersona() {
        return persona;
    }

    public void setPersona(Persona persona) {
        this.persona = persona;
    }
	
	public int getNumero() {
		return numero;
	}
	
	public void setNumero(int numero) {
		this.numero = numero;
	}
	
	@Override
	public String toString() {
		String ret = String.format(
				"{Habitacion %d: %.2f, %s",
				getNumero(),
				getCosto(), 
                isOcupada() ? "Ocupada" : "Libre"
		);
		
		if (isOcupada())
			ret += ", " + getPersona().toString();
            
        ret += "}";
		
		return ret;
	}
}
