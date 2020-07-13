/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Manejadoras;

import Modelo.DAO.DAOvisitas;
import Modelo.Entidades.Visitas;
import Modelo.Entidades.Visitas_aux;
import Modelo.Util;
import java.util.ArrayList;

/**
 *
 * @author Franco
 */
public class Manejadora_visitas {

    Util util = new Util();

    DAOvisitas dao_vi = new DAOvisitas();

    private ArrayList<Visitas> arrayVi = dao_vi.ObtenerVisita();

    public ArrayList<Visitas> getVisita() {
        return arrayVi;
    }

    public void setArrayVisita(ArrayList<Visitas> arrayVi) {
        this.arrayVi = arrayVi;
    }

    /*
    ingresar
     */
    public String ingresarVisita(Visitas vi) {
        if (vi != null) {
            return dao_vi.ingresarVisitas(vi);
        } else {
            return "null";
        }
    }
    
    
    public ArrayList<Visitas_aux> ObtenerVisitaPorMes() {
        return dao_vi.ObtenerVisitaPorMes();
    }
    
    
}