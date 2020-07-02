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
    
    
    
    
       public String ingresarPedidoComoEmpleado(Orden_pedido ord) {
        Conexion c = new Conexion();
        String rs;
        boolean resultado;
        try {
                //inserto datos del usuario
                Connection con = c.getConnection();
                String query1 = "INSERT INTO ORDEN_PEDIDO VALUES ("+ord.getId_pedido()+",'"+ord.getF_emicion()+"','"+ord.getF_recepcion()+"',"+ord.getEstado()+",null,'"+ord.getEmpleado_rut_empleado()+"');";
                PreparedStatement ps = con.prepareStatement(query1);
                ps = con.prepareStatement(query1);
                
                resultado=ps.executeUpdate()==1;
                ps.close();
         
            if (resultado = true) {
                rs = "Se ingreso exitosamente";
            } else {
                rs = "No se pudo ingresar";
            }
        } catch (SQLException ex) {
            rs = ex.toString()+"  en metodo ingresar pedido/DAOorden_pedido "+ord.getId_pedido();
        }
        return rs;
    }
    
       public ArrayList<Orden_pedido> ObtenerPedidos() {
        ArrayList<Orden_pedido> arrayPed = new ArrayList<Orden_pedido>();
        try {
            Conexion c = new Conexion();
            Connection con = c.getConnection();
            String query = "select * from ORDEN_PEDIDO order by id_pedido";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Orden_pedido ped = new Orden_pedido(rs.getInt(1), rs.getDate(2), rs.getDate(3), rs.getInt(4), rs.getString(5),rs.getString(6));
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
                String query1 = "INSERT INTO DETALLE_PEDIDO VALUES ("+detalle.getCantidad()+","+detalle.getORDEN_PEDIDO_id_pedido()+","+detalle.getPRODUCTOS_id_producto()+")";
                PreparedStatement ps = con.prepareStatement(query1);
                ps = con.prepareStatement(query1);
                
                resultado=ps.executeUpdate()==1;
                ps.close();
         
            if (resultado = true) {
                rs = "Se ingreso exitosamente";
            } else {
                rs = "No se pudo ingresar";
            }
        } catch (SQLException ex) {
            rs = ex.toString()+"  en metodo ingresar detalle/DAOproducto ";
        }
        return rs;
    }
    
       public ArrayList<detalle_pedido> ObtenerDetallesPorId(int id) {
        ArrayList<detalle_pedido> arrayDeta = new ArrayList<detalle_pedido>();
        try {
            Conexion c = new Conexion();
            Connection con = c.getConnection();
            String query = "select * from DETALLE_PEDIDO WHERE ORDEN_PEDIDO_ID_PEDIDO="+id+";";
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
    
    
    
}
