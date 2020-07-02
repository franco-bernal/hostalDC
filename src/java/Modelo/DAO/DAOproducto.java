/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.DAO;

import Modelo.Conexion;
import Modelo.Entidades.Producto;
import Modelo.Entidades.detalle_pedido;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Franco
 */
public class DAOproducto {
    
     public String ingresarProducto(Producto pro) {
        Conexion c = new Conexion();
        String rs;
        boolean resultado;
        try {
                //inserto datos del usuario
                Connection con = c.getConnection();
                String query1 = "INSERT INTO PRODUCTOS VALUES ("+pro.getId_producto()+",'"+pro.getNombre()+"','"+pro.getDetalle()+"',"+pro.getValor()+",'"+pro.getProveedor_rut()+"')";
                PreparedStatement ps = con.prepareStatement(query1);
                ps = con.prepareStatement(query1);
                
                resultado=ps.executeUpdate()==1;
                ps.close();
         
            if (resultado = true) {
                rs = "Se ingreso exitosamente";
            } else {
                rs = "No se pudo ingresar";
            }
        } catch (SQLException ex) {
            rs = ex.toString()+"  en metodo ingresar producto/DAOproducto "+pro.getNombre();
        }
        return rs;
    }
    
       public ArrayList<Producto> ObtenerProductos() {
        ArrayList<Producto> arrayPro = new ArrayList<Producto>();
        try {
            Conexion c = new Conexion();
            Connection con = c.getConnection();
            String query = "select * from productos order by id_producto";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Producto pro = new Producto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5));
                arrayPro.add(pro);
            }
            ps.close();
            return arrayPro;
        } catch (SQLException ex) {
            return null;
        }
    }
       
    
}
