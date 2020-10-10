package aerolinea.controlador;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import aerolinea.controlador.objetos.BusquedaReservacion;
import aerolinea.controlador.objetos.Cliente;
import aerolinea.controlador.objetos.Reservacion;
import aerolinea.controlador.objetos.Usuario;

@Controller
@RequestMapping("/reserva")
public class ControladorReserva {
	BusquedaReservacion reservacion;
	BindingResult validationResult;

	@RequestMapping("/buscarReserva")
	public String formularioReserva(Model model, HttpServletRequest request) {
		System.out.println("formulario Reservaa");
		BusquedaReservacion reserva = new BusquedaReservacion();

		
		if (request.getSession().getAttribute("us") != null) {
			Cliente cl = ((Usuario) request.getSession().getAttribute("us")).getCliente();
			reserva.setEmail(cl.getEmail());
		}
	
		model.addAttribute("laBusqueda", reserva);

		model.addAttribute("resNotFound", false);
		return "formularioReserva";
	}

	@RequestMapping("/busquedaMostrarReserva")
	public String busquedaMostrarReserva(@Valid @ModelAttribute("laBusqueda") BusquedaReservacion reservacion,
			BindingResult validationResult, Model model) {
		this.reservacion = reservacion;

		System.out.println("Reservacion " + reservacion.getCodigoReserva());
		this.validationResult = validationResult;
		if (validationResult.hasErrors()) {

			return "formularioReserva";
		} else {

			ArrayList<Reservacion> reservas = (ArrayList<Reservacion>) reservaciones(reservacion);
			if (reservas.size() == 0) {
				try {
					BusquedaReservacion reserva = new BusquedaReservacion();

					model.addAttribute("laBusqueda", reserva);
					model.addAttribute("resNotFound", true);
					return "formularioReserva";
				} catch (Exception ex) {
					return "index";
				}

			} else {
				model.addAttribute("reservas", reservas);
				model.addAttribute("numReservas", reservas.size());
				return "reservaEncontrada";
			}

		}

	}

//	@RequestMapping("/actualizarEquipaje")
//	public String actualizarEquipaje(@RequestParam("id_reservacion1") String id_reservacion1,
//			@RequestParam("precioPagado1") String precioPagado1, @RequestParam("equipajeExtra1") String equipajeExtra1,
//			@RequestParam("equipajeActual1") String equipajeActual1, Model model) {
//
//		System.out.println("Metodo de 1 vuelo actualizado");
//
//		if (Integer.parseInt(equipajeExtra1) != 0) {
//			actualizarVuelo(Integer.parseInt(id_reservacion1), Float.parseFloat(precioPagado1),
//					Integer.parseInt(equipajeExtra1), Integer.parseInt(equipajeActual1));
//
//		}
//
//		return busquedaMostrarReserva(reservacion, validationResult, model);
//
//	}

	@RequestMapping("/actualizarEquipaje")
	public String actualizarEquipaje(@RequestParam("id_reservacion1") String id_reservacion1,

			@RequestParam("precioPagado1") String precioPagado1, @RequestParam("equipajeExtra1") String equipajeExtra1,
			@RequestParam("equipajeActual1") String equipajeActual1,

			@RequestParam("id_reservacion2") String id_reservacion2,

			@RequestParam("precioPagado2") String precioPagado2, @RequestParam("equipajeExtra2") String equipajeExtra2,
			@RequestParam("equipajeActual2") String equipajeActual2, Model model) {
		System.out.println("Metodo de 2 vuelos actualizados");
		System.out.println("Precio Pagado1: " + precioPagado1);
		System.out.println("Equipaje Extra1: " + equipajeExtra1);
		System.out.println("Equipaje Actual1: " + equipajeActual1);
		
		System.out.println("Precio Pagado2: " + precioPagado2);
		System.out.println("Equipaje Extra2: " + equipajeExtra2);
		System.out.println("Equipaje Actual2: " + equipajeActual2);
		
		if (Integer.parseInt(equipajeExtra1) != 0) {
			actualizarVuelo(Integer.parseInt(id_reservacion1), Float.parseFloat(precioPagado1),
					Integer.parseInt(equipajeExtra1),Integer.parseInt(equipajeActual1));

		}

		if (Integer.parseInt(equipajeExtra2) != 0) {
			actualizarVuelo(Integer.parseInt(id_reservacion2), Float.parseFloat(precioPagado2),
					Integer.parseInt(equipajeExtra2),Integer.parseInt(equipajeActual2));

		}

		return busquedaMostrarReserva(reservacion, validationResult, model);
	}

	private void actualizarVuelo(int id_reservacion, float precioPagado, int equipajeExtra, int equipajeActual) {
		SessionFactory miFactory = Controlador.configuration.buildSessionFactory();

		Session miSession = miFactory.openSession();
		try {

			miSession.beginTransaction();

			String qry = "update Reservacion re set re.numero_maletas=:equi, re.precio_pagado_euros=:pre where re.id_reservacion=:rId";

			Query query = miSession.createQuery(qry);
			query.setParameter("equi", equipajeExtra + equipajeActual);
			int precioMaleta = 25;
			float precioNuevo = precioPagado + (equipajeExtra * precioMaleta);
			query.setParameter("pre", precioNuevo);

			query.setParameter("rId", id_reservacion);

			int count = query.executeUpdate();
			miSession.getTransaction().commit();

			System.out.println("Registro actualizado en base de datos");

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}

	@RequestMapping("/busquedaModificadaMostrarReserva")
	public String busquedaModificadaMostrarReserva(@RequestParam("id_reservacion") String id_reservacion, Model model) {
		deleteReservationFlight(id_reservacion);
		return busquedaMostrarReserva(reservacion, validationResult, model);
	}

	private void deleteReservationFlight(String id_reservacion) {
		SessionFactory miFactory = Controlador.configuration.buildSessionFactory();

		Session miSession = miFactory.openSession();

		try {

			miSession.beginTransaction();

			String qry = "delete from Reservacion re where re.id_reservacion=:rId";
			Query query = miSession.createQuery(qry);
			query.setParameter("rId", Integer.parseInt(id_reservacion));
			int count = query.executeUpdate();

			System.out.println("count " + count);
			miSession.getTransaction().commit();

			System.out.println("Registro borrado de la base de datos");
		} catch (Exception exSql) {
			System.out.println("Error al borrar la reservacion");
			System.out.println(exSql.getMessage());
		}

	}

	private List<Reservacion> reservaciones(BusquedaReservacion reservacion) {

		SessionFactory miFactory = Controlador.configuration.buildSessionFactory();

		Session miSession = miFactory.openSession();
		List<Reservacion> results = null;

		try {
			// Crear session

			miSession.beginTransaction();

			// Lenguaje HQL
			String hql = "from Reservacion re where re.codigo_reservacion='" + reservacion.getCodigoReserva()
					+ "' AND re.cliente.email='" + reservacion.getEmail() + "'";
			// Query query = miSession.createQuery(hql);
			results = miSession.createQuery(hql).getResultList();

			int c = 1;
			for (Reservacion unaReservacion : results) {
				System.out.println(c + ".- " + unaReservacion);
				c++;
			}

			miSession.getTransaction().commit();
		} catch (Exception e) {

		}
		return results;
	}

}
