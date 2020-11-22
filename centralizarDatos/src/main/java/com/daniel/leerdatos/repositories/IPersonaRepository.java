/**
 * 
 */
package com.daniel.leerdatos.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.daniel.leerdatos.model.DatosDataWhereHouse;

/**
 * @author despinog
 *
 */

@Repository
public interface IPersonaRepository extends JpaRepository<DatosDataWhereHouse, Integer> {


	
}
