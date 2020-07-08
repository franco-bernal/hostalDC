package Modelo.Manejadoras;

import Modelo.DAO.DAOusuario_cli;
import Modelo.Entidades.Usuario;
import Modelo.Entidades.UsuarioCli_detalle;
import java.util.ArrayList;

/**
 *
 * @author Franco
 */
public class Manejadora_cliente {

    DAOusuario_cli dao_det = new DAOusuario_cli();
    Manejadora_usuario mane_usu = new Manejadora_usuario();

    private ArrayList<UsuarioCli_detalle> arrayclien = dao_det.ObtenerClientes();

    public ArrayList<UsuarioCli_detalle> getCliente() {
        return arrayclien;
    }

    public void setArrayCliente(ArrayList<UsuarioCli_detalle> arraycli) {
        this.arrayclien = arraycli;
    }

    /*
    ingresar
     */
    public String ingresarClienteCompleto(Usuario usu, UsuarioCli_detalle det) {
        String nom = usu.getNom_usuario();

        if (mane_usu.verificar(nom) == false) {
            String i = mane_usu.ingresarUsuario(usu);

            if (i.compareToIgnoreCase("1") == 0) {
                return dao_det.ingresarCliente(det);
            } else {
                return i;
            }
        } else {
            return "el usuario ya existe";
        }

    }

    public String obtenerRutUsuario(int id) {
        Usuario u = new Usuario();
        for (int i = 0; i < mane_usu.getUsu().size(); i++) {
            if (id == arrayclien.get(i).getUsuario_id_usuario()) {
                return arrayclien.get(i).getRut_emp();
            }
        }
        return null;
    }

    public int obtenerIdUsuario(String rut) {
        Usuario u = new Usuario();
        for (int i = 0; i < mane_usu.getUsu().size(); i++) {
            if (rut.compareToIgnoreCase(arrayclien.get(i).getRut_emp()) == 0) {
                return arrayclien.get(i).getUsuario_id_usuario();
            }
        }
        return 0;
    }

    public UsuarioCli_detalle obtenerClienteCompleto(String rut) {
        for (int i = 0; i<arrayclien.size(); i++) {
            if (arrayclien.get(i).getRut_emp().compareToIgnoreCase(rut) == 0) {
                 UsuarioCli_detalle u =new UsuarioCli_detalle(arrayclien.get(i).getRut_emp(), arrayclien.get(i).getNom_emp(), arrayclien.get(i).getTele_emp(), arrayclien.get(i).getDir_emp(), arrayclien.get(i).getUsuario_id_usuario());
                 return u;
            }else{
                return null;
            }
        }
        return null;
    }
    
    
    
    
    public String obtenerClienteCompletoStr(String rut) {
        String r = null;
        for (int i = 0; i<arrayclien.size(); i++) {
            if (arrayclien.get(i).getRut_emp().compareToIgnoreCase(rut) == 0) {
                 UsuarioCli_detalle u =new UsuarioCli_detalle(arrayclien.get(i).getRut_emp(), arrayclien.get(i).getNom_emp(), arrayclien.get(i).getTele_emp(), arrayclien.get(i).getDir_emp(), arrayclien.get(i).getUsuario_id_usuario());
                 r= arrayclien.get(i).getNom_emp().toString();
            }else{
                r= "r="+arrayclien.get(i).getRut_emp()+" rut e:"+rut;
            }
        }
        return r;
    }
    
}
