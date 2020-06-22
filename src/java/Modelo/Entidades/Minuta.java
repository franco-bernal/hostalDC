/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Entidades;

import java.sql.Date;

public class Minuta {

    private int id_minuta;
        private String titulo;
    private Date f_creado;
    private String detalle;
    private int id_tipo_min;
  

    public Minuta() {
    }

    public Minuta(int id_minuta, String titulo, Date f_creado, String detalle, int id_tipo_min) {
        this.id_minuta = id_minuta;
        this.titulo = titulo;
        this.f_creado = f_creado;
        this.detalle = detalle;
        this.id_tipo_min = id_tipo_min;
    }

    public int getId_minuta() {
        return id_minuta;
    }

    public void setId_minuta(int id_minuta) {
        this.id_minuta = id_minuta;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public Date getF_creado() {
        return f_creado;
    }

    public void setF_creado(Date f_creado) {
        this.f_creado = f_creado;
    }

    public String getDetalle() {
        return detalle;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }

    public int getId_tipo_min() {
        return id_tipo_min;
    }

    public void setId_tipo_min(int id_tipo_min) {
        this.id_tipo_min = id_tipo_min;
    }

    
    
    

}
