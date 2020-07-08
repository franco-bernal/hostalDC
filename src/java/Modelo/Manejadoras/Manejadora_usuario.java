/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Manejadoras;

import Modelo.DAO.DAOusuario;
import Modelo.DAO.DAOusuario_cli;
import Modelo.Entidades.Usuario;
import Modelo.Entidades.UsuarioCli_detalle;

import java.util.ArrayList;

/**
 *
 * @author Franco
 */
public class Manejadora_usuario {

    DAOusuario daoUsuario = new DAOusuario();
    DAOusuario_cli dao_det = new DAOusuario_cli();

    //cargado con todos los clientes
    private ArrayList<Usuario> arrayUsuario = daoUsuario.ObtenerUsuario();

    public ArrayList<Usuario> getUsu() {
        return arrayUsuario;
    }

    public void setUsuario(ArrayList<Usuario> cli) {
        this.arrayUsuario = cli;
    }

//
//
//
//
//
//
//
//
    //Obtener Usuario
    public Usuario obtenerUsuario(String nom, String clave) {
        Usuario u = new Usuario();
        for (int i = 0; i < arrayUsuario.size(); i++) {
            if (nom.compareToIgnoreCase(arrayUsuario.get(i).getNom_usuario()) == 0 && clave.compareToIgnoreCase(arrayUsuario.get(i).getClave()) == 0) {
                u.setId_usuario(arrayUsuario.get(i).getId_usuario());
                u.setNom_usuario(arrayUsuario.get(i).getNom_usuario());
                u.setClave(arrayUsuario.get(i).getClave());
                u.setCorreo(arrayUsuario.get(i).getCorreo());
                u.setTipo_usuario_permiso(arrayUsuario.get(i).getTipo_usuario_permiso());
                u.setConexion(arrayUsuario.get(i).getConexion());
                return u;
            }
        }
        return null;
    }
    
     public Usuario obtenerUsuarioPorId(int id) {
        Usuario u = new Usuario();
        for (int i = 0; i < arrayUsuario.size(); i++) {
            if (id==arrayUsuario.get(i).getId_usuario()) {
                u.setId_usuario(arrayUsuario.get(i).getId_usuario());
                u.setNom_usuario(arrayUsuario.get(i).getNom_usuario());
                u.setClave(arrayUsuario.get(i).getClave());
                u.setCorreo(arrayUsuario.get(i).getCorreo());
                u.setTipo_usuario_permiso(arrayUsuario.get(i).getTipo_usuario_permiso());
                u.setConexion(arrayUsuario.get(i).getConexion());
                return u;
            }
        }
        return null;
    }
    
     public boolean verificar(String nom) {
        Usuario u = new Usuario();
        for (int i = 0; i < arrayUsuario.size(); i++) {
            if (nom.compareToIgnoreCase(arrayUsuario.get(i).getNom_usuario()) == 0) {
                return true;
            }
        }
        return false;
    }
    
    

    public int idMax() {
        return daoUsuario.buscaridMax();
    }

    public String ingresarUsuario(Usuario usu) {
        return daoUsuario.ingresarUsuario(usu);
    }

    public String Conec(int id,int tipo) {
        if (daoUsuario.Conex(id,tipo) == "1") {
            return "1";
        } else {
            return "0";
        }
    }
    
    
    

}
/*
 */
