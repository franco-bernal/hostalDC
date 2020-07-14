/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.DAO;

import Modelo.Conexion;
import Modelo.Entidades.Configuracion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Franco
 */
public class DAOconfig {
    
    
    
     public String actualizarIva(int iva) {
        boolean resultado = false;
        String r = "false";

        try {
            Conexion c = new Conexion();
            Connection con = c.getConnection();

            String query = "update CONFIGURACION set IVA="+iva;
            PreparedStatement ps = con.prepareStatement(query);
            resultado = ps.executeUpdate() == 1;
            r = "true";
            ps.close();

        } catch (SQLException ex) {
            r = "Exception en DAOconfig/actualizarIva";
        }

        return r;
    }
    
     
     
     public String actualizarCodigo(int cod) {
        boolean resultado = false;
        String r = "false";

        try {
            Conexion c = new Conexion();
            Connection con = c.getConnection();

            String query = "update CONFIGURACION set COD_SEGURIDAD="+cod;
            PreparedStatement ps = con.prepareStatement(query);
            resultado = ps.executeUpdate() == 1;
            r = "true";
            ps.close();

        } catch (SQLException ex) {
            r = "Exception en DAOconfig/actualizarCodigo";
        }

        return r;
    }
    
     
     public String actualizarMeta(int meta) {
        boolean resultado = false;
        String r = "false";

        try {
            Conexion c = new Conexion();
            Connection con = c.getConnection();

            String query = "update CONFIGURACION set META_VISITAS="+meta;
            PreparedStatement ps = con.prepareStatement(query);
            resultado = ps.executeUpdate() == 1;
            r = "true";
            ps.close();

        } catch (SQLException ex) {
            r = "Exception en DAOconfig/actualizarMeta";
        }

        return r;
    }
    
      
      
       public ArrayList<Configuracion> ObtenerConfiguracion() {
        ArrayList<Configuracion> arrayCo = new ArrayList<Configuracion>();

        try {
            Conexion c = new Conexion();
            Connection con = c.getConnection();
            String query = "select * from Configuracion";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Configuracion co = new Configuracion(rs.getInt(1), rs.getInt(2),rs.getInt(3));
                arrayCo.add(co);
            }
            ps.close();
            return arrayCo;
        } catch (SQLException ex) {
            return null;
        }
    }

    
    
    
    
    
}
