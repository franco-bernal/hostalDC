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
public class Orden_pedido {
    
    private int id_pedido;
    private Date f_emicion;
    private Date f_recepcion;
    private int estado;
    private String Proveedor_rut;
    private String Empleado_rut_empleado;

    public Orden_pedido() {
    }

    public Orden_pedido(int id_pedido, Date f_emicion, Date f_recepcion, int estado, String Proveedor_rut, String Empleado_rut_empleado) {
        this.id_pedido = id_pedido;
        this.f_emicion = f_emicion;
        this.f_recepcion = f_recepcion;
        this.estado = estado;
        this.Proveedor_rut = Proveedor_rut;
        this.Empleado_rut_empleado = Empleado_rut_empleado;
    }

    public int getId_pedido() {
        return id_pedido;
    }

    public void setId_pedido(int id_pedido) {
        this.id_pedido = id_pedido;
    }

    public Date getF_emicion() {
        return f_emicion;
    }

    public void setF_emicion(Date f_emicion) {
        this.f_emicion = f_emicion;
    }

    public Date getF_recepcion() {
        return f_recepcion;
    }

    public void setF_recepcion(Date f_recepcion) {
        this.f_recepcion = f_recepcion;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public String getProveedor_rut() {
        return Proveedor_rut;
    }

    public void setProveedor_rut(String Proveedor_rut) {
        this.Proveedor_rut = Proveedor_rut;
    }

    public String getEmpleado_rut_empleado() {
        return Empleado_rut_empleado;
    }

    public void setEmpleado_rut_empleado(String Empleado_rut_empleado) {
        this.Empleado_rut_empleado = Empleado_rut_empleado;
    }
    
    
}
