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
    private int valor_total;
    private Date f_emicion;

    public Factura() {
    }

    public Factura(int cod_factura, int valor_total, Date f_emicion) {
        this.cod_factura = cod_factura;
        this.valor_total = valor_total;
        this.f_emicion = f_emicion;
    }

    public int getCod_factura() {
        return cod_factura;
    }

    public void setCod_factura(int cod_factura) {
        this.cod_factura = cod_factura;
    }

    public int getValor_total() {
        return valor_total;
    }

    public void setValor_total(int valor_total) {
        this.valor_total = valor_total;
    }

    public Date getF_emicion() {
        return f_emicion;
    }

    public void setF_emicion(Date f_emicion) {
        this.f_emicion = f_emicion;
    }

    
    
    

}
