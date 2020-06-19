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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
    
       public ArrayList<UsuarioCli_detalle> ObtenerClientes() {
        ArrayList<UsuarioCli_detalle> arraycli = new ArrayList<UsuarioCli_detalle>();
        try {
            Conexion c = new Conexion();
            Connection con = c.getConnection();
            String query = "select * from cliente";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                UsuarioCli_detalle usu = new UsuarioCli_detalle(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5));
                arraycli.add(usu);
            }
            ps.close();
            return arraycli;
        } catch (SQLException ex) {
            return null;
        }
    }

}

