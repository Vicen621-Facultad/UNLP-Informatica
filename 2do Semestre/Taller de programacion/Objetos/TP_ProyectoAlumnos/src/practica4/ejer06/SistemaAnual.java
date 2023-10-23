package practica4.ejer06;

public class SistemaAnual extends Sistema {

	public SistemaAnual(Estacion estacion) {
		super(estacion);
	}

	@Override
	public double calcularPromedio(int anio) {
		double avg = 0;
		for (int i = 0; i < 12; i++)
			avg += getEstacion().getTemperatura(i + 1, anio);
		
		return avg / 12;
	}
	
	@Override
	public String toString() {
		String aux = super.toString();
		
		for (int i = 0; i < getEstacion().getAnios(); i++)
			aux += "    - " + (getEstacion().getInicio() + i) + ": " + calcularPromedio(getEstacion().getInicio() + i) + " ºC;\n";
		
		return aux;
	}
}
