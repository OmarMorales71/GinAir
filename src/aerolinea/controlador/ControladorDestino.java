package aerolinea.controlador;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/destinos")
public class ControladorDestino {

	@RequestMapping("/cancun")
	public String cancun() {
		return "cancun";
		
	}
	
	@RequestMapping("/londres")
	public String londres() {
		return "londres";
		
	}
	
	@RequestMapping("/paris")
	public String paris() {
		return "paris";
		
	}
	
	@RequestMapping("/roma")
	public String roma() {
		return "roma";
		
	}
	
}
