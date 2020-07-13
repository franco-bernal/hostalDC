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
public class Visitas {
    
   public int cantidad;
   public Date fecha;

    public Visitas() {
    }

    public Visitas(int cantidad, Date fecha) {
        this.cantidad = cantidad;
        this.fecha = fecha;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
   
   
}
