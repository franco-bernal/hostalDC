/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Modelo.Manejadoras.Manejadora_hab;
import Modelo.Manejadoras.Manejadora_minuta;
import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.sql.Date;

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

    public Date fechaHoy() {
        java.util.Date utilDate = new java.util.Date(); //fecha actual
        java.sql.Date hoy = new java.sql.Date(utilDate.getTime());
        return hoy;
    }

    public String cuadroDeAlerta(String titulo, String detalle, String sms, String tipo) {
        //tipos.
        //puede ser |error |success|
        /* ej
        request.setAttribute("desde", "huesped.jsp");
        request.setAttribute("pag", "cliente_home.jsp");
        request.setAttribute("titulo", "Eliminado");
        request.setAttribute("detalle", "Se ha eliminado el" + " codigo");
        request.setAttribute("sms", rs);
        request.setAttribute("tipo", "success");
       RequestDispatcher rd = request.getRequestDispatcher("true.jsp");
                    rd.include(request, response);
         */

        return "<meta http-equiv=”Content-Type” content=”text/html; charset=UTF-8″/>"
                + "<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>"
                + "<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>"
                + "<script>"
                + "$(document).ready(function(){"
                + "swal('" + titulo + ".','" + detalle + ". " + sms + "','" + tipo + "');"
                + "});"
                + "</script>";
    }

    public String quitarEspaciosAlFInal(String a) {
        return a.replaceAll("\\s*$", "");
    }

}
