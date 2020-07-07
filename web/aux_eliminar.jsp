<%-- 
    Document   : aux_eliminar
    Created on : 06-07-2020, 11:53:08
    Author     : Franco
--%>

<%@page import="Modelo.Manejadoras.Manejadora_pedidos"%>
<%@page import="Modelo.Manejadoras.Manejadora_huesped"%>
<%@page import="Modelo.Manejadoras.Manejadora_orden"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>eliminando</title>
    </head>
    <body>
        <%

                try {
                    String accion = "";
                    int id = 0;

                    accion = request.getParameter("accion").toString();
                    id = Integer.parseInt(request.getParameter("id").toString());

                    if (accion.compareToIgnoreCase("aceptar") == 0) {

                        Manejadora_pedidos mane_ped = new Manejadora_pedidos();
                        String rs = mane_ped.actualizarEstado(3, id);

                        if (rs.compareToIgnoreCase("true") == 0) {
                            HttpSession hue = request.getSession();
                            hue.setAttribute("desde", "detalle_pedido.jsp");
                            hue.setAttribute("pag", "proveedor_home.jsp");
                            hue.setAttribute("titulo", "Pedido rechazado");
                            hue.setAttribute("detalle", "Se ha rechazado el pedido");
                            hue.setAttribute("sms", " ");
                            hue.setAttribute("tip", "success");
                            response.sendRedirect("true.jsp");
                        }
                }

                if (accion.compareToIgnoreCase("el_ord") == 0) {
                    Manejadora_huesped mane_hue = new Manejadora_huesped();
                    HttpSession hue = request.getSession();
                    int codigo = Integer.parseInt(request.getParameter("id").toString());

                    String rs = mane_hue.cancelar(codigo);
                    if (rs == "realizado") {
                        hue.setAttribute("desde", "cliente_home.jsp");
                        hue.setAttribute("pag", "cliente_home.jsp");
                        hue.setAttribute("titulo", "Eliminado");
                        hue.setAttribute("detalle", "Se ha eliminado el " + codigo);
                        hue.setAttribute("sms", rs);
                        hue.setAttribute("tip", "success");
                        response.sendRedirect("true.jsp");

                    } else {
                        hue.setAttribute("desde", "cliente_home.jsp");
                        hue.setAttribute("pag", "cliente_home.jsp");
                        hue.setAttribute("titulo", "No se pudo eliminar");
                        hue.setAttribute("detalle", "por favor, intentalo de nuevo");
                        hue.setAttribute("sms", rs);
                        hue.setAttribute("tip", "error");
                        response.sendRedirect("true.jsp");

                    }
                }

                if (accion.compareToIgnoreCase("rechazar") == 0) {
                    Manejadora_pedidos mane_ped = new Manejadora_pedidos();
                    String rs = mane_ped.actualizarEstado(0, id);
                    if (rs.compareToIgnoreCase("true") == 0) {
                        HttpSession hue = request.getSession();
                        hue.setAttribute("desde", "proveedor_home.jsp");
                        hue.setAttribute("pag", "proveedor_home.jsp");
                        hue.setAttribute("titulo", "Pedido rechazado");
                        hue.setAttribute("detalle", "Se ha rechazado el pedido");
                        hue.setAttribute("sms", " ");
                        hue.setAttribute("tip", "success");
                        response.sendRedirect("true.jsp");
                    }

                }
            }
            catch (Exception e) {
                HttpSession hue = request.getSession();
                hue.setAttribute("desde", "proveedor_home.jsp");
                hue.setAttribute("pag", "proveedor_home.jsp");
                hue.setAttribute("titulo", "Error de parametros");
                hue.setAttribute("detalle", e);
                hue.setAttribute("sms", " ");
                hue.setAttribute("tip", "alert");
                response.sendRedirect("true.jsp");
            }
        %>


    </body>
</html>
