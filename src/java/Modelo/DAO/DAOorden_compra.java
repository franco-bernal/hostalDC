/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.DAO;

import Modelo.Conexion;
import Modelo.Entidades.Orden_compra;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Franco
 */
public class DAOorden_compra {

    public String ingresarOrden(Orden_compra ord) {
        Conexion c = new Conexion();
        String rs;
        boolean resultado;
        try {
            //inserto datos de la orden
            Connection con = c.getConnection();
            String query1 = "INSERT INTO ORDEN_compra VALUES (?,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query1);
            ps = con.prepareStatement(query1);
            ps.setInt(1, ord.getCodigo_compra());
            ps.setDate(2, ord.getF_inicio());
            ps.setDate(3, ord.getF_fin());
            ps.setDate(4, ord.getF_compra());
            ps.setInt(5, ord.getCantidad());
            ps.setInt(6, ord.getPrecio_total());
            ps.setInt(7, ord.getFACTURA_cod_factura());
            ps.setString(8, ord.getCliente_rut_emp());

            resultado = ps.executeUpdate() == 1;
            ps.close();

            if (resultado = true) {
                rs = "Se ingreso exitosamente";
            } else {
                rs = "No se pudo ingresar";
            }
        } catch (SQLException ex) {
            rs = ex.toString() + "  en metodo ingresar orden, DAOorden_compra " + ord.getCodigo_compra() + " n/ " + ord.getCliente_rut_emp();
        }
        return rs;
    }
}
