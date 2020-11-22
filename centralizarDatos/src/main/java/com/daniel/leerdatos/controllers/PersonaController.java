/**
 * 
 */
package com.daniel.leerdatos.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.daniel.leerdatos.model.DatosDataWhereHouse;
import com.daniel.leerdatos.services.PersonaService;
/**
 * @author despinog
 *
 */

@Controller
@RequestMapping("/datawherehouse")
public class PersonaController {

	@Autowired
	private PersonaService personaService;

	@GetMapping("/obtener")
	public String mostrarDatos(Model model) throws IOException {

		List<DatosDataWhereHouse> listaVentas = new ArrayList<>();
		listaVentas.addAll(personaService.obtenerPersonas());
	
		model.addAttribute("titulo", "Reporte");
		model.addAttribute("listaVentas",(listaVentas));

		return "listaPersonasCargadas";

	}

}
