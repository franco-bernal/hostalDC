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
//DETALLES DEL PEDIDO

    DAOorden_pedido dao_det = new DAOorden_pedido();

    private ArrayList<detalle_pedido> arrayDet = dao_det.ObtenerDetalles();

    public ArrayList<detalle_pedido> getDetallePedidos() {
        return arrayDet;
    }

    public void setArrayDetallePedidos(ArrayList<detalle_pedido> arrayDet) {
        this.arrayDet = arrayDet;
    }

    public ArrayList<detalle_pedido> obtenerDetalles(){
      return dao_det.ObtenerDetalles();
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

    public String eliminarPedido(int id) {
        return dao_ped.eliminarPedido(id);
    }

    public String limpiarCarroProductos(int id) {
        return dao_ped.limpiarProductos(id);
    }

    public String actualizarEstado(int estado, int id) {
        return dao_ped.actualizarEstado(estado, id);
    }

    public String limpiarPedidoCompleto(int id) {
        String rs = limpiarCarroProductos(id);
        if (rs.compareToIgnoreCase("true") == 0) {
            rs = eliminarPedido(id);
        }
        return rs;
    }

    public String EstadoDelPedido(int estado) {
        String est = "No encontrado";
        if (estado == 0) {
            est = "rechazado";//por proveedor
        }
        if (estado == 1) {
            est = "pendiente";//por cliente
        }
        if (estado == 2) {
            est = "enviado";//a proveedor
        }
        if (estado == 3) {
            est = "aceptado";//por proveedor
        }
        if (estado == 4) {
            est = "procesado";//por proveedor y enviado a empleados
        }
        if (estado == 5) {
            est="ok";//el pedido llegó bien
        }
        if(estado==6){
            est="falta";//productos. por empleados
        }

        
        return est;
    }
    
    
    public detalle_pedido traerDetallesDelPedido(int cod){
        
        for(int i=0;i<arrayDet.size();i++){
            if(arrayDet.get(i).getORDEN_PEDIDO_id_pedido()==cod){
               return arrayDet.get(i);
            }
        }
        return null;
    }
    

}
