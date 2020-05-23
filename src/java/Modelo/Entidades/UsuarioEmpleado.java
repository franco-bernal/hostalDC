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
public class UsuarioEmpleado {
    
    private String rut;
    private String nombre;
    private String apellido;
    private int USUARIO_id_usuario;

      public UsuarioEmpleado() {
    }
    
    
    public UsuarioEmpleado(String rut, String nombre, String apellido, int USUARIO_id_usuario) {
        this.rut = rut;
        this.nombre = nombre;
        this.apellido = apellido;
        this.USUARIO_id_usuario = USUARIO_id_usuario;
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

    public int getUSUARIO_id_usuario() {
        return USUARIO_id_usuario;
    }

    public void setUSUARIO_id_usuario(int USUARIO_id_usuario) {
        this.USUARIO_id_usuario = USUARIO_id_usuario;
    }

  
    
    
}
