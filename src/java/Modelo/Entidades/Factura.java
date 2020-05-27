/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Entidades;
import java.sql.Date;

/**
 *
 * @author Franco
 */
public class Factura {
    
    private int cod_factura;
    private String descripcion;
    private Date fecha_pago;
    private Date fecha_factura;

    public Factura() {
    }

    
    
    public Factura(int cod_factura, String descripcion, Date fecha_pago, Date fecha_factura) {
        this.cod_factura = cod_factura;
        this.descripcion = descripcion;
        this.fecha_pago = fecha_pago;
        this.fecha_factura = fecha_factura;
    }

    public int getCod_factura() {
        return cod_factura;
    }

    public void setCod_factura(int cod_factura) {
        this.cod_factura = cod_factura;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Date getFecha_pago() {
        return fecha_pago;
    }

    public void setFecha_pago(Date fecha_pago) {
        this.fecha_pago = fecha_pago;
    }

    public Date getFecha_factura() {
        return fecha_factura;
    }

    public void setFecha_factura(Date fecha_factura) {
        this.fecha_factura = fecha_factura;
    }
    
    
    
    
    
    
}
