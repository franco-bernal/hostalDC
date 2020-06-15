/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.DAO;

import Modelo.Conexion;
import Modelo.Entidades.UsuarioEmpleado;
import Modelo.Entidades.UsuarioProveedor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Franco
 */
public class DAOusuario_empleado {
    
    public String ingresarEmpleado(UsuarioEmpleado emp) {
        Conexion c = new Conexion();
        String rs;
        boolean resultado;
        try {
                //inserto datos del usuario
                Connection con = c.getConnection();
                String query1 = "INSERT INTO empleado VALUES ('"+emp.getRut()+"','"+emp.getNombre()+"','"+emp.getApellido()+"',"+emp.getUSUARIO_id_usuario()+")";
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
            rs = "En metodo /ingresar provedor/DAOusuario_Empleado  || ERROR: "+ex.toString();
        }
        return rs;
    }
    
    
}
