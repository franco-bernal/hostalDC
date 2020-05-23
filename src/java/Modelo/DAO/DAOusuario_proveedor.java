/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.DAO;

import Modelo.Conexion;
import Modelo.Entidades.UsuarioProveedor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


/**
 *
 * @author Franco
 */
public class DAOusuario_proveedor {

      public String ingresarProveedor(UsuarioProveedor pro) {
        Conexion c = new Conexion();
        String rs;
        boolean resultado;
        try {
                //inserto datos del usuario
                Connection con = c.getConnection();
                String query1 = "INSERT INTO Proveedor VALUES (?,?,?,?)";
                PreparedStatement ps = con.prepareStatement(query1);
                ps = con.prepareStatement(query1);
                ps.setString(1, pro.getRut());
                ps.setString(2, pro.getNom_empresa());
                ps.setString(3, pro.getRubro());
                ps.setInt(4, pro.getUSUARIO_id_usuario());
                resultado=ps.executeUpdate()==1;
                ps.close();
         
            if (resultado = true) {
                rs = "Se ingreso exitosamente";
            } else {
                rs = "No se pudo ingresar";
            }
        } catch (SQLException ex) {
            rs = "En metodo ingresar provedor, DAOusuario_proveedor  rut:"+pro.getRut() +" ERROR: "+ex.toString();
        }
        return rs;
    }

}
