package aerolinea.controlador;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import aerolinea.controlador.objetos.Aeropuerto;
import aerolinea.controlador.objetos.Busqueda_Vuelo;
import aerolinea.controlador.objetos.Cliente;
import aerolinea.controlador.objetos.Reservacion;
import aerolinea.controlador.objetos.Usuario;
import aerolinea.controlador.objetos.Vuelo;

@Controller
@RequestMapping("/vuelos")
public class ControladorVuelos {
	ArrayList<Vuelo> vuelosSeleccionados;
	Cliente unCliente;
	ArrayList<Reservacion> reservas;

	int update = 0;

	@RequestMapping("/buscador")
	public String buscadorVuelos(@RequestParam("tipo_viaje") String tipoViaje,
			@RequestParam("sourcecity") String ciudadOrigen, @RequestParam("destcity") String ciudadDestino,
			@RequestParam("fecha_ida") String fechaIda, @RequestParam("fecha_regreso") String fechaRegreso,
			Model model) {

		Busqueda_Vuelo vueloCliente = new Busqueda_Vuelo(tipoViaje, ciudadOrigen, ciudadDestino, fechaIda,
				fechaRegreso);

		ArrayList<Vuelo> vuelos_ida = null;
		ArrayList<Vuelo> vuelos_regreso = null;
		if (tipoViaje.equalsIgnoreCase("ida")) {
			vuelos_ida = (ArrayList<Vuelo>) buscarVuelos(vueloCliente, true);
		} else {
			vuelos_ida = (ArrayList<Vuelo>) buscarVuelos(vueloCliente, true);
			vuelos_regreso = (ArrayList<Vuelo>) buscarVuelos(vueloCliente, false);
		}
		int num_vuelos_ida = -1;
		int num_vuelos_regreso = -1;
		if (vuelos_ida != null)
			num_vuelos_ida = vuelos_ida.size();

		if (vuelos_regreso != null)
			num_vuelos_regreso = vuelos_regreso.size();

		model.addAttribute("numVuelosIda", num_vuelos_ida);
		model.addAttribute("numVuelosRegreso", num_vuelos_regreso);

		model.addAttribute("vuelosIda", vuelos_ida);
		model.addAttribute("vuelosRegreso", vuelos_regreso);
		model.addAttribute("vueloCliente", vueloCliente);
		return "buscadorVuelos";
	}

	@RequestMapping("/informacioncliente")
	public String informacionCliente(@RequestParam("vueloElegidoIda") String vueloIda,
			@RequestParam("vueloElegidoRegreso") String vueloRegreso, Model model, HttpServletRequest request) {

		Usuario user = (Usuario) request.getSession().getAttribute("us");
		Cliente elCliente;
		if (user != null) {
			elCliente = user.getCliente();
			model.addAttribute("sesionStatus", true);
		} else {
			elCliente = new Cliente();

			model.addAttribute("sesionStatus", false);
		}

		vuelosSeleccionados = new ArrayList<Vuelo>();

		Vuelo vueloSeleccionadoIda = getVuelo(Integer.parseInt(vueloIda));

		Vuelo vueloSeleccionadoRegreso = getVuelo(Integer.parseInt(vueloRegreso));

		if (vueloSeleccionadoIda != null) {
			vuelosSeleccionados.add(vueloSeleccionadoIda);
		}

		if (vueloSeleccionadoRegreso != null) {
			vuelosSeleccionados.add(vueloSeleccionadoRegreso);
		}

		model.addAttribute("vuelosSeleccionados", vuelosSeleccionados);
		model.addAttribute("elCliente", elCliente);

		return "informacionCliente";
	}

	@RequestMapping("/confirmacionReserva")
	public String confirmarReserva(@Valid @ModelAttribute("elCliente") Cliente elCliente,
			BindingResult validationResult, Model model) {

		System.out.println(validationResult.hasErrors());
		model.addAttribute("vuelosSeleccionados", vuelosSeleccionados);
		if (validationResult.hasErrors()) {

			System.out.println(elCliente.getFecha_nacimiento());
			return "informacionCliente";
		} else {
			System.out.println(elCliente.getFecha_nacimiento());
			unCliente = elCliente;
			model.addAttribute("elCliente", unCliente);
			update = 0;
			return "confirmacionReserva";
		}

	}

