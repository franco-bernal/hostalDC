<%-- 
    Document   : recep_delete
    Created on : 27-06-2020, 22:47:15
    Author     : Franco
--%>

<%@page import="Modelo.Manejadoras.Manejadora_hab"%>
<%@page import="Modelo.Manejadoras.Manejadora_huesped"%>
<%@page import="Modelo.Manejadoras.Manejadora_orden"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!---------------------------------------------------------------------------------------------------------------------------------------------------------------->
        <!-- Inicializacion-->        
        <%%>
        <!--Obtenido cod de compra y rut del comprador-->
        <%
            int id_compra = Integer.parseInt(request.getParameter("id"));
            String rut = request.getParameter("rut");

            Manejadora_orden mane_ord = new Manejadora_orden();
            Manejadora_huesped mane_hue = new Manejadora_huesped();
            Manejadora_hab mane_hab = new Manejadora_hab();
        %>
        <!--Fin: obtenido cod de compra y rut del comprador-->
        <!---------------------------------------------------------------------------------------------------------------------------------------------------------------->

        <h2>Lista de huespedes y sus habitaciones</h2>
        <%            for (int i = 0; i < mane_hue.getHuesped().size(); i++) {
                if (mane_hue.getHuesped().get(i).getORDEN_compra_codigo_compra() == id_compra) {
                    out.print("Nombre:"+mane_hue.getHuesped().get(i).getNombre() +" "+""+mane_hue.getHuesped().get(i).getApellido()+"  N°"+mane_hue.getHuesped().get(i).getHABITACION_num_hab());
                }
            }

        %>

        <a href="empleado_home.jsp">volver</a>





        <!---------------------------------------------------------------------------------------------------------------------------------------------------------------->
        <!---------------------------------------------------------------------------------------------------------------------------------------------------------------->
        <!---------------------------------------------------------------------------------------------------------------------------------------------------------------->

    </body>
</html>
