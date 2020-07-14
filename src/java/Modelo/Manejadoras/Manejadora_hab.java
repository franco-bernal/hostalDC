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
    
    public String obtenerTipoHab(int id){
        for(int i=0;i<arraytipo.size();i++){
            if(id==arraytipo.get(i).getId_tipo_hab())
                return arraytipo.get(i).getNom_tipo();
        }
        return "";
    }
    
    public String ingresarHabitacion(Habitacion ha) {
        return dao_ha.ingresarHabitacion(ha);
    }
    
    public int cant() {
        ArrayList<Habitacion> arrayh = dao_ha.ObtenerHabitacion();
        int a=0;
        for(int i=0;i<arrayh.size();i++){
            a+=1;
        }
        return a;
    }
    
    
     public String actualizarHabitacion(Habitacion ha) {
         return dao_ha.actualizarHabitacion(ha);
     }
 
     public String actualizarDisponibilidad0(int hab,String dis) {
         return dao_ha.actualizarDisponibilidad0(hab, dis);
     }
     
    public String darDeBajaoAlta(int hab,String dis){
        return  dao_ha.darDeBajaoAlta(hab, dis);
    }
    
}