<%-- 
    Document   : visitas
    Created on : 13-07-2020, 16:53:07
    Author     : Franco
--%>

<%@page import="Modelo.Manejadoras.Manejadora_conf"%>
<%@page import="Modelo.Entidades.Visitas_aux"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Manejadoras.Manejadora_visitas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    //Seguridad de pagina llave= ?id=ok poner en enlaces
    HttpSession hue = request.getSession();
    try {
        String permiso = request.getParameter("id");
        if (permiso == null) {
            permiso = hue.getAttribute("per").toString();
            if (permiso == null) {
                response.sendRedirect("login.jsp");
            } else {
                out.print(permiso);
            }
        } else {
            out.print(permiso);
        }
    } catch (Exception e) {
        response.sendRedirect("login.jsp");
    }
%>   

<%
    Manejadora_visitas mane_vi = new Manejadora_visitas();
    ArrayList<Visitas_aux> arrayVi = mane_vi.ObtenerVisitaPorMes();
%>

<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gráfico de barrasL</title>
        <link href="css/grafico.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>

        <div class="chart-wrap horizontal"> <!-- quitar el estilo "horizontal" para visualizar verticalmente -->
            <div class="title">Grafico porcentaje de visitas</div>

            <div class="grid">

                <%Manejadora_conf maneCo = new Manejadora_conf();
                    int meta = maneCo.getConfig().get(0).getMeta_visitas();
                    for (int i = 0; i < arrayVi.size(); i++) {
                        Visitas_aux vi_a = arrayVi.get(i);

                        int por = Math.round((vi_a.getCantidad() * 100) / meta);
                        out.print("<div class='bar' style='--bar-value:" + por + "%;' data-name='" + vi_a.getMes() + " " + vi_a.getCantidad() + "" + " " + por + "%' title='" + vi_a.getMes() + "'></div>"
                                + "");
                    }
                    out.print("Meta de visitas:" + meta);
                %> 


            </div>
        </div>




    </body>
</html>