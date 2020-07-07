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

    public int cambiarNombreProductoPorId(String nom){
        for(int i=0;i<arrayPro.size();i++){
        if(arrayPro.get(i).getNombre().compareToIgnoreCase(nom)==0)
            return arrayPro.get(i).getId_producto();
         }
       return 0; 
    }
    
     public Producto obtenerProductoPorId(int id){
        for(int i = 0 ;i<arrayPro.size();i++){
            if(arrayPro.get(i).getId_producto()==id){
                return arrayPro.get(i);
            }
        }
        return null;
    }

     public int maxIdProducto(){
         return arrayPro.size()+1;
     }
    
}
