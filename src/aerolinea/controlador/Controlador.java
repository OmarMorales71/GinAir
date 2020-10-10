package aerolinea.controlador;


import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import aerolinea.controlador.objetos.Aeropuerto;
import aerolinea.controlador.objetos.Cliente;
import aerolinea.controlador.objetos.Reservacion;
import aerolinea.controlador.objetos.Usuario;
import aerolinea.controlador.objetos.Vuelo;


@Controller
public class Controlador {
	public static Configuration configuration;
		
	@RequestMapping
	public String inicio() {
		
		iniciarConfiguracionBBDD();
		return "index";
	}

	private void iniciarConfiguracionBBDD() {
		configuration = new Configuration().configure("hibernate.cfg.xml"); 
		 configuration.addAnnotatedClass(Vuelo.class);
		 configuration.addAnnotatedClass(Aeropuerto.class);
		 configuration.addAnnotatedClass(Cliente.class);
		 configuration.addAnnotatedClass(Reservacion.class);
		 configuration.addAnnotatedClass(Usuario.class);
		
	}
	
	
}
