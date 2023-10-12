package estacionamiento;

public class Estacionamiento {
	private String nombre, direccion, apertura, cierre;
	private int pisos, plazas;
	private Auto[][] autos;
	
	public Estacionamiento(String nombre, String direccion) {
		this(nombre, direccion, "8:00", "21:00", 5, 10);
	}

	public Estacionamiento(String nombre, String direccion, String apertura, String cierre, int pisos, int plazas) {
		this.nombre = nombre;
		this.direccion = direccion;
		this.apertura = apertura;
		this.cierre = cierre;
		this.pisos = pisos;
		this.plazas = plazas;
		
		// Inicializo todos las posiciones en null
		this.autos = new Auto[pisos][plazas];
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDireccion() {
		return direccion;
	}

	public String getApertura() {
		return apertura;
	}

	public void setApertura(String apertura) {
		this.apertura = apertura;
	}

	public String getCierre() {
		return cierre;
	}

	public void setCierre(String cierre) {
		this.cierre = cierre;
	}

	public int getPisos() {
		return pisos;
	}

	public int getPlazas() {
		return plazas;
	}
	
	public void setAuto(Auto auto, int piso, int plaza) {
		this.autos[piso - 1][plaza - 1] = auto;
	}
	
	public String getPosicion(String patente) {
		int piso = 0, plaza = 0;
		boolean encontre = false;
		
		while (piso < getPisos() && !encontre) {
			while (piso < getPisos() && plaza < getPlazas() && !encontre) {
				if (autos[piso][plaza].getPatente().equals(patente))
					encontre = true;
				else
					plaza++;
			}
			
			if (!encontre) {
				piso++;
				plaza = 0;
			}
		}
		
		if (piso < getPisos())
			return "Piso: " + (piso + 1) + " Plaza: " + (plaza + 1);
		else
			return "Auto Inexistente";
	}
	
	/**
	 * Devuelve si la posicion esta o no ocupada
	 * @param piso El piso a buscar
	 * @param plaza La plaza a buscar
	 * @return Devuelve True si la posisicion esta ocupada, False de otra manera
	 */
	private boolean isOcupada(int piso, int plaza) {
		return autos[piso][plaza] != null;
	}
	
	public int getAutosPlaza(int plaza) {
		int ret = 0;
		
		for (int i = 0; i < getPisos(); i++) {
			if (isOcupada(i, plaza - 1))
				ret++;
		}
		
		return ret;
	}
	
	@Override
	public String toString() {
		String aux = "";
		
		for (int i = 0; i < getPisos(); i++)
			for (int j = 0; j < getPlazas(); j++) {
				aux += "Piso " + (i + 1) + " Plaza " + (j + 1) + ": ";
				
				if (isOcupada(i, j))
					aux += autos[i][j].toString();
				else
					aux += "Libre";
				
				aux += " ";
			}
		
		return aux;
	}
}
