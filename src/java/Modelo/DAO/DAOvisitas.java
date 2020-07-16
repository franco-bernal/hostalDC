/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.DAO;

import Modelo.Conexion;
import Modelo.Entidades.Visitas;
import Modelo.Entidades.Visitas_aux;
import Modelo.Util;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Franco
 */
public class DAOvisitas {
 
    
    
      public String ingresarVisitas(Visitas vi) {
        Conexion c = new Conexion();
        String rs;
        boolean resultado;
        try {
                //inserto datos del usuario
                Connection con = c.getConnection();
                String query1 = "INSERT INTO visitas VALUES (?,?)";
                PreparedStatement ps = con.prepareStatement(query1);
                ps = con.prepareStatement(query1);
                ps.setInt(1, vi.getCantidad());
                ps.setDate(2, vi.getFecha());
                resultado=ps.executeUpdate()==1;
                ps.close();
         
            if (resultado = true) {
                rs = "true";
            } else {
                rs = "false";
            }
        } catch (SQLException ex) {
            rs = "En metodo ingresar visita, DAOvisitas";
        }
        return rs;
    }
      
      
       public ArrayList<Visitas> ObtenerVisita() {
        ArrayList<Visitas> arrayVi = new ArrayList<Visitas>();

        try {
            Conexion c = new Conexion();
            Connection con = c.getConnection();
            String query = "select * from visitas ORDER BY fecha ASC";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Visitas vi = new Visitas(rs.getInt(1), rs.getDate(2));
                arrayVi.add(vi);
            }
            ps.close();
            return arrayVi;
        } catch (SQLException ex) {
            return null;
        }
    }

       
        public ArrayList<Visitas_aux> ObtenerVisitaPorMes() {
        ArrayList<Visitas_aux> arrayVi = new ArrayList<Visitas_aux>();

        try {
            Conexion c = new Conexion();
            Connection con = c.getConnection();
            String query = "select sum(CANTIDAD), TO_CHAR(FECHA,'Mon') from VISITAS group by  TO_CHAR(FECHA,'Mon')";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Visitas_aux vi = new Visitas_aux(rs.getInt(1), rs.getString(2));
                arrayVi.add(vi);
            }
            ps.close();
            return arrayVi;
        } catch (SQLException ex) {
            return null;
        }
    }

    
    
    
    
    
}
