/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.DAO;

import Modelo.Conexion;
import Modelo.Entidades.Factura;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Franco
 */
public class DAOfacturas {
    
    
      public String ingresarFactura(Factura fac) {
        Conexion c = new Conexion();
        String rs;
        boolean resultado;
        try {
            //inserto datos de la orden
            Connection con = c.getConnection();
            String query1 = "INSERT INTO factura VALUES (?,?,?)";
            PreparedStatement ps = con.prepareStatement(query1);
            ps = con.prepareStatement(query1);
            ps.setInt(1, fac.getCod_factura());
            ps.setInt(2, fac.getValor_total());
            ps.setDate(3, fac.getF_emicion());

            resultado = ps.executeUpdate() == 1;
            ps.close();

            if (resultado = true) {
                rs = "Se ingreso exitosamente";
            } else {
                rs = "No se pudo ingresar";
            }
        } catch (SQLException ex) {
            rs = ex.toString() + "  en metodo ingresar factura, DAOfactura";
        }
        return rs;
    }

    public ArrayList<Factura> ObtenerFacturas() {
        ArrayList<Factura> arrayFac = new ArrayList<Factura>();
        try {
            Conexion c = new Conexion();
            Connection con = c.getConnection();
            String query = "select * from Factura order by cod_factura";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Factura fac = new Factura(rs.getInt(1), rs.getInt(2), rs.getDate(3));
                arrayFac.add(fac);
            }
            ps.close();
            return arrayFac;
        } catch (SQLException ex) {
            return null;
        }
    }

   

    public String eliminarFactura(int codigo) {
        boolean resultado = false;
        String r = "false";

        try {
            Conexion c = new Conexion();
            Connection con = c.getConnection();

            String query = "delete from factura where cod_factura=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, codigo);
            resultado = ps.executeUpdate() == 1;
            r = "true";
            ps.close();

        } catch (SQLException ex) {
            r = ex.toString();
        }

        return r;
    }

    
}
