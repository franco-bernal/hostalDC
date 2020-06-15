/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.DAO;

import Modelo.Conexion;
import Modelo.Entidades.UsuarioCli_detalle;
import Modelo.Entidades.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Franco
 */
public class DAOusuario_cli {
//DEtalles
    public String ingresarCliente(UsuarioCli_detalle det) {
        Conexion c = new Conexion();
        String rs;
        boolean resultado;
        try {
                //inserto datos del usuario
                Connection con = c.getConnection();
                String query1 = "INSERT INTO cliente VALUES ('"+det.getRut_emp()+"','"+det.getNom_emp()+"','"+det.getTele_emp()+"','"+det.getDir_emp()+"',"+det.getUsuario_id_usuario()+")";
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
            rs = ex.toString()+"  en metodo ingresar cliente/DAOusuario_cli "+det.getUsuario_id_usuario();
        }
        return rs;
    }

}

