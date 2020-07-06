<%-- 
    Document   : true
    Created on : 29-06-2020, 0:44:38
    Author     : Franco
--%>

<%@page import="Modelo.Util"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Redireccionando</title>
    </head>
    <body>

        <%
            Util util = new Util();
            HttpSession rs = request.getSession();
            String pag = rs.getAttribute("pag").toString();
            String desde = rs.getAttribute("desde").toString();
            rs.setAttribute("redirect", pag);
            String titulo = "titulo vacío";
            String detalle = "";
            String sms = "vacío";
            String tipo = "";

            try {
                titulo = rs.getAttribute("titulo").toString();
                detalle = rs.getAttribute("detalle").toString();
                tipo = rs.getAttribute("tip").toString();
                sms = rs.getAttribute("sms").toString();

                if (sms == null) {
                    sms = "vacío";
                }
                if (pag == null || titulo == null || detalle == null || sms == null || tipo == null) {
                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                    rd.include(request, response);
                }
                out.print(util.cuadroDeAlerta(titulo, detalle, sms, tipo));
                RequestDispatcher rd = request.getRequestDispatcher("redirect.jsp");
                rd.include(request, response);

            } catch (Exception e) {
                out.print(util.cuadroDeAlerta("true: Fallo reenvio", "404","desde:"+desde+ " a :" + pag + ". |sms:" +tipo + "|"+e, "error"));
                RequestDispatcher rd = request.getRequestDispatcher(desde);
                rd.include(request, response);
            }


        %>
    </body>
</html>
