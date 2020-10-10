package aerolinea.controlador.objetos;

public class Busqueda_Vuelo {

	private String tipoViaje;
	
	private String ciudadOrigen;
	
	private String ciudadDestino;
	
	private String fechaIda;
	
	private String fechaRegreso;
	
	
	

	public Busqueda_Vuelo(String tipoViaje, String ciudadOrigen, String ciudadDestino, String fechaIda,
			String fechaVuelta) {
	
		this.tipoViaje = tipoViaje;
		this.ciudadOrigen = ciudadOrigen;
		this.ciudadDestino = ciudadDestino;
		this.fechaIda = fechaIda;
		this.fechaRegreso = fechaVuelta;
	}

	public String getTipoViaje() {
		return tipoViaje;
	}

	public void setTipoViaje(String tipoViaje) {
		this.tipoViaje = tipoViaje;
	}

	public String getCiudadOrigen() {
		return ciudadOrigen;
	}

	public void setCiudadOrigen(String ciudadOrigen) {
		this.ciudadOrigen = ciudadOrigen;
	}

	public String getCiudadDestino() {
		return ciudadDestino;
	}

	public void setCiudadDestino(String ciudadDestino) {
		this.ciudadDestino = ciudadDestino;
	}

	public String getFechaIda() {
		return fechaIda;
	}

	public void setFechaIda(String fechaIda) {
		this.fechaIda = fechaIda;
	}

	public String getFechaRegreso() {
		return fechaRegreso;
	}

	public void setFechaRegreso(String fechaRegreso) {
		this.fechaRegreso = fechaRegreso;
	}
	
	
}
