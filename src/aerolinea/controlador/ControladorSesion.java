package aerolinea.controlador;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import aerolinea.controlador.objetos.Cliente;
import aerolinea.controlador.objetos.Usuario;

@Controller
@RequestMapping("/sesion")
public class ControladorSesion {
	Usuario usuarioActual;
	int cerrada = 0;

	// Metodo que se ejecuta antes de la validación del controlador
	@InitBinder
	public void miBinder(WebDataBinder binder) {
		// .trim()
		StringTrimmerEditor recortarEspacios = new StringTrimmerEditor(true);

		// Se mete lo que se debe evaluar, En todos los strings se recortan los espacios
		// en blanco innecesarios
		binder.registerCustomEditor(String.class, recortarEspacios);
	}

	@RequestMapping("/iniciarSesion")
	public String formularioIniciarSesion(Model model) {

		System.out.println("Formulario Sesion");

		model.addAttribute("resNotFound", false);

		model.addAttribute("aviso", 0);
		return "formularioInicioSesion";
	}

	@RequestMapping("/registroUsuario")
	public String formularioUsuario(Model model) {

		System.out.println("Formulario Registro Usuario");
		Usuario user = new Usuario();

		model.addAttribute("usuario", user);
		return "registroUsuario";
	}

	@RequestMapping("/usuarioRegistrado")
	public String registrarUsuario(@Valid @ModelAttribute("usuario") Usuario usuario, BindingResult validationResult,
			Model model) {
		// try {
		if (validationResult.hasErrors()) {
			System.out.println("Error");
			return "registroUsuario";
		} else {
			Cliente c = usuario.getCliente();

			System.out.println(c.getNombre_cliente());
			saveUser(usuario);
			model.addAttribute("resNotFound", false);
			model.addAttribute("aviso", 1);
			return "formularioInicioSesion";
		}

	}

	@RequestMapping("/sesionIniciada")
	public String sesionIniciada2(HttpServletRequest request,
			@RequestParam(value = "user", required = false, defaultValue = "0") String username,
			@RequestParam(value = "password", required = false, defaultValue = "0") String password, Model model) {

		System.out.println(username);
		System.out.println(password);

		if (request.getSession().getAttribute("us") != null) {
			model.addAttribute("usuarioIniciado", usuarioActual);
			return "sesionIniciada";
		} else {
			Usuario sesion = null;
			if (!username.equalsIgnoreCase("0")) {
				sesion = buscarUsuario(username, password);

			}

			if (sesion != null) {
				HttpSession sesionUsuario = request.getSession();

				usuarioActual = sesion;
				sesionUsuario.setAttribute("us", usuarioActual);

				cerrada = 1;

				model.addAttribute("usuarioIniciado", usuarioActual);
				return "sesionIniciada";
			} else {

				model.addAttribute("resNotFound", true);
				return "formularioInicioSesion";
			}
		}

	}

	@RequestMapping("/perfil")
	public String perfil(HttpServletRequest request, Model model) {

		if (request.getSession().getAttribute("us") == null) {
			return formularioIniciarSesion(model);
		} else {
			Usuario thisUser = (Usuario) request.getSession().getAttribute("us");

			model.addAttribute("thisUser", thisUser);
			
			//if(model.getAttribute("aviso")==null)model.addAttribute("aviso", 0);
			
			return "perfil";
		}

	}

	@RequestMapping("/updateUser")
	public String updateUser(@Valid @ModelAttribute("thisUser") Usuario usuario, BindingResult validationResult,
			HttpServletRequest request, Model model, @RequestParam("confirmarUsername") String confirmarUsername) {
		System.out.println(confirmarUsername);
		if (request.getSession().getAttribute("us") == null) {
			return formularioIniciarSesion(model);
		} else {
			if (validationResult.hasErrors()) {
				System.out.println("Error");
				return "perfil";
			} else {

				boolean sameUsername = (usuario.getUsername().equals(confirmarUsername)) ? true : false;
				System.out.println(sameUsername);
				if (updateUsuario(usuario, sameUsername, confirmarUsername)) {
					request.getSession().setAttribute("us", usuario);
					model.addAttribute("aviso", 1);
					return perfil(request, model);
				} else {
					return "perfil";
				}

			}
		}

	}

	@RequestMapping("/restaurarContrasena")
	public String restaurarContrasena(
			@RequestParam(value = "newPassword", required = false, defaultValue = "0") String newPassword,
			HttpServletRequest request, Model model) {
		Usuario user = (Usuario) request.getSession().getAttribute("us");

		if (user != null) {
			if (newPassword.equals("0")) {
				return perfil(request, model);
			}else {
				user.setPassword(newPassword);
				if(updateUsuario(user, true, "")) {
					request.getSession().setAttribute("us", user);
					System.out.println("Contraseña actualizada");
					model.addAttribute("aviso", 2);
					return perfil(request, model);
				}
				return perfil(request, model);
			}
		} else {
			return formularioIniciarSesion(model);
		}

	}

	private boolean updateUsuario(Usuario usuario, boolean sameUsername, String confirmaUsername) {
		try {

			SessionFactory miFactory = Controlador.configuration.buildSessionFactory();

			Session miSession = miFactory.openSession();
			// Iniciar Transaccion

			Cliente nuevoCliente = usuario.getCliente();

			miSession.beginTransaction();
			System.out.println("ID "+nuevoCliente.getId_cliente());
			//System.out.println("user " +nuevoCliente.getUsuario().getUsername());
			if(!confirmaUsername.equals("")) {
				miSession.saveOrUpdate(nuevoCliente);	
			}
			
			if (sameUsername) {
				miSession.saveOrUpdate(usuario);
				System.out.println("Actualizado Papi");
			} else {
				Query qr = miSession.createQuery("update Usuario sr set sr.username=:us where sr.username=:us2");
				qr.setParameter("us", usuario.getUsername());
				qr.setParameter("us2", confirmaUsername);
				qr.executeUpdate();
			}

			miSession.getTransaction().commit();

			System.out.println("Registro actualizado en base de datos");

			System.out.println("Terminado");

			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			return false;
		}
	}

	@RequestMapping("/cerrarSesion")
	public String cerrarSesion(HttpServletRequest request, HttpServletResponse response, Model model) {
		request.getSession().removeAttribute("us");
		return formularioIniciarSesion(model);
	}

	private Usuario buscarUsuario(String username, String password) {
		SessionFactory miFactory = Controlador.configuration.buildSessionFactory();

		Session miSession = miFactory.openSession();
		Usuario aux = null;
		miSession.beginTransaction();

		String hql = "from Usuario us where us.username=:uSe AND us.password=:pSs";
		Query query = miSession.createQuery(hql);
		query.setParameter("uSe", username);
		query.setParameter("pSs", password);
		List<Usuario> results = query.getResultList();

		boolean foundIt = (!results.isEmpty());

		miSession.getTransaction().commit();
		if (foundIt) {
			aux = results.get(0);
		}
		return aux;
	}

	private void saveUser(Usuario usuario) {
		SessionFactory miFactory = Controlador.configuration.buildSessionFactory();

		Session miSession = miFactory.openSession();
		// Iniciar Transaccion

		miSession.beginTransaction();

		// Guardar - Insertar
		Cliente nuevoCliente = usuario.getCliente();

		miSession.save(nuevoCliente);

		miSession.save(usuario);

		// realizar la transaccion

		miSession.getTransaction().commit();

		System.out.println("Registro insertado en base de datos");

		System.out.println("Terminado");

	}
}
