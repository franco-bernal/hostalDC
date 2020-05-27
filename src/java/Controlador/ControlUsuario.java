/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Entidades.Usuario;
import Modelo.Manejadoras.Manejadora_usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Franco
 */
public class ControlUsuario extends HttpServlet {

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
        Manejadora_usuario mane_usu = new Manejadora_usuario();
        HttpSession sesion = request.getSession();

        String accion = request.getParameter("accion");

        if (accion.equals("Ingresar")) {
            String nom = request.getParameter("txt_nom");
            String clave = request.getParameter("txt_clave");
            int r;
            Usuario usu = mane_usu.obtenerUsuario(nom, clave);

            try {
                r = usu.getTipo_usuario_permiso();
            } catch (Exception e) {
                r = 0;
            }
            //empleado
            if (r == 2) {
                sesion.setAttribute("user", usu.getNom_usuario());
                sesion.setAttribute("clave", usu.getClave());
                sesion.setAttribute("tipo", usu.getTipo_usuario_permiso());

                request.getRequestDispatcher("empleado_home.jsp").forward(request, response);
            }
            //proveedor
            if (r == 3) {
                sesion.setAttribute("user", usu.getNom_usuario());
                sesion.setAttribute("clave", usu.getClave());
                sesion.setAttribute("tipo", usu.getTipo_usuario_permiso());

                request.getRequestDispatcher("proveedor_home.jsp").forward(request, response);
            }
            //cliente
            if (r == 4) {
                sesion.setAttribute("user", usu.getNom_usuario());
                sesion.setAttribute("clave", usu.getClave());
                sesion.setAttribute("tipo", usu.getTipo_usuario_permiso());

                request.getRequestDispatcher("cliente_home.jsp").forward(request, response);
            }
        }
        if (accion.equals("Salir")) {
            if (sesion.getAttribute("user") != null || sesion.getAttribute("clave") != null) {
                sesion.setAttribute("user", null);
                sesion.invalidate();
                request.getRequestDispatcher("index.jsp").forward(request, response);

            }
        } else {
            request.getRequestDispatcher("index.jsp").forward(request, response);

        }

    }

    /*

    
    
   

     */
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
