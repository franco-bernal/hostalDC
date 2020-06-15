/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.DAO;

import Modelo.Conexion;
import Modelo.Entidades.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

/**
 *
 * @author Franco
 */
public class DAOusuario {

    /*
    obtener
    ingresar
    actualizar
    eliminar
     */
    //OBTENER
    public ArrayList<Usuario> ObtenerUsuario() {
        ArrayList<Usuario> usuArray = new ArrayList<Usuario>();
        try {
            Conexion c = new Conexion();
            Connection con = c.getConnection();
            String query = "select * from usuario order by id_usuario";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Usuario usu = new Usuario(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6));
                usuArray.add(usu);
            }
            ps.close();
            return usuArray;
        } catch (SQLException ex) {
            return null;
        }
    }

    //INGRESAR
    public String ingresarUsuario(Usuario usu) {
        Conexion c = new Conexion();
        String rs;
        boolean resultado;
        try {
            //inserto datos del usuario
            Connection con = c.getConnection();
            String query1 = "INSERT INTO usuario VALUES (?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query1);
            ps.setInt(1, usu.getId_usuario());
            ps.setString(2, usu.getNom_usuario());
            ps.setString(3, usu.getClave());
            ps.setString(4, usu.getCorreo());
            ps.setInt(5, usu.getTipo_usuario_permiso());
            ps.setInt(6, usu.getConexion());

            resultado = ps.executeUpdate() == 1;
            ps.close();
            rs = "1";

        } catch (SQLException ex) {
            rs = ex.toString() + "||  metodo ingresar usuario, en DAO usuario";
        }
        return rs;
    }

    
    
    
    public String Conex(int id_usuario, int tipo) {
        Conexion c = new Conexion();
        String rs;
        boolean resultado;
        try {
            //inserto datos del usuario
            Connection con = c.getConnection();
            String query1 = "update usuario set conexion=" + tipo + " where id_usuario=" + id_usuario;
            PreparedStatement ps = con.prepareStatement(query1);
            resultado = ps.executeUpdate() == 1;
            ps.close();
            rs = "1";

        } catch (SQLException ex) {
            rs = ex.toString() + "||  metodo ingresar usuario, en DAO usuario";
        }
        return rs;
    }

      public Usuario buscarUsuarioNombreClave(String nombre, String clave) {
        Conexion c = new Conexion();

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        Usuario usuario = new Usuario();

        try {
            con = c.getConnection();
            String query = "select * from usuario where nom_usuario='" + nombre + "' and clave='" + clave + "'";
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                usuario.setId_usuario(rs.getInt("id_usuario"));
                usuario.setNom_usuario(rs.getString("nom_usuario"));
                usuario.setClave(rs.getString("clave"));
                usuario.setCorreo(rs.getString("correo"));
                usuario.setTipo_usuario_permiso(rs.getInt("permiso"));
                usuario.setConexion(rs.getInt("conexion"));
            }
            ps.close();
            if (usuario.getCorreo() != null) {
                return usuario;
            } else {
                return null;
            }
        } catch (SQLException ex) {
            return null;
        }
    }//fin metodo

    public int buscaridMax() {
        Conexion c = new Conexion();
        int a = 0;
        try {
            Connection con = c.getConnection();
            String query = "select ID_USUARIO from USUARIO where ID_USUARIO= (select max(ID_USUARIO) from USUARIO)";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                a = rs.getInt("id_usuario");
            }
            ps.close();
        } catch (SQLException ex) {
            return 404;
        }
        return a;
    }
    /*
    
     */

}/*fin*/
