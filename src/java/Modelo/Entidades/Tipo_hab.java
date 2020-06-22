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
public class Tipo_hab {
   
    private int id_tipo_hab;
    private String nom_tipo;
    private int valor_hab;

    public Tipo_hab() {
    }

    public Tipo_hab(int id_tipo_hab, String nom_tipo, int valor_hab) {
        this.id_tipo_hab = id_tipo_hab;
        this.nom_tipo = nom_tipo;
        this.valor_hab = valor_hab;
    }

    public int getId_tipo_hab() {
        return id_tipo_hab;
    }

    public void setId_tipo_hab(int id_tipo_hab) {
        this.id_tipo_hab = id_tipo_hab;
    }

    public String getNom_tipo() {
        return nom_tipo;
    }

    public void setNom_tipo(String nom_tipo) {
        this.nom_tipo = nom_tipo;
    }

    public int getValor_hab() {
        return valor_hab;
    }

    public void setValor_hab(int valor_hab) {
        this.valor_hab = valor_hab;
    }
    
    
    
}
