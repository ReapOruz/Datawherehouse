package com.daniel.leerdatos.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daniel.leerdatos.model.DatosDataWhereHouse;
import com.daniel.leerdatos.repositories.IPersonaRepository;

@Service
public class PersonaService {

	@Autowired
	private IPersonaRepository personaRepository;

	public List<DatosDataWhereHouse> obtenerPersonas() {

		return personaRepository.findAll();
	}
	
}
