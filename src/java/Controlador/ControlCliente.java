package Controlador;

import Modelo.Entidades.Factura;
import Modelo.Entidades.Orden_compra;
import Modelo.Entidades.Usuario;
import Modelo.Entidades.UsuarioCli_detalle;
import Modelo.Manejadoras.Manejadora_cliente;
import Modelo.Manejadoras.Manejadora_factura;
import Modelo.Manejadoras.Manejadora_orden;
import Modelo.Manejadoras.Manejadora_usuario;
import Modelo.Util;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
        try {

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
                //out.print();
                String rs = mane_cli.ingresarClienteCompleto(u, d);

                if (rs.compareToIgnoreCase("Se ingreso exitosamente") == 0) {

                    HttpSession hue = request.getSession();
                    hue.setAttribute("desde", "select.jsp");
                    hue.setAttribute("pag", "login.jsp");
                    hue.setAttribute("titulo", "Registrado!");
                    hue.setAttribute("detalle", "Ya puedes iniciar con tu usuario: " + nom_usu);
                    hue.setAttribute("sms", " ");
                    hue.setAttribute("tip", "success");
                    response.sendRedirect("true.jsp");

                } else {

                    HttpSession hue = request.getSession();
                    hue.setAttribute("desde", "select.jsp");
                    hue.setAttribute("pag", "select.jsp");
                    hue.setAttribute("titulo", "Error de registro");
                    hue.setAttribute("detalle", " ");
                    hue.setAttribute("sms", rs);
                    hue.setAttribute("tip", "alert");
                    response.sendRedirect("true.jsp");

                }

            }

            if (accion.equals("generarFactura")) {
                Util util = new Util();
                Manejadora_factura mane_fac = new Manejadora_factura();
                Manejadora_orden mane_ord = new Manejadora_orden();
                String rut = request.getParameter("txt_rut").toString();
                String opc = request.getParameter("select_opc").toString();
                int cod_factura = mane_fac.maxIdFactura();
                Date f_emicion = util.fechaHoy();
                int valor_total = 0;
                int valor_bruto = 0;

                if (opc.compareToIgnoreCase("uno") == 0) {
                    int cod_ord = Integer.parseInt(request.getParameter("cod_ord"));

                    Orden_compra ord = mane_ord.devolverCompraCompleta(cod_ord);
                    int iva = 0;
                    iva = (int) Math.round((ord.getPrecio_total() * 0.19));
                    valor_total = ord.getTipo_hab() + iva;

                    Factura fac = new Factura(cod_factura, valor_total, f_emicion);
                    String rs = mane_fac.ingresarFactura(fac);

                    if (rs.compareToIgnoreCase("Se ingreso exitosamente") == 0) {

                        rs = mane_ord.asignarFactura(cod_factura, cod_ord);

                        if (rs.compareToIgnoreCase("true") == 0) {
                            HttpSession hue = request.getSession();
                            hue.setAttribute("opc", "uno");
                            hue.setAttribute("cod_orden", cod_ord);
                            hue.setAttribute("cod_factura", cod_factura);
                            hue.setAttribute("desde", "cliente_home.jsp");
                            hue.setAttribute("pag", "factura.jsp");
                            hue.setAttribute("titulo", "Factura generada");
                            hue.setAttribute("detalle", "cualquier factura anterior inpaga fué borrada");
                            hue.setAttribute("sms", " ");
                            hue.setAttribute("tip", "success");
                            response.sendRedirect("true.jsp");
                        } else {
                            mane_ord.asignarFactura(0, cod_ord);
                            HttpSession hue = request.getSession();
                            hue.setAttribute("desde", "cliente_home.jsp");
                            hue.setAttribute("pag", "cliente_home.jsp");
                            hue.setAttribute("titulo", "No se pudo asignar");
                            hue.setAttribute("detalle", "Intentelo de nuevo");
                            hue.setAttribute("sms", " ");
                            hue.setAttribute("tip", "error");
                            response.sendRedirect("true.jsp");
                        }
                    } else {
                        HttpSession hue = request.getSession();
                        hue.setAttribute("desde", "cliente_home.jsp");
                        hue.setAttribute("pag", "cliente_home.jsp");
                        hue.setAttribute("titulo", "No se pudo generar");
                        hue.setAttribute("detalle", "Intentelo de nuevo más tarde");
                        hue.setAttribute("sms", "");
                        hue.setAttribute("tip", "error");
                        response.sendRedirect("true.jsp");
                    }
                }

                if (opc.compareToIgnoreCase("todos") == 0) {
                    String rr = "";

                    ArrayList<Orden_compra> arrayC = mane_ord.listaComprasPorRUT(rut);
                    for (int i = 0; i < arrayC.size(); i++) {
                        int cod_ord = arrayC.get(i).getCodigo_compra();
                        Orden_compra ord = mane_ord.devolverCompraCompleta(cod_ord);
                        valor_total += ord.getPrecio_total();
                    }
                    int iva = (int) Math.round((valor_total * 0.19));
                    valor_total = valor_total + iva;
                    Factura fac = new Factura(cod_factura, valor_total, f_emicion);
                    String rs = mane_fac.ingresarFactura(fac);

                    if (rs.compareToIgnoreCase("Se ingreso exitosamente") == 0) {
                        rr = mane_ord.asignarFacturaMultiple(cod_factura, rut);
                        if (rr.compareToIgnoreCase("true") == 0) {
                            HttpSession hue = request.getSession();
                            hue.setAttribute("opc", "todos");
                            hue.setAttribute("cod_factura", cod_factura);
                            hue.setAttribute("desde", "cliente_home.jsp");
                            hue.setAttribute("pag", "factura.jsp");
                            hue.setAttribute("titulo", "Factura generada");
                            hue.setAttribute("detalle", "se agregaron todas las facturas");
                            hue.setAttribute("sms", " ");
                            hue.setAttribute("tip", "success");
                            response.sendRedirect("true.jsp");
                        }
                    } else {
                        HttpSession hue = request.getSession();
                        hue.setAttribute("desde", "cliente_home.jsp");
                        hue.setAttribute("pag", "cliente_home.jsp");
                        hue.setAttribute("titulo", "No se pudo generar");
                        hue.setAttribute("detalle", "Intentelo de nuevo más tarde");
                        hue.setAttribute("sms", "");
                        hue.setAttribute("tip", "error");
                        response.sendRedirect("true.jsp");
                    }

                }

            }//generar factura
        } catch (Exception e) {
            HttpSession hue = request.getSession();
            hue.setAttribute("desde", "cliente_home.jsp");
            hue.setAttribute("pag", "login.jsp");
            hue.setAttribute("titulo", "Hubo algun error en la pagina");
            hue.setAttribute("detalle", "Intentelo de nuevo más tarde");
            hue.setAttribute("sms", "");
            hue.setAttribute("tip", "error");
            response.sendRedirect("true.jsp");
        }
        //REGISTRO CLIENTE

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
