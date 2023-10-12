package practica4.ejer06;

import PaqueteLectura.GeneradorAleatorio;

public class Ejer06Estaciones {

	public static void main(String[] args) {
		Estacion laPlata = new Estacion("La Plata", -34.921, 57.995, 3, 2021);
		Sistema sistAnual = new SistemaAnual(laPlata);
		
		for (int i = 0; i < laPlata.getAnios(); i++)
			for (int j = 0; j < 12; j++) {
				laPlata.setTemperatura(GeneradorAleatorio.generarDouble(20) + 10, j + 1, laPlata.getInicio() + i);
			}
		
		System.out.println("La mayor temperatura en La Plata fue el mes y año: " + laPlata.getFechaMayorTemperatura());
		System.out.println(sistAnual.toString());
		
		// ----------------------
		
		Estacion marDelPlata = new Estacion("Mar del Plata", -38.002, -57556, 4, 2020);
		Sistema sistMensual = new SistemaMensual(marDelPlata);
		
		for (int i = 0; i < marDelPlata.getAnios(); i++)
			for (int j = 0; j < 12; j++) {
				marDelPlata.setTemperatura(GeneradorAleatorio.generarDouble(20) + 10, j + 1, marDelPlata.getInicio() + i);
			}
		
		System.out.println("La mayor temperatura en Mar Del Plata fue el mes y año: " + marDelPlata.getFechaMayorTemperatura());
		System.out.println(sistMensual.toString());
	}
	
}
