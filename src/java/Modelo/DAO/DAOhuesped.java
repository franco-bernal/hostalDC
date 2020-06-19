/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.DAO;

import Modelo.Conexion;
import Modelo.Entidades.Huesped;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Franco
 */
public class DAOhuesped {

    public String ingresarHuesped(Huesped hue) {
        Conexion c = new Conexion();
        String rs;
        boolean resultado;
        try {
            //inserto datos del usuario
            Connection con = c.getConnection();
            String query1 = "INSERT INTO huesped VALUES (?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query1);
            ps = con.prepareStatement(query1);
            ps.setString(1, hue.getRut());
            ps.setString(2, hue.getNombre());
            ps.setString(3, hue.getApellido());
            ps.setInt(4, hue.getORDEN_compra_codigo_compra());
            ps.setInt(5, hue.getHABITACION_num_hab());

            resultado = ps.executeUpdate() == 1;
            ps.close();

            if (resultado = true) {
                rs = "Se ingreso exitosamente";
            } else {
                rs = "No se pudo ingresar";
            }
        } catch (SQLException ex) {
            rs = "En metodo ingresar huesped, DAOhuesped  rut:" + hue.getRut() + " ERROR: " + ex.toString();
        }
        return rs;
    }

    public ArrayList<Huesped> ObtenerHuespedes() {
        ArrayList<Huesped> hueArray = new ArrayList<Huesped>();
        try {
            Conexion c = new Conexion();
            Connection con = c.getConnection();
            String query = "select * from huesped";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Huesped hue = new Huesped(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5));
                hueArray.add(hue);
            }
            ps.close();
            return hueArray;
        } catch (SQLException ex) {
            return null;
        }
    }

    public String eliminarHuesped(String rut) {
        boolean resultado = false;
        String r="false";
        try {
            Conexion c = new Conexion();
            Connection con = c.getConnection();

            String query = "delete from huesped where rut ='"+rut+"'";
            PreparedStatement ps = con.prepareStatement(query);
            resultado = ps.executeUpdate() == 1;
            ps.close();
            r="true";
        } catch (SQLException ex) {
            r="Exception en DAOhuesped/eliminarHuesped Error:"+ex.toString()+" Fin/.";
        }

        return r;
    }

    
    public String limpiarHuespedes(int codigo) {
       boolean resultado = false;
        String r="false";

        try {
            Conexion c = new Conexion();
            Connection con = c.getConnection();

            String query = "delete from huesped where ORDEN_COMPRA_CODIGO_COMPRA="+codigo;
            PreparedStatement ps = con.prepareStatement(query);
            resultado = ps.executeUpdate() == 1;
            r="true";
            ps.close();

        } catch (SQLException ex) {
            r=ex.toString();
        }

        return r;
    }

}
