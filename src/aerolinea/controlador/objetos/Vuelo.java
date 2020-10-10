package aerolinea.controlador.objetos;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="vuelo")
public class Vuelo {

	@Id
	@Column(name = "id_vuelo")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id_vuelo;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="id_aeropuerto_origen")
	private Aeropuerto aeropuerto_origen;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="id_aeropuerto_destino")
	private Aeropuerto aeropuerto_destino;
	

	@Column(name="fecha_despegue")
	private Timestamp fecha_despegue;
	

	@Column(name="fecha_aterrizaje")
	private Timestamp fecha_aterrizaje;
	

	@Column(name="precio_euros")
	private float precio_euros;
	

	@Column(name="capacidad")
	private int capacidad;

	@OneToMany(mappedBy="vuelo", cascade= CascadeType.ALL)
	private List<Reservacion> reservas = new ArrayList<Reservacion>();
	
	

	public int getId_vuelo() {
		return id_vuelo;
	}


	public void setId_vuelo(int id_vuelo) {
		this.id_vuelo = id_vuelo;
	}


	public Aeropuerto getAeropuerto_origen() {
		return aeropuerto_origen;
	}


	public void setAeropuerto_origen(Aeropuerto aeropuerto_origen) {
		this.aeropuerto_origen = aeropuerto_origen;
	}


	public Aeropuerto getAeropuerto_destino() {
		return aeropuerto_destino;
	}


	public void setAeropuerto_destino(Aeropuerto aeropuerto_destino) {
		this.aeropuerto_destino = aeropuerto_destino;
	}


	public Timestamp getFecha_despegue() {
		return fecha_despegue;
	}


	public void setFecha_despegue(Timestamp fecha_despegue) {
		this.fecha_despegue = fecha_despegue;
	}


	public Timestamp getFecha_aterrizaje() {
		return fecha_aterrizaje;
	}


	public void setFecha_aterrizaje(Timestamp fecha_aterrizaje) {
		this.fecha_aterrizaje = fecha_aterrizaje;
	}


	public float getPrecio_euros() {
		return precio_euros;
	}


	public void setPrecio_euros(float precio_euros) {
		this.precio_euros = precio_euros;
	}


	public int getCapacidad() {
		return capacidad;
	}


	public void setCapacidad(int capacidad) {
		this.capacidad = capacidad;
	}
	
	
	
	
}
