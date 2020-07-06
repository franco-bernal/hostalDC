/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Manejadoras;

import Modelo.DAO.DAOorden_pedido;
import Modelo.Entidades.Orden_pedido;
import Modelo.Entidades.detalle_pedido;
import java.util.ArrayList;

/**
 *
 * @author Franco
 */
public class Manejadora_pedidos {

    DAOorden_pedido dao_ped = new DAOorden_pedido();

    private ArrayList<Orden_pedido> arrayPed = dao_ped.ObtenerPedidos();

    public ArrayList<Orden_pedido> getPedido() {
        return arrayPed;
    }

    public void setArrayPedido(ArrayList<Orden_pedido> arrayPed) {
        this.arrayPed = arrayPed;
    }

    /*
    ingresar
     */
    public String ingresarPedidoComoEmpleado(Orden_pedido ord) {
        if (ord != null) {
            return dao_ped.ingresarPedido(ord);
        } else {
            return "null";
        }

    }

    public int pedidoMaxid() {
        return arrayPed.size() + 1;
    }

    public String ingresarCantidadTabla(detalle_pedido det) {
        if (det != null) {
            return dao_ped.ingresarCantidad(det);
        } else {
            return "null";
        }

    }
    
    public String eliminarPedido(int id){
        return dao_ped.eliminarPedido(id);
    }
    
    
    public String limpiarCarroProductos(int id){
    return dao_ped.limpiarProductos(id);
    }
    
    public String actualizarEstado(int estado, int id){
        return dao_ped.actualizarEstado(estado, id);
    }
    
    
    public String limpiarPedidoCompleto(int id){
        String rs=limpiarCarroProductos(id);
        if(rs.compareToIgnoreCase("true")==0){
            rs=eliminarPedido(id);
        }
        return rs;
    }

}
