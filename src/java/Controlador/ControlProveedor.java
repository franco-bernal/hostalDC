/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Entidades.Usuario;
import Modelo.Entidades.UsuarioCli_detalle;
import Modelo.Entidades.UsuarioProveedor;
import Modelo.Manejadoras.Manejadora_cliente;
import Modelo.Manejadoras.Manejadora_proveedor;
import Modelo.Manejadoras.Manejadora_usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author Franco
 */
@WebServlet(name = "ControlProveedor", urlPatterns = {"/ControlProveedor"})
public class ControlProveedor extends HttpServlet {

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
        Manejadora_usuario mane_usu = new Manejadora_usuario();
        Manejadora_proveedor mane_pro = new Manejadora_proveedor();

        String accion = request.getParameter("accion");

        //REGISTRO CLIENTE
        if (accion.equals("RegistrarProv")) {
            int id = mane_usu.idMax() + 1;
            String nom_usu = request.getParameter("txt_nom_emp");
            String textoSinEncriptar = request.getParameter("txt_clave");
            String clave = DigestUtils.md5Hex(textoSinEncriptar);
            String correo = request.getParameter("txt_correo_emp");
            int tipo = 3;

            String rut = request.getParameter("txt_rut_emp");
            String nom = request.getParameter("txt_nom_emp");
            String rubro = request.getParameter("txt_rubro");

            Usuario u = new Usuario(id, nom_usu, clave, correo, tipo,0);
            UsuarioProveedor d = new UsuarioProveedor(rut, nom, rubro, id);
            String rs=mane_pro.ingresarProveedorCompleto(u, d);
            
               if (rs.compareToIgnoreCase("Se ingreso exitosamente") == 0) {
                   request.setAttribute("desde", "select.jsp");
                request.setAttribute("pag", "login.jsp");
                request.setAttribute("titulo", "Registrado!");
                request.setAttribute("detalle", "Ya puedes iniciar con tu usuario: " + nom_usu);
                request.setAttribute("sms", " ");
                request.setAttribute("tipo", "success");
                RequestDispatcher rd = request.getRequestDispatcher("true.jsp");
                rd.include(request, response);
            }else{
                 request.setAttribute("desde", "select.jsp");
                request.setAttribute("pag", "select.jsp");
                request.setAttribute("titulo", "Error de registro");
                request.setAttribute("detalle", " ");
                request.setAttribute("sms", rs);
                request.setAttribute("tipo", "alert");
                RequestDispatcher rd = request.getRequestDispatcher("true.jsp");
                rd.include(request, response);
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
