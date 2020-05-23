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
public class UsuarioCli_detalle {

    private String rut_emp;
    private String nom_emp;
    private String tele_emp;
    private String dir_emp;
    private int usuario_id_usuario;

    public UsuarioCli_detalle() {
    }

    public UsuarioCli_detalle(String rut_emp, String nom_emp, String tele_emp, String dir_emp, int usuario_id_usuario) {
        this.rut_emp = rut_emp;
        this.nom_emp = nom_emp;
        this.tele_emp = tele_emp;
        this.dir_emp = dir_emp;
        this.usuario_id_usuario = usuario_id_usuario;
    }

    public String getRut_emp() {
        return rut_emp;
    }

    public void setRut_emp(String rut_emp) {
        this.rut_emp = rut_emp;
    }

    public String getNom_emp() {
        return nom_emp;
    }

    public void setNom_emp(String nom_emp) {
        this.nom_emp = nom_emp;
    }

    public String getTele_emp() {
        return tele_emp;
    }

    public void setTele_emp(String tele_emp) {
        this.tele_emp = tele_emp;
    }

    public String getDir_emp() {
        return dir_emp;
    }

    public void setDir_emp(String dir_emp) {
        this.dir_emp = dir_emp;
    }

    public int getUsuario_id_usuario() {
        return usuario_id_usuario;
    }

    public void setUsuario_id_usuario(int usuario_id_usuario) {
        this.usuario_id_usuario = usuario_id_usuario;
    }

}
