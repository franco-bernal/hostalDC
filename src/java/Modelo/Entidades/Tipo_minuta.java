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
public class Tipo_minuta {
    
    private int id_tipo_minuta;
    private String nom_tipo;
    private int valor_minuta;

    public Tipo_minuta() {
    }

    public Tipo_minuta(int id_tipo_minuta, String nom_tipo, int valor_minuta) {
        this.id_tipo_minuta = id_tipo_minuta;
        this.nom_tipo = nom_tipo;
        this.valor_minuta = valor_minuta;
    }

    public int getId_tipo_minuta() {
        return id_tipo_minuta;
    }

    public void setId_tipo_minuta(int id_tipo_minuta) {
        this.id_tipo_minuta = id_tipo_minuta;
    }

    public String getNom_tipo() {
        return nom_tipo;
    }

    public void setNom_tipo(String nom_tipo) {
        this.nom_tipo = nom_tipo;
    }

    public int getValor_minuta() {
        return valor_minuta;
    }

    public void setValor_minuta(int valor_minuta) {
        this.valor_minuta = valor_minuta;
    }
    
    
}
