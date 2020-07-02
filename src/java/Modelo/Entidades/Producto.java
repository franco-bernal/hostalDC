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
public class Producto {
    
    private int id_producto;
    private String nombre;
    private String detalle;
    private int valor;
    private String proveedor_rut;

    public Producto() {
    }

    public Producto(int id_producto, String nombre, String detalle, int valor, String proveedor_rut) {
        this.id_producto = id_producto;
        this.nombre = nombre;
        this.detalle = detalle;
        this.valor = valor;
        this.proveedor_rut = proveedor_rut;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDetalle() {
        return detalle;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }

    public int getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }

    public String getProveedor_rut() {
        return proveedor_rut;
    }

    public void setProveedor_rut(String proveedor_rut) {
        this.proveedor_rut = proveedor_rut;
    }

    
    
    
}
