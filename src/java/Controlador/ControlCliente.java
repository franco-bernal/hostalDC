package Controlador;

import Modelo.Entidades.Usuario;
import Modelo.Entidades.UsuarioCli_detalle;
import Modelo.Manejadoras.Manejadora_cliente;
import Modelo.Manejadoras.Manejadora_usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ControlCliente", urlPatterns = {"/ControlCliente"})
public class ControlCliente extends HttpServlet {

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
        Manejadora_cliente mane_cli = new Manejadora_cliente();

        String accion = request.getParameter("accion");

        //REGISTRO CLIENTE
        if (accion.equals("RegistrarCli")) {
            int id = mane_usu.idMax() + 1;
            String nom_usu = request.getParameter("txt_nom_emp");
            String clave = request.getParameter("txt_clave");
            String correo = request.getParameter("txt_correo_emp");
            int tipo = 4;

            String rut = request.getParameter("txt_rut_emp");
            String nom = request.getParameter("txt_nom_emp");
            String telefono = request.getParameter("txt_tele_emp");
            String dir = request.getParameter("txt_dir_emp");

            Usuario u = new Usuario(id, nom_usu, clave, correo, tipo, 0);
            UsuarioCli_detalle d = new UsuarioCli_detalle(rut, nom, telefono, dir, id);
            out.print(mane_cli.ingresarClienteCompleto(u, d));
            out.print("<hr>");
            out.print("<h1>" + rut + " " + nom + " " + telefono + " " + dir + " " + id + "</h1>");
            out.print("<h1>" + id + " " + nom_usu + " " + clave + " " + correo + " " + tipo + " </h1>");

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
