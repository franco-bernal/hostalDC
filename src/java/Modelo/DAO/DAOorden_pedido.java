/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.DAO;

import Modelo.Conexion;
import Modelo.Entidades.Orden_pedido;
import Modelo.Entidades.detalle_pedido;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Franco
 */
public class DAOorden_pedido {

    public String ingresarPedido(Orden_pedido ord) {
        Conexion c = new Conexion();
        String rs;
        boolean resultado;
        try {
            //inserto datos del usuario
            Connection con = c.getConnection();
            String query1 = "INSERT INTO orden_pedido VALUES (?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query1);
            ps.setInt(1, ord.getId_pedido());
            ps.setDate(2, ord.getF_emicion());
            ps.setDate(3, ord.getF_recepcion());
            ps.setInt(4, ord.getEstado());
            ps.setString(5, ord.getProveedor_rut());
            ps.setString(6, ord.getEmpleado_rut_empleado());

            resultado = ps.executeUpdate() == 1;
            ps.close();
            rs = "1";

        } catch (SQLException ex) {
            rs = ex.toString() + "||  metodo ingresar usuario, en DAO usuario";
        }
        return rs;
    }

    public ArrayList<Orden_pedido> ObtenerPedidos() {
        ArrayList<Orden_pedido> arrayPed = new ArrayList<Orden_pedido>();
        try {
            Conexion c = new Conexion();
            Connection con = c.getConnection();
            String query = "select * from ORDEN_PEDIDO order by ESTADO desc";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Orden_pedido ped = new Orden_pedido(rs.getInt(1), rs.getDate(2), rs.getDate(3), rs.getInt(4), rs.getString(5), rs.getString(6));
                arrayPed.add(ped);
            }
            ps.close();
            return arrayPed;
        } catch (SQLException ex) {
            return null;
        }
    }

    public String ingresarCantidad(detalle_pedido detalle) {
        Conexion c = new Conexion();
        String rs;
        boolean resultado;
        try {
            //inserto datos del usuario
            Connection con = c.getConnection();
            String query1 = "INSERT INTO DETALLE_PEDIDO VALUES (" + detalle.getCantidad() + "," + detalle.getORDEN_PEDIDO_id_pedido() + "," + detalle.getPRODUCTOS_id_producto() + ")";
            PreparedStatement ps = con.prepareStatement(query1);
            ps = con.prepareStatement(query1);

            resultado = ps.executeUpdate() == 1;
            ps.close();

            if (resultado = true) {
                rs = "Se ingreso exitosamente";
            } else {
                rs = "No se pudo ingresar";
            }
        } catch (SQLException ex) {
            rs = ex.toString() + "  en metodo ingresar detalle/DAOproducto ";
        }
        return rs;
    }

    public ArrayList<detalle_pedido> ObtenerDetalles() {
        ArrayList<detalle_pedido> arrayDeta = new ArrayList<detalle_pedido>();
        try {
            Conexion c = new Conexion();
            Connection con = c.getConnection();
            String query = "select * from DETALLE_PEDIDO";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                detalle_pedido det = new detalle_pedido(rs.getInt(1), rs.getInt(2), rs.getInt(3));
                arrayDeta.add(det);
            }
            ps.close();
            return arrayDeta;
        } catch (SQLException ex) {
            return null;
        }
    }

    /////////////////////////////////////////////
    /////////////////////////////////////////////
    /////////////////////////////////////////////
    /////////////////////////////////////////////
    public String eliminarPedido(int id) {
        boolean resultado = false;
        String r = "false";

        try {
            Conexion c = new Conexion();
            Connection con = c.getConnection();

            String query = "delete from ORDEN_PEDIDO where ID_PEDIDO=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            resultado = ps.executeUpdate() == 1;
            r = "true";
            ps.close();

        } catch (SQLException ex) {
            r = ex.toString();
        }

        return r;
    }

    public String limpiarProductos(int id) {
        boolean resultado = false;
        String r = "false";

        try {
            Conexion c = new Conexion();
            Connection con = c.getConnection();

            String query = "delete from DETALLE_PEDIDO where ORDEN_PEDIDO_ID_PEDIDO=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            resultado = ps.executeUpdate() == 1;
            r = "true";
            ps.close();

        } catch (SQLException ex) {
            r = "Exception en DAOorden_compra/limpiarProductos err:" + ex.toString() + " fin/.";
        }

        return r;
    }

    public String actualizarEstado(int estado, int id) {
        boolean resultado = false;
        String r = "false";

        try {
            Conexion c = new Conexion();
            Connection con = c.getConnection();

            String query = "update ORDEN_PEDIDO set ESTADO="+estado+" WHERE ID_PEDIDO="+id+" ";
            PreparedStatement ps = con.prepareStatement(query);
            resultado = ps.executeUpdate() == 1;
            r = "true";
            ps.close();

        } catch (SQLException ex) {
            r = "Exception en DAOorden_compra/actualizarEstado err:" + ex.toString() + " fin/.";
        }
        
        return r;
        
    }

    }
