package aerolinea.controlador.objetos;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Entity
@Table(name="cliente")
public class Cliente {

	@Id
	@Column(name="id_cliente")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id_cliente;
	
	@NotNull
	@Size(min=2, message="Campo Requerido.")
	@Column(name="nombre_cliente")
	private String nombre_cliente;
	
	@NotNull
	@Size(min=2, message="Campo Requerido.")
	@Column(name="apellido_cliente")
	private String apellido_cliente;
	
	@NotNull
	@Size(min=9, max=10, message="Introduce un pasaporte valido (9-10 caracteres).")
	@Column(name="pasaporte")
	private String pasaporte;
	
	@NotNull
    @Pattern(regexp="[A-Za-z0-9._%-+]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}", message="Introduce un correo valido.")
	@Column(name="email")
	private String email;
	
	@Pattern(regexp="[0-9]{9,10}", message="Ingresa un numero de telefono valido. (9-10 digitos).")
	@Column(name="telefono")
	private String telefono;
	
	
	@Column(name="fecha_nacimiento")
	private Date fecha_nacimiento;
	
	@OneToMany(mappedBy="cliente", cascade= CascadeType.ALL)
	private List<Reservacion> reservas = new ArrayList<Reservacion>();
	
	@OneToOne(mappedBy="cliente", cascade=CascadeType.ALL)
	private Usuario usuario;

	
	
	public List<Reservacion> getReservas() {
		return reservas;
	}

	public void setReservas(List<Reservacion> reservas) {
		this.reservas = reservas;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public int getId_cliente() {
		return id_cliente;
	}

	public void setId_cliente(int id_cliente) {
		this.id_cliente = id_cliente;
	}

	public String getNombre_cliente() {
		return nombre_cliente;
	}

	public void setNombre_cliente(String nombre_cliente) {
		this.nombre_cliente = nombre_cliente;
	}

	public String getApellido_cliente() {
		return apellido_cliente;
	}

	public void setApellido_cliente(String apellido_cliente) {
		this.apellido_cliente = apellido_cliente;
	}

	public String getPasaporte() {
		return pasaporte;
	}

	public void setPasaporte(String pasaporte) {
		this.pasaporte = pasaporte;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public Date getFecha_nacimiento() {
		return fecha_nacimiento;
	}

	public void setFecha_nacimiento(Date fecha_nacimiento) {
		this.fecha_nacimiento = fecha_nacimiento;
	}
	
	
	
}
