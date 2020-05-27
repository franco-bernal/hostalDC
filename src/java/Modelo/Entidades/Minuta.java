/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Entidades;

import java.sql.Date;

public class Minuta {

    private int id_minuta;
    private Date f_creado;
    private Date f_inicio;
    private Date f_fin;
    private String titulo;
    private String desayuno;
    private String almuerzo;
    private String once;
    private String cena;
    private int valor;
    private int ORDEN_compra_codigo_compra;

    public Minuta() {
    }

    public Minuta(int id_minuta, Date f_creado, Date f_inicio, Date f_fin, String titulo, String desayuno, String almuerzo, String once, String cena, int valor, int ORDEN_compra_codigo_compra) {
        this.id_minuta = id_minuta;
        this.f_creado = f_creado;
        this.f_inicio = f_inicio;
        this.f_fin = f_fin;
        this.titulo = titulo;
        this.desayuno = desayuno;
        this.almuerzo = almuerzo;
        this.once = once;
        this.cena = cena;
        this.valor = valor;
        this.ORDEN_compra_codigo_compra = ORDEN_compra_codigo_compra;
    }

    public int getId_minuta() {
        return id_minuta;
    }

    public void setId_minuta(int id_minuta) {
        this.id_minuta = id_minuta;
    }

    public Date getF_creado() {
        return f_creado;
    }

    public void setF_creado(Date f_creado) {
        this.f_creado = f_creado;
    }

    public Date getF_inicio() {
        return f_inicio;
    }

    public void setF_inicio(Date f_inicio) {
        this.f_inicio = f_inicio;
    }

    public Date getF_fin() {
        return f_fin;
    }

    public void setF_fin(Date f_fin) {
        this.f_fin = f_fin;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDesayuno() {
        return desayuno;
    }

    public void setDesayuno(String desayuno) {
        this.desayuno = desayuno;
    }

    public String getAlmuerzo() {
        return almuerzo;
    }

    public void setAlmuerzo(String almuerzo) {
        this.almuerzo = almuerzo;
    }

    public String getOnce() {
        return once;
    }

    public void setOnce(String once) {
        this.once = once;
    }

    public String getCena() {
        return cena;
    }

    public void setCena(String cena) {
        this.cena = cena;
    }

    public int getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }

    public int getORDEN_compra_codigo_compra() {
        return ORDEN_compra_codigo_compra;
    }

    public void setORDEN_compra_codigo_compra(int ORDEN_compra_codigo_compra) {
        this.ORDEN_compra_codigo_compra = ORDEN_compra_codigo_compra;
    }
    
    

}
