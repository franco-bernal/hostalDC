/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Modelo.Manejadoras.Manejadora_hab;
import Modelo.Manejadoras.Manejadora_minuta;

/**
 *
 * @author Franco
 */
public class Util {

    public int id_hab(String ha) {
        Manejadora_hab ma_ha = new Manejadora_hab();
        for (int i = 0; i < ma_ha.getTipo().size(); i++) {
            if (ma_ha.getTipo().get(i).getNom_tipo().compareToIgnoreCase(ha) == 0) {
                return ma_ha.getTipo().get(i).getId_tipo_hab();
            }
        }
        return 404;
    }

    public int id_min(String co) {
        Manejadora_minuta ma_mi = new Manejadora_minuta();
        for (int i = 0; i < ma_mi.getTipo().size(); i++) {
            if (ma_mi.getTipo().get(i).getNom_tipo().compareToIgnoreCase(co) == 0) {
                return ma_mi.getTipo().get(i).getId_tipo_minuta();
            }
        }
        return 404;
    }

    public String tipo_min_nom(int co) {
        Manejadora_minuta ma_mi = new Manejadora_minuta();
        for (int i = 0; i < ma_mi.getTipo().size(); i++) {
            if (ma_mi.getTipo().get(i).getId_tipo_minuta() == co) {
                return ma_mi.getTipo().get(i).getNom_tipo();
            }
        }
        return "";
    }

    public String tipo_hab_nom(int ha) {
        Manejadora_hab ma_ha = new Manejadora_hab();
        for (int i = 0; i < ma_ha.getTipo().size(); i++) {
            if (ma_ha.getTipo().get(i).getId_tipo_hab() == ha) {
                return ma_ha.getTipo().get(i).getNom_tipo();
            }
        }
        return "";
    }
}
