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
public class detalle_pedido {
    
    
    private int cantidad;
    private int ORDEN_PEDIDO_id_pedido;
    private int PRODUCTOS_id_producto;

    public detalle_pedido() {
    }

    public detalle_pedido(int cantidad, int ORDEN_PEDIDO_id_pedido, int PRODUCTOS_id_producto) {
        this.cantidad = cantidad;
        this.ORDEN_PEDIDO_id_pedido = ORDEN_PEDIDO_id_pedido;
        this.PRODUCTOS_id_producto = PRODUCTOS_id_producto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getORDEN_PEDIDO_id_pedido() {
        return ORDEN_PEDIDO_id_pedido;
    }

    public void setORDEN_PEDIDO_id_pedido(int ORDEN_PEDIDO_id_pedido) {
        this.ORDEN_PEDIDO_id_pedido = ORDEN_PEDIDO_id_pedido;
    }

    public int getPRODUCTOS_id_producto() {
        return PRODUCTOS_id_producto;
    }

    public void setPRODUCTOS_id_producto(int PRODUCTOS_id_producto) {
        this.PRODUCTOS_id_producto = PRODUCTOS_id_producto;
    }
    
    
}
