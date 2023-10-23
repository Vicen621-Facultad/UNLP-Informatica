package practica4.ejer06;

public class SistemaMensual extends Sistema {
	String [] meses = {"Enero","Febrero","Marzo"};
	
	public SistemaMensual(Estacion estacion) {
		super(estacion);
		
	}

	@Override
	public double calcularPromedio(int mes) {
		double avg = 0;
		for (int i = 0; i < getEstacion().getAnios(); i++)
			avg += getEstacion().getTemperatura(mes, getEstacion().getInicio() + i);
		
		return avg / getEstacion().getAnios();
	}
	
	@Override
	public String toString() {
		String aux = super.toString();
		
		aux += "    - Enero: " + calcularPromedio(1) + " ºC;\n";
		aux += "    - Febrero: " + calcularPromedio(2) + " ºC;\n";
		aux += "    - Marzo: " + calcularPromedio(3) + " ºC;\n";
		aux += "    - Abril: " + calcularPromedio(4) + " ºC;\n";
		aux += "    - Mayo: " + calcularPromedio(5) + " ºC;\n";
		aux += "    - Junio: " + calcularPromedio(6) + " ºC;\n";
		aux += "    - Julio: " + calcularPromedio(7) + " ºC;\n";
		aux += "    - Agosto: " + calcularPromedio(8) + " ºC;\n";
		aux += "    - Septiembre: " + calcularPromedio(9) + " ºC;\n";
		aux += "    - Octubre: " + calcularPromedio(10) + " ºC;\n";
		aux += "    - Noviembre: " + calcularPromedio(11) + " ºC;\n";
		aux += "    - Diciembre: " + calcularPromedio(12) + " ºC;";
		
		return aux;
	}
}
