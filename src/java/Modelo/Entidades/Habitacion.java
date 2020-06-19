/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Entidades;

/**
 *
 * @author Franco
 */
public class Habitacion {
    
    private int num_hab;
    private String accesorio;
    private String disponibilidad;
    private int TIPO_HAB_id_tipo_hab;
            
    public Habitacion() {
    }

    public Habitacion(int num_hab, String accesorio, String disponibilidad,  int TIPO_HAB_id_tipo_hab) {
        this.num_hab = num_hab;
        this.accesorio = accesorio;
        this.disponibilidad = disponibilidad;
        this.TIPO_HAB_id_tipo_hab = TIPO_HAB_id_tipo_hab;
    }

    public int getNum_hab() {
        return num_hab;
    }

    public void setNum_hab(int num_hab) {
        this.num_hab = num_hab;
    }

    public String getAccesorio() {
        return accesorio;
    }

    public void setAccesorio(String accesorio) {
        this.accesorio = accesorio;
    }

    public String getDisponibilidad() {
        return disponibilidad;
    }

    public void setDisponibilidad(String disponibilidad) {
        this.disponibilidad = disponibilidad;
    }

    public int getTIPO_HAB_id_tipo_hab() {
        return TIPO_HAB_id_tipo_hab;
    }

    public void setTIPO_HAB_id_tipo_hab(int TIPO_HAB_id_tipo_hab) {
        this.TIPO_HAB_id_tipo_hab = TIPO_HAB_id_tipo_hab;
    }

    
    
}
