/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Manejadoras;

import Modelo.DAO.DAOusuario_empleado;
import Modelo.Entidades.Usuario;
import Modelo.Entidades.UsuarioEmpleado;

/**
 *
 * @author Franco
 */
public class Manejadora_empleado {

    DAOusuario_empleado dao_emp = new DAOusuario_empleado();
    Manejadora_usuario mane_usu = new Manejadora_usuario();

    /*
    ingresar
     */

    public String ingresarEmpleadoCompleto(Usuario usu, UsuarioEmpleado emp) {
        String nom = usu.getNom_usuario();
        String clave = usu.getClave();


        if (mane_usu.verificar(nom) == false) {
            
                    String i = mane_usu.ingresarUsuario(usu);

            if (i.compareToIgnoreCase("1") == 0) {
                return dao_emp.ingresarEmpleado(emp);
            } else {
                return i;
            }
            
            
        } else {
            return "el usuario ya existe";
        }

    }

}
