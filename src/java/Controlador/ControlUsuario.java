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
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
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
        request.getRequestDispatcher("login.jsp").forward(request, response);

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
        String nom = request.getParameter("txt_nom");
        String clave = request.getParameter("txt_clave");
        Usuario usu = new Usuario();
        if (nom != null || clave != null) {
            usu = mane_usu.obtenerUsuario(nom, clave);
            sesion.setAttribute("id", usu.getId_usuario());
            sesion.setAttribute("user", usu.getNom_usuario());
            sesion.setAttribute("clave", usu.getClave());
            sesion.setAttribute("tipo", usu.getTipo_usuario_permiso());
        }

        int r;

        if (accion.equals("Ingresar")) {

            try {
                r = usu.getTipo_usuario_permiso();
            } catch (Exception e) {
                r = 0;
            }
            //empleado
            if (r == 2) {

                request.getRequestDispatcher("empleado_home.jsp").forward(request, response);
            }
            //proveedor
            if (r == 3) {

                request.getRequestDispatcher("proveedor_home.jsp").forward(request, response);
            }
            //cliente
            if (r == 4) {
                sesion.setAttribute("sesion", mane_usu.Conec(usu.getId_usuario(), 1));
                request.getRequestDispatcher("cliente_home.jsp").forward(request, response);
            }
        }
        if (accion.equals("Salir")) {

            mane_usu.Conec(Integer.parseInt(sesion.getAttribute("id").toString()), 0);
            sesion.invalidate();
            request.getRequestDispatcher("login.jsp").forward(request, response);

        } else {
            out.print("kee");
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
