/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.DAO;

import Modelo.Conexion;
import Modelo.Entidades.Habitacion;
import Modelo.Entidades.Tipo_hab;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Franco
 */
public class DAOhabitacion {

    public String ingresarHabitacion(Habitacion ha) {
        Conexion c = new Conexion();
        String rs;
        boolean resultado;
        try {
            //inserto datos del usuario
            Connection con = c.getConnection();
            String query1 = "INSERT INTO habitacion VALUES (?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query1);
            ps = con.prepareStatement(query1);
            ps.setInt(1, ha.getNum_hab());
            ps.setString(2, ha.getAccesorio());
            ps.setString(3, ha.getDisponibilidad());
            ps.setInt(4, ha.getTIPO_HAB_id_tipo_hab());
            resultado = ps.executeUpdate() == 1;
            ps.close();

            if (resultado = true) {
                rs = "Se ingreso exitosamente";
            } else {
                rs = "No se pudo ingresar";
            }
        } catch (SQLException ex) {
            rs = "En metodo ingresar habitacion, DAOhabitacion  .. ERROR: " + ex.toString();
        }
        return rs;
    }

    
    public ArrayList<Habitacion> ObtenerHabitacion() {
        ArrayList<Habitacion> arrayHab = new ArrayList<Habitacion>();
        try {
            Conexion c = new Conexion();
            Connection con = c.getConnection();
            String query = "select * from habitacion";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Habitacion hab = new Habitacion(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
                arrayHab.add(hab);
            }
            ps.close();
            return arrayHab;
        } catch (SQLException ex) {
            return null;
        }
    }

     public ArrayList<Tipo_hab> obtener_tipos_hab() {
        ArrayList<Tipo_hab> arraytipo = new ArrayList<Tipo_hab>();
        try {
            Conexion c = new Conexion();
            Connection con = c.getConnection();
            String query = "select * from tipo_hab order by ID_TIPO_HAB";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Tipo_hab tipo = new Tipo_hab(rs.getInt(1), rs.getString(2),rs.getInt(3));
                arraytipo.add(tipo);
            }
            ps.close();
            return arraytipo;
        } catch (SQLException ex) {
            return null;
        }
    }
    
    
}
