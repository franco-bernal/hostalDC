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
public class Habitacion {
    
    private int num_hab;
    private String tipo_cama;
    private int precio;
    private String accesorio;
    private char disponibilidad;
    private int ORDEN_compra_codigo_compra;

    public Habitacion() {
    }

    public Habitacion(int num_hab, String tipo_cama, int precio, String accesorio, char disponibilidad, int ORDEN_compra_codigo_compra) {
        this.num_hab = num_hab;
        this.tipo_cama = tipo_cama;
        this.precio = precio;
        this.accesorio = accesorio;
        this.disponibilidad = disponibilidad;
        this.ORDEN_compra_codigo_compra = ORDEN_compra_codigo_compra;
    }

    public int getNum_hab() {
        return num_hab;
    }

    public void setNum_hab(int num_hab) {
        this.num_hab = num_hab;
    }

    public String getTipo_cama() {
        return tipo_cama;
    }

    public void setTipo_cama(String tipo_cama) {
        this.tipo_cama = tipo_cama;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public String getAccesorio() {
        return accesorio;
    }

    public void setAccesorio(String accesorio) {
        this.accesorio = accesorio;
    }

    public char getDisponibilidad() {
        return disponibilidad;
    }

    public void setDisponibilidad(char disponibilidad) {
        this.disponibilidad = disponibilidad;
    }

    public int getORDEN_compra_codigo_compra() {
        return ORDEN_compra_codigo_compra;
    }

    public void setORDEN_compra_codigo_compra(int ORDEN_compra_codigo_compra) {
        this.ORDEN_compra_codigo_compra = ORDEN_compra_codigo_compra;
    }
    
    
    
    
}
