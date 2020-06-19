/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Manejadoras;

import Modelo.DAO.DAOorden_compra;
import Modelo.Entidades.Orden_compra;
import java.util.ArrayList;

/**
 *
 * @author Franco
 */
public class Manejadora_orden {

    DAOorden_compra daoOrd = new DAOorden_compra();
    private ArrayList<Orden_compra> arrayOrden = daoOrd.ObtenerCompras();

    public ArrayList<Orden_compra> getOrden() {
        return arrayOrden;
    }

    public void setArrayOrden(ArrayList<Orden_compra> arrayOrd) {
        this.arrayOrden = arrayOrd;
    }

    public String ingresarCompra(Orden_compra ord) {
        return daoOrd.ingresarOrden(ord);
    }

    public int buscarCompra(int codigo) {
    int rs=0000;
        for (int i = 0; i < arrayOrden.size(); i++) {
            try {
                if (codigo == arrayOrden.get(i).getCodigo_compra()) {
                    return arrayOrden.get(i).getCodigo_compra();
                } else {
                    rs=0;
                }
            } catch (Exception e) {
                rs= 0000404;
            }

        }
        return rs+codigo;

    }

}
