package aerolinea.controlador.objetos;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="reservacion")
public class Reservacion {

	@Id
	@Column(name = "id_reservacion")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id_reservacion;
	
	@Column(name="codigo_reservacion")
	private String codigo_reservacion;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="id_cliente")
	private Cliente cliente;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="id_vuelo")
	private Vuelo vuelo;
	
	@Column(name="numero_maletas")
	private int numero_maletas;
	
	@Column(name="precio_pagado_euros")
	private float precio_pagado_euros;
	
	
	
	

	public Reservacion(String codigo_reservacion, Cliente cliente, Vuelo vuelo, int numero_maletas,
			float precio_pagado_euros) {
		
		this.codigo_reservacion = codigo_reservacion;
		this.cliente = cliente;
		this.vuelo = vuelo;
		this.numero_maletas = numero_maletas;
		this.precio_pagado_euros = precio_pagado_euros;
	}
	
	public Reservacion() {
		
	}

	public int getId_reservacion() {
		return id_reservacion;
	}

	public void setId_reservacion(int id_reservacion) {
		this.id_reservacion = id_reservacion;
	}

	public String getCodigo_reservacion() {
		return codigo_reservacion;
	}

	public void setCodigo_reservacion(String codigo_reservacion) {
		this.codigo_reservacion = codigo_reservacion;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public Vuelo getVuelo() {
		return vuelo;
	}

	public void setVuelo(Vuelo vuelo) {
		this.vuelo = vuelo;
	}

	public int getNumero_maletas() {
		return numero_maletas;
	}

	public void setNumero_maletas(int numero_maletas) {
		this.numero_maletas = numero_maletas;
	}

	public float getPrecio_pagado_euros() {
		return precio_pagado_euros;
	}

	public void setPrecio_pagado_euros(float precio_pagado_euros) {
		this.precio_pagado_euros = precio_pagado_euros;
	}
	
	
}
