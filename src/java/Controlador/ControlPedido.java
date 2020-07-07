/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Entidades.Orden_pedido;
import Modelo.Entidades.Producto;
import Modelo.Entidades.UsuarioProveedor;
import Modelo.Entidades.detalle_pedido;
import Modelo.Manejadoras.Manejadora_pedidos;
import Modelo.Manejadoras.Manejadora_productos;
import Modelo.Manejadoras.Manejadora_proveedor;
import Modelo.Util;
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
@WebServlet(name = "ControlPedido", urlPatterns = {"/ControlPedido"})
public class ControlPedido extends HttpServlet {

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
        //request.getRequestDispatcher("agregarProductos.jsp").forward(request, response);
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

        String accion = request.getParameter("accion");

        if (accion.equals("ComenzarPedido")) {
            try {
                HttpSession rs = request.getSession();

                rs.setAttribute("prov", request.getParameter("select_prov"));
                request.setAttribute("select_prov", request.getParameter("select_prov"));
                String rut_emp_ = request.getParameter("txt_rut_emp");
                String nom_prov = request.getParameter("select_prov");

                Manejadora_pedidos mane_ped = new Manejadora_pedidos();

                Manejadora_proveedor mane_prov = new Manejadora_proveedor();
                Manejadora_productos mane_produ = new Manejadora_productos();
                UsuarioProveedor prov = new UsuarioProveedor();

                for (int i = 0; i < mane_prov.getProveedor().size(); i++) {
                    String nom_comparar = util.quitarEspaciosAlFInal(mane_prov.getProveedor().get(i).getNom_empresa());
                    if (nom_comparar.compareToIgnoreCase(nom_prov) == 0) {

                        prov = mane_prov.getProveedor().get(i);

                    }

                }
                java.util.Date utilDate = new java.util.Date(); //fecha actual
                java.sql.Date hoy = new java.sql.Date(utilDate.getTime());

                int id = mane_ped.pedidoMaxid();
                rs.setAttribute("id", id);
                Date f_emicion = util.fechaHoy();
                Date f_rece = null;
                int estado = 1;//1=enviado
                String rut_prov = prov.getRut();
                String rut_emp = rut_emp_;
                Orden_pedido ord = new Orden_pedido(id, hoy, hoy, estado, rut_prov, rut_emp);
                String respuesta = mane_ped.ingresarPedidoComoEmpleado(ord);

                if (respuesta.compareToIgnoreCase("1") == 0) {
                    HttpSession hue = request.getSession();
                    hue.setAttribute("desde", "empleado_home.jsp");
                    hue.setAttribute("pag", "agregarProductos.jsp");
                    hue.setAttribute("titulo", "Compra ingresada");
                    hue.setAttribute("detalle", "ingrese productos");
                    hue.setAttribute("sms", " ");
                    hue.setAttribute("tip", "success");
                    response.sendRedirect("true.jsp");
                } else {
                    HttpSession hue = request.getSession();
                    hue.setAttribute("desde", "empleado_home.jsp");
                    hue.setAttribute("pag", "agregarProductos.jsp");
                    hue.setAttribute("titulo", "No se ingresó");
                    hue.setAttribute("detalle", " aaaa");
                    hue.setAttribute("sms", respuesta);
                    hue.setAttribute("tip", "alert");
                    response.sendRedirect("true.jsp");

                }
            } catch (Exception e) {
                HttpSession hue = request.getSession();
                hue.setAttribute("desde", "empleado_home.jsp");
                hue.setAttribute("pag", "login.jsp");
                hue.setAttribute("titulo", "Vuelva a intentalo por favor");
                hue.setAttribute("detalle", " ");
                hue.setAttribute("sms", e);
                hue.setAttribute("tip", "error");
                response.sendRedirect("true.jsp");
            }
        }

