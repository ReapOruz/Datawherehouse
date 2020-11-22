/**
 * 
 */
package com.daniel.leerdatos.model;

import javax.persistence.Table;

import org.springframework.stereotype.Component;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * @author despinog
 *
 */

@Entity
@Table(name = "hechosfact_venta")
@Component
public class DatosDataWhereHouse implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "fac_id")
	private Integer facturaId;

	@Column(name = "estado_pago")
	private Integer estadoPago;

	@Column(name = "cliente_id")
	private Integer cliente;

	@Column(name = "fecha")
	private String fecha;

	@Column(name = "producto_id")
	private Integer producto;

	private Integer cantidad;

	private double total;

	public DatosDataWhereHouse() {

	}

	public Integer getFacturaId() {
		return facturaId;
	}

	public void setFacturaId(Integer facturaId) {
		this.facturaId = facturaId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getEstadoPago() {
		return estadoPago;
	}

	public void setEstadoPago(Integer estadoPago) {
		this.estadoPago = estadoPago;
	}

	public Integer getCliente() {
		return cliente;
	}

	public void setCliente(Integer cliente) {
		this.cliente = cliente;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public Integer getProducto() {
		return producto;
	}

	public void setProducto(Integer producto) {
		this.producto = producto;
	}

	public Integer getCantidad() {
		return cantidad;
	}

	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}
	
	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
