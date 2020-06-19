/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.DAO.DAOorden_compra;
import Modelo.Entidades.Huesped;
import Modelo.Entidades.Orden_compra;
import Modelo.Manejadoras.Manejadora_huesped;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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
@WebServlet(name = "AgregarHuesped", urlPatterns = {"/AgregarHuesped"})
public class AgregarHuesped extends HttpServlet {

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
        DAOorden_compra dao_ord = new DAOorden_compra();
        String accion = request.getParameter("accion");


        Manejadora_huesped mane_hue = new Manejadora_huesped();

        if (accion.equals("Agregar")) {
            HttpSession hue = request.getSession();

            java.util.Date utilDate = new java.util.Date(); //fecha actual
            java.sql.Date hoy = new java.sql.Date(utilDate.getTime());

            //Variables
            String se_ha = request.getParameter("select_ha");
            String se_co = request.getParameter("select_co");
            Date f_inicio = Date.valueOf(request.getParameter("txt_f_inicio"));
            Date f_fin = Date.valueOf(request.getParameter("txt_f_fin"));
            Date f_compra = hoy;
            int codigo_compra = dao_ord.buscaridMax() + 1;

            String rut_cliente = "123";

            Orden_compra ord = new Orden_compra(codigo_compra, f_inicio, f_fin, f_compra, 5555, 1, 1, "123");
            String rs = dao_ord.ingresarOrden(ord);

            if (rs == "Se ingreso exitosamente") {
                hue.setAttribute("cod", codigo_compra);
                hue.setAttribute("res", "ingresado");
                request.getRequestDispatcher("huesped.jsp").forward(request, response);
            } else {
                out.print(rs);
            }
        }
///////////////////////////////////////

        if (accion.equals("AgregarHue")) {
            HttpSession hue = request.getSession();

            int codigo = Integer.parseInt(hue.getAttribute("cod").toString());
            String rut = request.getParameter("txt_rut");
            String nombre = request.getParameter("txt_nombre");
            String apellido = request.getParameter("txt_apellido");
            Huesped hues = new Huesped(rut, nombre, apellido, codigo, 0);
            mane_hue.ingresarHuesped(hues);
            request.getRequestDispatcher("huesped.jsp").forward(request, response);
        }
        /////////////////
        if (accion.equals("Cancelar")) {
            HttpSession hue = request.getSession();

            int codigo = Integer.parseInt(hue.getAttribute("cod").toString());
            String rs = mane_hue.cancelar(codigo);
            if (rs == "realizado") {
                out.print(mane_hue.cancelar(codigo));
                request.getRequestDispatcher("cliente_home.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("huesped.jsp").forward(request, response);
            }
        }
        if (accion.equals("borrar")) {
            HttpSession hue = request.getSession();
                int codigo = Integer.parseInt(request.getParameter("txt_cod"));

            String rs = mane_hue.cancelar(codigo);
            if (rs == "realizado") {
                out.print(mane_hue.cancelar(codigo));
                request.getRequestDispatcher("cliente_home.jsp").forward(request, response);
            } else {
                      request.getRequestDispatcher("cliente_home.jsp").forward(request, response);
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
