/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Entidades;

/**
 *
 * @author Franco
 */
public class Visitas_aux {
    
    private  int cantidad;
    private String mes;

    public Visitas_aux(int cantidad, String mes) {
        this.cantidad = cantidad;
        this.mes = mes;
    }

    public Visitas_aux() {
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getMes() {
        return mes;
    }

    public void setMes(String mes) {
        this.mes = mes;
    }
    
    
    
    
}
