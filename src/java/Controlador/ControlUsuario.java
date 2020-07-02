/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Entidades.Usuario;
import Modelo.Manejadoras.Manejadora_cliente;
import Modelo.Manejadoras.Manejadora_empleado;
import Modelo.Manejadoras.Manejadora_usuario;
import Modelo.Util;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
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
        PrintWriter out = response.getWriter();

        try {
            Manejadora_usuario mane_usu = new Manejadora_usuario();
            HttpSession sesion = request.getSession();

            String accion = request.getParameter("accion");

            if (accion.equals("Salir")) {

                mane_usu.Conec(Integer.parseInt(sesion.getAttribute("id").toString()), 0);
                sesion.invalidate();
                request.getRequestDispatcher("login.jsp").forward(request, response);

            }
        } catch (Exception e) {
            String error = "";
            if (e.toString().compareToIgnoreCase("Java.Lang.NullPointerException") == 0) {
                error = "Punto vacío";
            }

            Util util = new Util();
            util.cuadroDeAlerta("Error al iniciar", "por favor, intentalo de nuevo.", error, "error");
            request.setAttribute("pag", "login.jsp");
            request.getRequestDispatcher("true.jsp").forward(request, response);

        }

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
        Util util = new Util();

        try {
            Manejadora_usuario mane_usu = new Manejadora_usuario();
            Manejadora_cliente mane_cli = new Manejadora_cliente();
            HttpSession sesion = request.getSession();

            String accion = request.getParameter("accion");
            String nom = request.getParameter("txt_nom");
            String clave = request.getParameter("txt_clave");
            Usuario usu = new Usuario();

            usu = mane_usu.obtenerUsuario(nom, clave);
            if (usu == null) {
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {

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
                    Manejadora_empleado ma_em = new Manejadora_empleado();
                    String rut = ma_em.obtenerRutEmpleado(usu.getId_usuario());
                    sesion.setAttribute("rut", rut);
                    request.getRequestDispatcher("empleado_home.jsp").forward(request, response);

                }
                //proveedor
                if (r == 3) {

                    request.getRequestDispatcher("proveedor_home.jsp").forward(request, response);
                }
                //cliente
                if (r == 4) {
                    String rut = mane_cli.obtenerRutUsuario(usu.getId_usuario());
                    sesion.setAttribute("rut", rut);

                    request.setAttribute("desde", "login.jsp");
                    request.setAttribute("pag", "cliente_home.jsp");
                    request.setAttribute("titulo", "Ingresado como ");
                    request.setAttribute("detalle", "cliente ");
                    request.setAttribute("sms", rut);
                    request.setAttribute("tipo", "success");
                    RequestDispatcher rd = request.getRequestDispatcher("true.jsp");
                    rd.include(request, response);
                }
            }
        } catch (Exception e) {
            String error = "";
            if (e.toString().compareToIgnoreCase("Java.Lang.NullPointerException") == 0) {
                error = "Punto vacío";
            }

            request.setAttribute("pag", "login.jsp");
            request.setAttribute("titulo", "Algo ocurrió al iniciar");
            request.setAttribute("detalle", "por favor, intentalo de nuevo.");
            request.setAttribute("sms", e);
            request.setAttribute("tipo", "error");
            request.getRequestDispatcher("true.jsp").forward(request, response);

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
