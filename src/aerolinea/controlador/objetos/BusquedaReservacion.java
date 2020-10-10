package aerolinea.controlador.objetos;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class BusquedaReservacion {

	@NotNull
	@Pattern(regexp="[A-Za-z0-9]{6}", message="Ingresa un codigo de reserva valido.")
	private String codigoReserva;
	
	@NotNull
    @Pattern(regexp="[A-Za-z0-9._%-+]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}", message="Introduce un correo valido.")
	private String email;

	public String getCodigoReserva() {
		return codigoReserva;
	}

	public void setCodigoReserva(String codigoReserva) {
		this.codigoReserva = codigoReserva;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
