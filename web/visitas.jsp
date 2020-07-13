<%-- 
    Document   : visitas
    Created on : 13-07-2020, 16:53:07
    Author     : Franco
--%>

<%@page import="Modelo.Entidades.Visitas_aux"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Manejadoras.Manejadora_visitas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

                <%
                    for (int i = 0; i < arrayVi.size(); i++) {
                        Visitas_aux vi_a = arrayVi.get(i);
                        int meta = 100;
                        int por = Math.round((vi_a.getCantidad() * meta) / 100);
                        out.print("<div class='bar' style='--bar-value:" + por + "%;' data-name='" + vi_a.getMes() + " " + por + "%' title='" + vi_a.getMes() + "'></div>"
                                + "");
                    }
                %> 


            </div>
        </div>
                
                
                

    </body>
</html>