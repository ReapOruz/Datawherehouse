/**
 * 
 */
package com.daniel.leerdatos.datoscsv;

import org.springframework.stereotype.Component;


/**
 * @author despinog
 *
 */

@Component
public class DatosCsv {

	/*private static final Logger log = LoggerFactory.getLogger(DatosCsv.class);

	@Value("${datoscsv.ruta.archivo}")
	private String rutaCsv;

	private DatosDataWhereHouse persona;

	public List<DatosDataWhereHouse> leerArchivoCsv() throws IOException {

		List<DatosDataWhereHouse> listaPersonasCsv = new ArrayList<>();

		Reader entrada = new FileReader(rutaCsv);
		Iterable<CSVRecord> registros = CSVFormat.EXCEL.withDelimiter(';').withFirstRecordAsHeader().parse(entrada);
		for (CSVRecord registro : registros) {

			try {
				persona = new DatosDataWhereHouse();
				persona.setId(Integer.parseInt(registro.get("Id")));
				persona.setNombre(registro.get("Nombre"));
				persona.setApellido(registro.get("Apellido"));
				persona.setGenero(registro.get("Genero"));
				
			} catch (Exception e) {

				log.error("Ha ocurrido un error" + e);

			} finally {

				listaPersonasCsv.add(persona);		
			}

		}
		
		entrada.close();

		return listaPersonasCsv;
	}*/

}
