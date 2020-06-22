/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Manejadoras;

import Modelo.DAO.DAOhabitacion;
import Modelo.Entidades.Habitacion;
import Modelo.Entidades.Tipo_hab;
import java.util.ArrayList;

/**
 *
 * @author Franco
 */
public class Manejadora_hab {
    
    
      DAOhabitacion dao_ha = new DAOhabitacion();

    private ArrayList<Habitacion> arrayha = dao_ha.ObtenerHabitacion();

    public ArrayList<Habitacion> getHab() {
        return arrayha;
    }

    public void setArrayHab(ArrayList<Habitacion> arrayha) {
        this.arrayha = arrayha;
    }

    
    private ArrayList<Tipo_hab> arraytipo = dao_ha.obtener_tipos_hab();

    public ArrayList<Tipo_hab> getTipo() {
        return arraytipo;
    }

    public void setArrayTipo(ArrayList<Tipo_hab> arraytipo) {
        this.arraytipo = arraytipo;
    }

    
     public int valorHab(int id){
        
        for(int i=0;i<arraytipo.size();i++){
            if(arraytipo.get(i).getId_tipo_hab()==id){
                return arraytipo.get(i).getValor_hab();
            }
        }
        return 0;
    }
    
    
}
