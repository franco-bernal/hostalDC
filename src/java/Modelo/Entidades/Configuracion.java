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
public class Configuracion {
    
    public int iva;
    public int cod_seguridad;
    public int meta_visitas;

    public Configuracion() {
    }

    public Configuracion(int iva, int cod_seguridad, int meta_visitas) {
        this.iva = iva;
        this.cod_seguridad = cod_seguridad;
        this.meta_visitas = meta_visitas;
    }

    public int getIva() {
        return iva;
    }

    public void setIva(int iva) {
        this.iva = iva;
    }

    public int getCod_seguridad() {
        return cod_seguridad;
    }

    public void setCod_seguridad(int cod_seguridad) {
        this.cod_seguridad = cod_seguridad;
    }

    public int getMeta_visitas() {
        return meta_visitas;
    }

    public void setMeta_visitas(int meta_visitas) {
        this.meta_visitas = meta_visitas;
    }
    
    
    
    
}
