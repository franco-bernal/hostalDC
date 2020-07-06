/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Manejadoras;

import Modelo.DAO.DAOminuta;
import Modelo.Entidades.Minuta;
import Modelo.Entidades.Tipo_minuta;
import java.util.ArrayList;

/**
 *
 * @author Franco
 */
public class Manejadora_minuta {

    
      DAOminuta dao_mi = new DAOminuta();

    private ArrayList<Minuta> arraymi = dao_mi.ObtenerMinuta();

    public ArrayList<Minuta> getMinuta() {
        return arraymi;
    }

    public void setArrayMin(ArrayList<Minuta> arrayMi) {
        this.arraymi = arrayMi;
    }

    
    private ArrayList<Tipo_minuta> arraytipo = dao_mi.obtener_tipos_Min();

    public ArrayList<Tipo_minuta> getTipo() {
        return arraytipo;
    }

    public void setArrayTipo(ArrayList<Tipo_minuta> arraytipo) {
        this.arraytipo = arraytipo;
    }
    //_-----------------------------------------------------------------
    
    public String ingresarMinuta(Minuta min){
        return dao_mi.ingresarMinuta(min);
    }
    
    
    public int valorMinuta(int id){
        
        for(int i=0;i<arraytipo.size();i++){
            if(arraytipo.get(i).getId_tipo_minuta()==id){
                return arraytipo.get(i).getValor_minuta();
            }
        }
        return 0;
    }
    
    public int max_id_min(){
        return arraymi.size()+1;
    }
    
    public int cambiarNombrePorIdMinuta(String nombre){
        
        for(int i=0;i<arraytipo.size();i++){
            if(arraytipo.get(i).getNom_tipo().compareToIgnoreCase(nombre)==0){
                return arraytipo.get(i).getId_tipo_minuta();
            }
        }
        return 0;
    }
    
    
    
    
}
