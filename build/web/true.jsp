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
            String pag = request.getAttribute("pag").toString();
            String desde = request.getAttribute("desde").toString();;

            String titulo = "titulo vacío";
            String detalle = "";
            String sms = "vacío";
            String tipo = "";

            try {
                titulo = request.getAttribute("titulo").toString();
                detalle = request.getAttribute("detalle").toString();
                tipo = request.getAttribute("tipo").toString();
                sms = request.getAttribute("sms").toString();

                if (sms == null) {
                    sms = "vacío";
                }
                if (pag == null || titulo == null || detalle == null || sms == null || tipo == null) {
                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                    rd.include(request, response);
                }
                out.print(util.cuadroDeAlerta(titulo, detalle, sms, tipo));
                RequestDispatcher rd = request.getRequestDispatcher(pag);
                rd.include(request, response);

            } catch (Exception e) {
                out.print(util.cuadroDeAlerta("true: Fallo reenvio", "404","desde:"+desde+ " a :" + pag + ". |sms:" + sms + "|", "error"));
                RequestDispatcher rd = request.getRequestDispatcher(desde);
                rd.include(request, response);
            }


        %>
    </body>
</html>
