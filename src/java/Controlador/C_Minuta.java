/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Entidades.Minuta;
import Modelo.Manejadoras.Manejadora_minuta;
import Modelo.Util;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "C_Minuta", urlPatterns = {"/C_Minuta"})
public class C_Minuta extends HttpServlet {

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
        PrintWriter out = response.getWriter();

        String accion = request.getParameter("accion");

        if (accion.equals("RegistrarMin")) {
            try {
                HttpSession rs = request.getSession();
                Manejadora_minuta mane_min = new Manejadora_minuta();
                Util util = new Util();

                String titulo = request.getParameter("txt_titulo");
                String detalle = request.getParameter("txt_detalle");
                String selected = request.getParameter("select_min");
                int tipo = mane_min.cambiarNombrePorIdMinuta(selected);
                out.print(titulo + "-" + detalle + "-" + selected);

                Minuta min = new Minuta(mane_min.max_id_min(), titulo, util.fechaHoy(), detalle, tipo);
                String respuesta=mane_min.ingresarMinuta(min);
                if(respuesta.compareToIgnoreCase("Se ingreso exitosamente")==0){
                   rs.setAttribute("desde", "empleado_home.jsp");
                rs.setAttribute("pag", "empleado_home.jsp");
                rs.setAttribute("titulo", "Agregado");
                rs.setAttribute("detalle", " ");
                rs.setAttribute("sms", " ");
                rs.setAttribute("tip", "success");
                response.sendRedirect("true.jsp"); 
                }else{
                rs.setAttribute("desde", "empleado_home.jsp");
                rs.setAttribute("pag", "empleado_home.jsp");
                rs.setAttribute("titulo", "Problemas al agregar");
                rs.setAttribute("detalle", "Intente agregar nuevamente ");
                rs.setAttribute("sms", " ");
                rs.setAttribute("tip", "error");
                response.sendRedirect("true.jsp");
                }
                
            } catch (Exception e) {
                HttpSession rs = request.getSession();
                rs.setAttribute("desde", "empleado_home.jsp");
                rs.setAttribute("pag", "empleado_home.jsp");
                rs.setAttribute("titulo", "Problemas al agregar");
                rs.setAttribute("detalle", "Intente agregar nuevamente ");
                rs.setAttribute("sms", e);
                rs.setAttribute("tip", "error");
                response.sendRedirect("true.jsp");
            }

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
