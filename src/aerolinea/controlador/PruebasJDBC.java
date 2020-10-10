package aerolinea.controlador;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import aerolinea.controlador.objetos.Aeropuerto;
import aerolinea.controlador.objetos.Vuelo;

public class PruebasJDBC {

	public static void main(String[] args) {
		// 1. Crear SessionFactory

		
		System.out.println("1");
		Configuration configuration = new Configuration().configure("hibernate.cfg.xml"); 
	     
		 configuration.addAnnotatedClass(Vuelo.class);
		 configuration.addAnnotatedClass(Aeropuerto.class);
	     SessionFactory miFactory= configuration.buildSessionFactory();

		// 2. Crear Session
	     System.out.println("2");
		Session miSession = miFactory.openSession();
		System.out.println("3");
		String fecha="2020-05-01";
		try {
			//Crear session
			
			miSession.beginTransaction();
			
			//Lenguaje HQL
			
			String hql = "from Vuelo vl where vl.fecha_despegue>='"+fecha+" 00:00:00.0'";
			//Query query = miSession.createQuery(hql);
			List <Vuelo> results = miSession.createQuery(hql).getResultList();
			int c=1;
			//leerClientes(results);
			for(Vuelo unVuelo: results) {
				System.out.println(c+".- "+unVuelo.getFecha_despegue() + " "+unVuelo.getFecha_aterrizaje());
				c++;
			}
			//Lenguaje HQL
			/*hql = "from Clientes cl where cl.direccion='Principal 23' or cl.apellidos='Hernandez'";
			//Query query = miSession.createQuery(hql);
			results = miSession.createQuery(hql).getResultList();
			c=1;*/
			//leerClientes(results);
			
			miSession.getTransaction().commit();
		}catch(Exception e){
			System.out.println(e.getMessage());
		}finally {
			miSession.close();
			miFactory.close();
		}
	}

}