        if (accion.equals("Agregar_productos")) {
            HttpSession hue = request.getSession();
            Manejadora_productos mane_prod = new Manejadora_productos();
            Manejadora_pedidos mane_ped = new Manejadora_pedidos();

            String selected = request.getParameter("select_prod");
            int cantidad = Integer.parseInt(request.getParameter("txt_cant"));
            HttpSession rs = request.getSession();
            int id_producto = mane_prod.cambiarNombreProductoPorId(selected);
            int id = Integer.parseInt(rs.getAttribute("id_ord").toString());

            detalle_pedido det = new detalle_pedido(cantidad, id, id_producto);

            String def = mane_ped.ingresarCantidadTabla(det);

            if (def.compareToIgnoreCase("Se ingreso exitosamente") == 0) {
                hue.setAttribute("desde", "agregarProductos.jsp");
                hue.setAttribute("pag", "agregarProductos.jsp");
                hue.setAttribute("titulo", "Producto registrado en la orden " + id);
                hue.setAttribute("detalle", " ");
                hue.setAttribute("sms", " ");
                hue.setAttribute("tip", "success");
                response.sendRedirect("true.jsp");
            } else {
                hue.setAttribute("desde", "empleado_home.jsp");
                hue.setAttribute("pag", "agregarProductos.jsp");
                hue.setAttribute("titulo", "falló registro");
                hue.setAttribute("detalle", "vuelva a intentar o borre la compra y agregue otra vez");
                hue.setAttribute("sms", " ");
                hue.setAttribute("tip", "error");
                response.sendRedirect("true.jsp");

            }

        }
        if (accion.equals("cancelar")) {
            Manejadora_pedidos mane_ped = new Manejadora_pedidos();

            HttpSession rs = request.getSession();
            int id = Integer.parseInt(rs.getAttribute("id_ord").toString());
            String re = mane_ped.limpiarPedidoCompleto(id);
            if (re.compareToIgnoreCase("true") == 0) {

                HttpSession hue = request.getSession();
                hue.setAttribute("desde", "agregarProductos.jsp");
                hue.setAttribute("pag", "empleado_home.jsp");
                hue.setAttribute("titulo", "Compra eliminada");
                hue.setAttribute("detalle", " ");
                hue.setAttribute("sms", " ");
                hue.setAttribute("tip", "success");
                response.sendRedirect("true.jsp");
            } else {
                HttpSession hue = request.getSession();
                hue.setAttribute("desde", "agregarProductos.jsp");
                hue.setAttribute("pag", "agregarProductos.jsp");
                hue.setAttribute("titulo", "No se pudo eliminar");
                hue.setAttribute("detalle", "intente de nuevo");
                hue.setAttribute("sms", re);
                hue.setAttribute("tip", "error");
                response.sendRedirect("true.jsp");
            }

        }
        if (accion.equals("Enviar")) {
            Manejadora_pedidos mane_ped = new Manejadora_pedidos();

            HttpSession rs = request.getSession();
            int id = Integer.parseInt(rs.getAttribute("id_ord").toString());

            String re = mane_ped.actualizarEstado(2, id);
            if (re.compareToIgnoreCase("true") == 0) {

                HttpSession hue = request.getSession();
                hue.setAttribute("desde", "agregarProductos.jsp");
                hue.setAttribute("pag", "empleado_home.jsp");
                hue.setAttribute("titulo", "Pedido enviado");
                hue.setAttribute("detalle", " ");
                hue.setAttribute("sms", " ");
                hue.setAttribute("tip", "success");
                response.sendRedirect("true.jsp");
            } else {
                HttpSession hue = request.getSession();
                hue.setAttribute("desde", "agregarProductos.jsp");
                hue.setAttribute("pag", "agregarProductos.jsp");
                hue.setAttribute("titulo", "No se pudo enviar");
                hue.setAttribute("detalle", "intente de nuevo");
                hue.setAttribute("sms", re);
                hue.setAttribute("tip", "error");
                response.sendRedirect("true.jsp");
            }

        }

        if (accion.equals("insert_prod")) {
            Manejadora_productos mane_prod = new Manejadora_productos();
            int id = mane_prod.maxIdProducto();
            String nombre = request.getParameter("txt_nombre").toString();
            String detalle = request.getParameter("txt_detalle").toString();
            int valor = Integer.parseInt(request.getParameter("txt_valor").toString());
            String rut = request.getParameter("txt_rut");
            Producto prod = new Producto(id, nombre, detalle, valor, rut);
            try {
                String rs = mane_prod.ingresarProducto(prod);
                if (rs.compareToIgnoreCase("Se ingreso exitosamente") == 0) {
                    HttpSession hue = request.getSession();
                    hue.setAttribute("desde", "proveedor_home.jsp");
                    hue.setAttribute("pag", "proveedor_home.jsp");
                    hue.setAttribute("titulo", "Producto agregado");
                    hue.setAttribute("detalle", " ");
                    hue.setAttribute("sms", rs);
                    hue.setAttribute("tip", "success");
                    response.sendRedirect("true.jsp");
                }else{
                     HttpSession hue = request.getSession();
                    hue.setAttribute("desde", "proveedor_home.jsp");
                    hue.setAttribute("pag", "proveedor_home.jsp");
                    hue.setAttribute("titulo", "No se guardó");
                    hue.setAttribute("detalle", "intentelo de nuevo");
                    hue.setAttribute("sms", rs);
                    hue.setAttribute("tip", "error");
                    response.sendRedirect("true.jsp");
                }
            } catch (Exception e) {
                  HttpSession hue = request.getSession();
                    hue.setAttribute("desde", "proveedor_home.jsp");
                    hue.setAttribute("pag", "proveedor_home.jsp");
                    hue.setAttribute("titulo", "No se guardó");
                    hue.setAttribute("detalle", "intentelo de nuevo");
                    hue.setAttribute("sms", e);
                    hue.setAttribute("tip", "error");
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
