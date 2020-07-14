/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Manejadoras;

import Modelo.DAO.DAOconfig;
import Modelo.Entidades.Configuracion;
import java.util.ArrayList;

/**
 *
 * @author Franco
 */
public class Manejadora_conf {

    DAOconfig daoCo = new DAOconfig();
    private ArrayList<Configuracion> arrayCo = daoCo.ObtenerConfiguracion();

    public ArrayList<Configuracion> getConfig() {
        return arrayCo;
    }

    public void setArrayConfig(ArrayList<Configuracion> arrayCo) {
        this.arrayCo = arrayCo;
    }

    //--------------------------------------------------------------------------
    public String actualizarIva(int iva) {
        return daoCo.actualizarIva(iva);
    }

    public String actualizarCodigo(int cod) {
        return daoCo.actualizarCodigo(cod);
    }

    public String actualizarMeta(int meta) {
        return daoCo.actualizarMeta(meta);
    }

    

}