	@RequestMapping("/mostrarReserva")
	public String mostrarReserva(@RequestParam("equipaje_vuelo1") String equipaje_vuelo1,
			@RequestParam("equipaje_vuelo2") String equipaje_vuelo2, @RequestParam("precioVuelo1") String precioVuelo1,
			@RequestParam("precioVuelo2") String precioVuelo2, @RequestParam("precioTotal") String precioTotal,
			Model model, HttpServletRequest request) {

		if (update == 0) {

			int[] equipajes = { Integer.parseInt(equipaje_vuelo1), Integer.parseInt(equipaje_vuelo2) };

			int[] precios = { Integer.parseInt(precioVuelo1), Integer.parseInt(precioVuelo2) };
			if (request.getSession().getAttribute("us") == null) 		
				saveCliente(unCliente);
			
			

			reservas = new ArrayList<Reservacion>();

			String codigoReservacion = generateReservacionCode();

			int numVuelo = 0;
			for (Vuelo vueloElegido : vuelosSeleccionados) {

				reservas.add(saveReserva(codigoReservacion, unCliente, vueloElegido, equipajes[numVuelo],
						precios[numVuelo]));
				numVuelo++;
			}

			update = 1;
		}

		model.addAttribute("reservas", reservas);

		model.addAttribute("numReservas", reservas.size());

		// model.addAttribute("precioTotal", Float.parseFloat(precioTotal));

		return "mostrarReserva";
	}

	private String generateReservacionCode() {
		String codigoReservacion = "";
		int c = 6;
		while (c != 0) {
			c--;
			int numero = ThreadLocalRandom.current().nextInt(65, 90 + 1);
			codigoReservacion += Character.toString((Character.toChars(numero)[0]));

		}
		return codigoReservacion;
	}

	private Reservacion saveReserva(String codigoReservacion, Cliente cliente, Vuelo vuelo, int numeroMaletas,
			int precioVuelo) {

		Reservacion nuevaReservacion = new Reservacion(codigoReservacion, cliente, vuelo, numeroMaletas, precioVuelo);
		SessionFactory miFactory = Controlador.configuration.buildSessionFactory();

		Session miSession = miFactory.openSession();
		// Iniciar Transaccion

		miSession.beginTransaction();

		// Guardar - Insertar
		miSession.save(nuevaReservacion);

		// realizar la transaccion

		miSession.getTransaction().commit();

		System.out.println("Registro insertado en base de datos");

		// Lectura de registro

		System.out.println("Lectura del registro con Id " + nuevaReservacion.getId_reservacion());

		System.out.println("Terminado");

		return nuevaReservacion;

	}

	private void saveCliente(Cliente unCliente2) {

		SessionFactory miFactory = Controlador.configuration.buildSessionFactory();

		Session miSession = miFactory.openSession();
		// Iniciar Transaccion

		miSession.beginTransaction();

		// Guardar - Insertar
		miSession.save(unCliente2);

		// realizar la transaccion

		miSession.getTransaction().commit();

		System.out.println("Registro insertado en base de datos");

		// Lectura de registro

		System.out.println("Lectura del registro con Id" + unCliente2.getId_cliente());

		System.out.println("Terminado");

	}

	private Vuelo getVuelo(int id) {
		SessionFactory miFactory = Controlador.configuration.buildSessionFactory();

		Session miSession = miFactory.openSession();

		Vuelo elVuelo = null;
		try {

			miSession.beginTransaction();

			String hql = "from Vuelo vl where vl.id_vuelo='" + id + "'";
			// Query query = miSession.createQuery(hql)
			Query query = miSession.createQuery(hql);

			List<Vuelo> results = query.getResultList();

			miSession.getTransaction().commit();

			if (results.size() > 0) {
				elVuelo = results.get(0);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {

		}
		return elVuelo;
	}

	private List<Vuelo> buscarVuelos(Busqueda_Vuelo vueloCliente, boolean vueloIda) {

		SessionFactory miFactory = Controlador.configuration.buildSessionFactory();

		Session miSession = miFactory.openSession();

		List<Vuelo> results = null;
		try {
			String fecha;
			String desde;
			String hacia;
			if (vueloIda) {
				fecha = vueloCliente.getFechaIda();
				desde = vueloCliente.getCiudadOrigen();
				hacia = vueloCliente.getCiudadDestino();
			} else {
				fecha = vueloCliente.getFechaRegreso();

				hacia = vueloCliente.getCiudadOrigen();
				desde = vueloCliente.getCiudadDestino();
			}

			miSession.beginTransaction();

			String hql = "from Vuelo vl where vl.aeropuerto_origen.ciudad='" + desde
					+ "' AND vl.aeropuerto_destino.ciudad='" + hacia + "' AND " + "fecha_despegue>='" + fecha
					+ " 00:00:00.0' AND vl.fecha_despegue<='" + fecha + " 23:59:59.0'";
			// Query query = miSession.createQuery(hql)
			Query query = miSession.createQuery(hql);

			results = query.getResultList();

			int c = 1;
			// leerClientes(results);
			for (Vuelo unVuelo : results) {
				System.out.println(c + ".- " + unVuelo.getAeropuerto_origen().getCiudad() + " "
						+ unVuelo.getAeropuerto_destino().getCiudad());
				c++;
			}

			miSession.getTransaction().commit();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {

		}
		return results;

	}
}
