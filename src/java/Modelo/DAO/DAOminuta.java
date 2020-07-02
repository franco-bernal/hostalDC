/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.DAO;

import Modelo.Conexion;
import Modelo.Entidades.Minuta;
import Modelo.Entidades.Tipo_minuta;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Franco
 */
public class DAOminuta {

    public String ingresarMinuta(Minuta mi) {
        Conexion c = new Conexion();
        String rs;
        boolean resultado;
        try {
            //inserto datos del usuario
            Connection con = c.getConnection();
            String query1 = "INSERT INTO Minuta VALUES (?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query1);
            ps = con.prepareStatement(query1);
            ps.setInt(1, mi.getId_minuta());
            ps.setString(2, mi.getTitulo());
            ps.setDate(3, mi.getF_creado());
            ps.setString(4, mi.getDetalle());
            ps.setInt(5, mi.getId_tipo_min());

            resultado = ps.executeUpdate() == 1;
            ps.close();

            if (resultado = true) {
                rs = "Se ingreso exitosamente";
            } else {
                rs = "No se pudo ingresar";
            }
        } catch (SQLException ex) {
            rs = "En metodo ingresar Minuta, DAOMinuta  .. ERROR: " + ex.toString();
        }
        return rs;
    }

    public ArrayList<Minuta> ObtenerMinuta() {
        ArrayList<Minuta> arrayMin = new ArrayList<Minuta>();
        try {
            Conexion c = new Conexion();
            Connection con = c.getConnection();
            String query = "select * from Minuta";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Minuta min = new Minuta(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4),rs.getInt(5));
                arrayMin.add(min);
            }
            ps.close();
            return arrayMin;
        } catch (SQLException ex) {
            return null;
        }
    }

    public ArrayList<Tipo_minuta> obtener_tipos_Min() {
        ArrayList<Tipo_minuta> arrayTipo = new ArrayList<Tipo_minuta>();
        try {
            Conexion c = new Conexion();
            Connection con = c.getConnection();
            String query = "select * from TIPO_MINUTA ORDER by ID_TIPO_MIN";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Tipo_minuta tipo = new Tipo_minuta(rs.getInt(1), rs.getString(2), rs.getInt(3));
                arrayTipo.add(tipo);
            }
            ps.close();
            return arrayTipo;
        } catch (SQLException ex) {
            return null;
        }
    }

}
