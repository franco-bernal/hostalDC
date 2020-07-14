/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Entidades.Habitacion;
import Modelo.Manejadoras.Manejadora_conf;
import Modelo.Manejadoras.Manejadora_hab;
import Modelo.Manejadoras.Manejadora_usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Franco
 */
@WebServlet(name = "C_config", urlPatterns = {"/C_config"})
public class C_config extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        Manejadora_conf maneCo = new Manejadora_conf();
        HttpSession hue = request.getSession();
        hue.setAttribute("per", "Configuraciones de administrador");
        PrintWriter out = response.getWriter();
        String r = "";
        try {
            String accion = request.getParameter("accion");

            if (accion.equals("iva")) {

                int iva = Integer.parseInt(request.getParameter("txt_iva"));
                r = maneCo.actualizarIva(iva);
                if (r.compareToIgnoreCase("true") == 0) {
                    hue.setAttribute("desde", "configuracion.jsp");
                    hue.setAttribute("pag", "configuracion.jsp");
                    hue.setAttribute("titulo", "IVA modificado");
                    hue.setAttribute("detalle", " ");
                    hue.setAttribute("sms", " ");
                    hue.setAttribute("tip", "success");
                    response.sendRedirect("true.jsp");
                }

            }

            if (accion.equals("cod")) {

                int cod = Integer.parseInt(request.getParameter("txt_cod"));
                r = maneCo.actualizarCodigo(cod);
                if (r.compareToIgnoreCase("true") == 0) {
                    hue.setAttribute("desde", "configuracion.jsp");
                    hue.setAttribute("pag", "configuracion.jsp");
                    hue.setAttribute("titulo", "Codigo de seguridad modificado");
                    hue.setAttribute("detalle", " codigo nuevo: " + cod);
                    hue.setAttribute("sms", " ");
                    hue.setAttribute("tip", "success");
                    response.sendRedirect("true.jsp");
                }

            }

            if (accion.equals("meta")) {

                int meta = Integer.parseInt(request.getParameter("txt_meta"));
                r = maneCo.actualizarMeta(meta);
                if (r.compareToIgnoreCase("true") == 0) {
                    hue.setAttribute("desde", "configuracion.jsp");
                    hue.setAttribute("pag", "configuracion.jsp");
                    hue.setAttribute("titulo", "Meta modificada");
                    hue.setAttribute("detalle", "Nueva meta:" + meta);
                    hue.setAttribute("sms", " ");
                    hue.setAttribute("tip", "success");
                    response.sendRedirect("true.jsp");
                }

            }
            if (accion.equals("ingresar_ha")) {
                Manejadora_hab mane_ha = new Manejadora_hab();

                int hab = mane_ha.cant() + 1;
                String accesorio = request.getParameter("txt_acc");
                String tipoA = request.getParameter("select_tipo");
                int tipoC = Integer.parseInt(tipoA.substring(0, 1));

                Habitacion ha = new Habitacion(hab, accesorio, "Mantenimiento", tipoC);
                r = mane_ha.ingresarHabitacion(ha);
                if (r.compareToIgnoreCase("Se ingreso exitosamente") == 0) {
                    hue.setAttribute("desde", "configuracion.jsp");
                    hue.setAttribute("pag", "configuracion.jsp");
                    hue.setAttribute("titulo", "Habitacion agregada");
                    hue.setAttribute("detalle", " ");
                    hue.setAttribute("sms", " ");
                    hue.setAttribute("tip", "success");
                    response.sendRedirect("true.jsp");
                } else {
                    hue.setAttribute("desde", "configuracion.jsp");
                    hue.setAttribute("pag", "configuracion.jsp");
                    hue.setAttribute("titulo", "Error");
                    hue.setAttribute("detalle", "" + r);
                    hue.setAttribute("sms", " " + r);
                    hue.setAttribute("tip", "error");
                    response.sendRedirect("true.jsp");
                }
            }
            if (accion.equals("modificar_ha")) {
                Manejadora_hab mane_ha = new Manejadora_hab();

                String habi = request.getParameter("select_habitacion");
                int hab = Integer.parseInt(habi.substring(0, 2));

                String accesorio = request.getParameter("txt_acc");

                String tipoA = request.getParameter("select_tipo");
                int tipoC = Integer.parseInt(tipoA.substring(0, 1));

                Habitacion ha = new Habitacion(hab, accesorio, "ho", tipoC);
                r = mane_ha.actualizarHabitacion(ha);
                if (r.compareToIgnoreCase("true") == 0) {
                    hue.setAttribute("desde", "configuracion.jsp");
                    hue.setAttribute("pag", "configuracion.jsp");
                    hue.setAttribute("titulo", "Habitacion Modificada");
                    hue.setAttribute("detalle", " hab:°" + hab);
                    hue.setAttribute("sms", " ");
                    hue.setAttribute("tip", "success");
                    response.sendRedirect("true.jsp");
                } else {
                    hue.setAttribute("desde", "configuracion.jsp");
                    hue.setAttribute("pag", "configuracion.jsp");
                    hue.setAttribute("titulo", "Error");
                    hue.setAttribute("detalle", "" + r);
                    hue.setAttribute("sms", " " + r);
                    hue.setAttribute("tip", "error");
                    response.sendRedirect("true.jsp");
                }
            }
            if (accion.equals("modificar_dis")) {
                Manejadora_hab mane_ha = new Manejadora_hab();

                String habi = request.getParameter("select_habitacion");
                int hab = Integer.parseInt(habi.substring(0, 2));

                String dis = request.getParameter("select_dis");

                r = mane_ha.actualizarDisponibilidad0(hab, dis);
                if (r.compareToIgnoreCase("true") == 0) {
                    hue.setAttribute("desde", "configuracion.jsp");
                    hue.setAttribute("pag", "configuracion.jsp");
                    hue.setAttribute("titulo", "Edit:" + dis);
                    hue.setAttribute("detalle", " hab:°" + hab);
                    hue.setAttribute("sms", " ");
                    hue.setAttribute("tip", "success");
                    response.sendRedirect("true.jsp");
                } else {
                    hue.setAttribute("desde", "configuracion.jsp");
                    hue.setAttribute("pag", "configuracion.jsp");
                    hue.setAttribute("titulo", "Error");
                    hue.setAttribute("detalle", "" + r);
                    hue.setAttribute("sms", " " + r);
                    hue.setAttribute("tip", "error");
                    response.sendRedirect("true.jsp");
                }
            }

            if (accion.equals("baja_ha")) {
                Manejadora_hab mane_ha = new Manejadora_hab();

                String habi = request.getParameter("select_habitacion");
                int hab = Integer.parseInt(habi.substring(0, 2));

                String dis = "De baja";

                r = mane_ha.darDeBajaoAlta(hab, dis);
                if (r.compareToIgnoreCase("true") == 0) {
                    hue.setAttribute("desde", "configuracion.jsp");
                    hue.setAttribute("pag", "configuracion.jsp");
                    hue.setAttribute("titulo", "Edit:" + dis);
                    hue.setAttribute("detalle", " hab:°" + hab);
                    hue.setAttribute("sms", " ");
                    hue.setAttribute("tip", "success");
                    response.sendRedirect("true.jsp");
                } else {
                    hue.setAttribute("desde", "configuracion.jsp");
                    hue.setAttribute("pag", "configuracion.jsp");
                    hue.setAttribute("titulo", "Error");
                    hue.setAttribute("detalle", "" + r);
                    hue.setAttribute("sms", " " + r);
                    hue.setAttribute("tip", "error");
                    response.sendRedirect("true.jsp");
                }
            }
            if (accion.equals("alta_ha")) {
                Manejadora_hab mane_ha = new Manejadora_hab();

                String habi = request.getParameter("select_habitacion");
                int hab = Integer.parseInt(habi.substring(0, 2));

                String dis = "De alta";

                r = mane_ha.darDeBajaoAlta(hab, dis);
                if (r.compareToIgnoreCase("true") == 0) {
                    hue.setAttribute("desde", "configuracion.jsp");
                    hue.setAttribute("pag", "configuracion.jsp");
                    hue.setAttribute("titulo", "Edit:" + dis);
                    hue.setAttribute("detalle", " hab:°" + hab);
                    hue.setAttribute("sms", " ");
                    hue.setAttribute("tip", "success");
                    response.sendRedirect("true.jsp");
                } else {
                    hue.setAttribute("desde", "configuracion.jsp");
                    hue.setAttribute("pag", "configuracion.jsp");
                    hue.setAttribute("titulo", "Error");
                    hue.setAttribute("detalle", "" + r);
                    hue.setAttribute("sms", " " + r);
                    hue.setAttribute("tip", "error");
                    response.sendRedirect("true.jsp");
                }
            }

        } catch (Exception e) {
            hue.setAttribute("desde", "configuracion.jsp");
            hue.setAttribute("pag", "configuracion.jsp");
            hue.setAttribute("titulo", "hubo algun problema");
            hue.setAttribute("detalle", "intenta de nuevo más tarde");
            hue.setAttribute("sms", e.toString());
            hue.setAttribute("tip", "error");
            response.sendRedirect("true.jsp");
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
