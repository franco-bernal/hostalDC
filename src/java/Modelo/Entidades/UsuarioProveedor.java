package Modelo.Entidades;

public class UsuarioProveedor {

private String rut;
private String nom_empresa;
private String rubro;
private int USUARIO_id_usuario;

    public UsuarioProveedor() {
    }

    public UsuarioProveedor(String rut, String nom_empresa, String rubro, int USUARIO_id_usuario) {
        this.rut = rut;
        this.nom_empresa = nom_empresa;
        this.rubro = rubro;
        this.USUARIO_id_usuario = USUARIO_id_usuario;
    }

    public String getRut() {
        return rut;
    }

    public void setRut(String rut) {
        this.rut = rut;
    }

    public String getNom_empresa() {
        return nom_empresa;
    }

    public void setNom_empresa(String nom_empresa) {
        this.nom_empresa = nom_empresa;
    }

    public String getRubro() {
        return rubro;
    }

    public void setRubro(String rubro) {
        this.rubro = rubro;
    }

    public int getUSUARIO_id_usuario() {
        return USUARIO_id_usuario;
    }

    public void setUSUARIO_id_usuario(int USUARIO_id_usuario) {
        this.USUARIO_id_usuario = USUARIO_id_usuario;
    }

    
}
