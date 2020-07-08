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
public class Orden_compra {

    private int codigo_compra;
    private Date f_inicio;
    private Date f_fin;
    private Date f_compra;
    private int precio_total;
    private int tipo_hab;
    private int tipo_min;
    private String cliente_rut_emp;
    private int FACTURA_cod_factura;

    public Orden_compra() {
    }

    public Orden_compra(int codigo_compra, Date f_inicio, Date f_fin, Date f_compra, int precio_total, int tipo_hab, int tipo_min, String cliente_rut_emp, int FACTURA_cod_factura) {
        this.codigo_compra = codigo_compra;
        this.f_inicio = f_inicio;
        this.f_fin = f_fin;
        this.f_compra = f_compra;
        this.precio_total = precio_total;
        this.tipo_hab = tipo_hab;
        this.tipo_min = tipo_min;
        this.cliente_rut_emp = cliente_rut_emp;
        this.FACTURA_cod_factura = FACTURA_cod_factura;
    }

    public int getCodigo_compra() {
        return codigo_compra;
    }

    public void setCodigo_compra(int codigo_compra) {
        this.codigo_compra = codigo_compra;
    }

    public Date getF_inicio() {
        return f_inicio;
    }

    public void setF_inicio(Date f_inicio) {
        this.f_inicio = f_inicio;
    }

    public Date getF_fin() {
        return f_fin;
    }

    public void setF_fin(Date f_fin) {
        this.f_fin = f_fin;
    }

    public Date getF_compra() {
        return f_compra;
    }

    public void setF_compra(Date f_compra) {
        this.f_compra = f_compra;
    }

    public int getPrecio_total() {
        return precio_total;
    }

    public void setPrecio_total(int precio_total) {
        this.precio_total = precio_total;
    }

    public int getTipo_hab() {
        return tipo_hab;
    }

    public void setTipo_hab(int tipo_hab) {
        this.tipo_hab = tipo_hab;
    }

    public int getTipo_min() {
        return tipo_min;
    }

    public void setTipo_min(int tipo_min) {
        this.tipo_min = tipo_min;
    }

    public String getCliente_rut_emp() {
        return cliente_rut_emp;
    }

    public void setCliente_rut_emp(String cliente_rut_emp) {
        this.cliente_rut_emp = cliente_rut_emp;
    }

    public int getFACTURA_cod_factura() {
        return FACTURA_cod_factura;
    }

    public void setFACTURA_cod_factura(int FACTURA_cod_factura) {
        this.FACTURA_cod_factura = FACTURA_cod_factura;
    }

    
}
