/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.DAO;

import Modelo.Conexion;
import Modelo.Entidades.Habitacion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
            String query1 = "INSERT INTO habitacion VALUES (?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query1);
            ps = con.prepareStatement(query1);
            ps.setInt(1, ha.getNum_hab());
            ps.setString(2, ha.getTipo_cama());
            ps.setInt(3, ha.getPrecio());
            ps.setString(4, ha.getAccesorio());
            ps.setString(5, ha.getDisponibilidad());
            ps.setInt(6, ha.getORDEN_compra_codigo_compra());
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

}
