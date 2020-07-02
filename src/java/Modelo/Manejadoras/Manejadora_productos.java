/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Manejadoras;


import Modelo.DAO.DAOproducto;
import Modelo.Entidades.Producto;
import java.util.ArrayList;

/**
 *
 * @author Franco
 */
public class Manejadora_productos {
    
    
    DAOproducto dao_pro = new DAOproducto();

    private ArrayList<Producto> arrayPro = dao_pro.ObtenerProductos();

    public ArrayList<Producto> getProducto() {
        return arrayPro;
    }

    public void setArrayProducto(ArrayList<Producto> arrayPro) {
        this.arrayPro = arrayPro;
    }

    /*
    ingresar
     */
    public String ingresarProducto(Producto pro) {
            if (pro != null) {
                return dao_pro.ingresarProducto(pro);
            } else {
                return "null";
            }
    }

    
    
}
