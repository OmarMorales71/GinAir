package aerolinea.controlador.objetos;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name="usuario")
public class Usuario {
	
	@Id
	@NotNull
	@Size(min=5, max=100, message="Introduce un username valido. (5 caracteres minimo.)")
	@Column(name="username")
	private String username;
	
	@NotNull
	@Size(min=5, max=100, message="Introduce una contraseña valida. (5 caracteres minimo.)")
	@Column(name="password")
	private String password;
	
	@Valid
	@OneToOne(fetch=FetchType.LAZY, orphanRemoval = true)
	@JoinColumn(name="id_cliente")
	private Cliente cliente;
	
	@Column(name="privilegio")
	private int privilegio=1;

	public Usuario(String username, String password, Cliente cliente, int privilegio) {
		
		this.username = username;
		this.password = password;
		this.cliente = cliente;
		this.privilegio = privilegio;
	}
	
	public Usuario() {
		
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public int getPrivilegio() {
		return privilegio;
	}

	public void setPrivilegio(int privilegio) {
		this.privilegio = privilegio;
	}
	
	

}
