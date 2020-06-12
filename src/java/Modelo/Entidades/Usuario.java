package Modelo.Entidades;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Usuario {
    
     private int id_usuario;
    private String nom_usuario;
    private String clave;
    private String correo;
    private int tipo_usuario_permiso;
    private int conexion;

    public Usuario() {
    }

    public Usuario(int id_usuario, String nom_usuario, String clave, String correo, int tipo_usuario_permiso, int conexion) {
        this.id_usuario = id_usuario;
        this.nom_usuario = nom_usuario;
        this.clave = clave;
        this.correo = correo;
        this.tipo_usuario_permiso = tipo_usuario_permiso;
        this.conexion = conexion;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getNom_usuario() {
        return nom_usuario;
    }

    public void setNom_usuario(String nom_usuario) {
        this.nom_usuario = nom_usuario;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public int getTipo_usuario_permiso() {
        return tipo_usuario_permiso;
    }

    public void setTipo_usuario_permiso(int tipo_usuario_permiso) {
        this.tipo_usuario_permiso = tipo_usuario_permiso;
    }

    public int getConexion() {
        return conexion;
    }

    public void setConexion(int conexion) {
        this.conexion = conexion;
    }


}