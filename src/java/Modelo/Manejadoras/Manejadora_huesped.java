/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Manejadoras;

import Modelo.DAO.DAOhuesped;
import Modelo.DAO.DAOorden_compra;
import Modelo.Entidades.Huesped;
import java.util.ArrayList;

/**
 *
 * @author Franco
 */
public class Manejadora_huesped {

    DAOhuesped daoHuesped = new DAOhuesped();
    DAOorden_compra daoOrden = new DAOorden_compra();
    private ArrayList<Huesped> arrayHuesped = daoHuesped.ObtenerHuespedes();

    public ArrayList<Huesped> getHuesped() {
        return arrayHuesped;
    }

    public void setArrayHuesped(ArrayList<Huesped> arrayHuesped) {
        this.arrayHuesped = arrayHuesped;
    }

    public String ingresarHuesped(Huesped hue) {
        DAOhuesped dao_hue = new DAOhuesped();
        return dao_hue.ingresarHuesped(hue);
    }

    public ArrayList<Huesped> mostrarHuespedesCod(int codigo) {
        String rut;
        String nombre;
        String apellido;
        int cod;
        int hab;
        for (int i = 0; i < arrayHuesped.size(); i++) {
            if (arrayHuesped.get(i).getORDEN_compra_codigo_compra() == codigo) {
                rut = arrayHuesped.get(i).getRut();
                nombre = arrayHuesped.get(i).getNombre();
                apellido = arrayHuesped.get(i).getApellido();
                cod = arrayHuesped.get(i).getORDEN_compra_codigo_compra();
                hab = arrayHuesped.get(i).getHABITACION_num_hab();
                Huesped hue = new Huesped(rut, nombre, apellido, cod, hab);
                arrayHuesped.add(hue);
            }
        }
        return arrayHuesped;
    }

    public String cancelar(int codigo) {
        String rs, res;

        try {
            res = daoHuesped.limpiarHuespedes(codigo);
            rs = daoOrden.eliminarCompra(codigo);
            if (rs == "true" && res == "true") {
                return "realizado";
            }

        } catch (Exception e) {
            return e.toString();
        }
        return String.valueOf(rs) + " " + String.valueOf(res);
    }

}
