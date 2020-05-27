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
public class Huesped {
    
    private String rut;
    private String nombre;
    private String apellido;
    private int HABITACION_num_hab;

    public Huesped() {
    }

    public Huesped(String rut, String nombre, String apellido, int HABITACION_num_hab) {
        this.rut = rut;
        this.nombre = nombre;
        this.apellido = apellido;
        this.HABITACION_num_hab = HABITACION_num_hab;
    }

    public String getRut() {
        return rut;
    }

    public void setRut(String rut) {
        this.rut = rut;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public int getHABITACION_num_hab() {
        return HABITACION_num_hab;
    }

    public void setHABITACION_num_hab(int HABITACION_num_hab) {
        this.HABITACION_num_hab = HABITACION_num_hab;
    }
    
    
    
}
