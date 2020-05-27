/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Manejadoras;

import Modelo.DAO.DAOhuesped;
import Modelo.Entidades.Huesped;
import java.util.ArrayList;


/**
 *
 * @author Franco
 */
public class Manejadora_huesped {
    DAOhuesped daoHuesped = new DAOhuesped();
    private ArrayList<Huesped> arrayUsuario = daoHuesped.ObtenerHuesped();

    
    public ArrayList<Huesped> getArrayUsuario() {
        return arrayUsuario;
    }

    public void setArrayUsuario(ArrayList<Huesped> arrayUsuario) {
        this.arrayUsuario = arrayUsuario;
    }
    
    public String ingresarHuesped(Huesped hue) {
        DAOhuesped dao_hue = new DAOhuesped();
                return dao_hue.ingresarHuesped(hue);
    }
    
}
