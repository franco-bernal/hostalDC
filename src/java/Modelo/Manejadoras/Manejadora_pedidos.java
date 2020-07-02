/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Manejadoras;

import Modelo.DAO.DAOorden_pedido;
import Modelo.Entidades.Orden_pedido;
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

            if (ord!=null) {
                return dao_ped.ingresarPedidoComoEmpleado(ord);
            } else {
                return "null";
            }

    }

}
