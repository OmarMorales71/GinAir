package aerolinea.controlador.objetos;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="aeropuerto")
public class Aeropuerto {
	
	@Id
	@Column(name = "id_aeropuerto")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id_aeropuerto;
	
	@Column(name = "nombre_aeropuerto")
	private String nombre_aeropuerto;
	

	@Column(name = "siglas_aeropuerto")
	private String siglas_aeropuerto;
	

	@Column(name = "ciudad")
	private String ciudad;
	

	@Column(name = "pais")
	private String pais;
	
	@OneToMany(mappedBy="aeropuerto_origen", cascade= CascadeType.ALL)
	private List<Vuelo> salidas = new ArrayList<Vuelo>();
	
	@OneToMany(mappedBy="aeropuerto_destino", cascade= CascadeType.ALL)
	private List<Vuelo> llegadas = new ArrayList<Vuelo>();


	public int getId_aeropuerto() {
		return id_aeropuerto;
	}


	public void setId_aeropuerto(int id_aeropuerto) {
		this.id_aeropuerto = id_aeropuerto;
	}


	public String getNombre_aeropuerto() {
		return nombre_aeropuerto;
	}


	public void setNombre_aeropuerto(String nombre_aeropuerto) {
		this.nombre_aeropuerto = nombre_aeropuerto;
	}


	public String getSiglas_aeropuerto() {
		return siglas_aeropuerto;
	}


	public void setSiglas_aeropuerto(String siglas_aeropuerto) {
		this.siglas_aeropuerto = siglas_aeropuerto;
	}


	public String getCiudad() {
		return ciudad;
	}


	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}


	public String getPais() {
		return pais;
	}


	public void setPais(String pais) {
		this.pais = pais;
	}
	
	
}
