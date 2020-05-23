/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Manejadoras;

import Modelo.DAO.DAOusuario_cli;
import Modelo.DAO.DAOusuario_proveedor;
import Modelo.Entidades.Usuario;
import Modelo.Entidades.UsuarioCli_detalle;
import Modelo.Entidades.UsuarioProveedor;

/**
 *
 * @author Franco
 */
public class Manejadora_proveedor {

    DAOusuario_proveedor dao_pro = new DAOusuario_proveedor();
    Manejadora_usuario mane_usu = new Manejadora_usuario();

    /*
    ingresar
     */

    public String ingresarProveedorCompleto(Usuario usu, UsuarioProveedor pro) {
        String nom = usu.getNom_usuario();
        String clave = usu.getClave();

        String i = mane_usu.ingresarUsuario(usu);

        if (mane_usu.obtenerUsuario(nom, clave) == null) {
            if (i.compareToIgnoreCase("1") == 0) {
                return dao_pro.ingresarProveedor(pro);
            } else {
                return i;
            }
        } else {
            return "el usuario ya existe";
        }

    }

}
