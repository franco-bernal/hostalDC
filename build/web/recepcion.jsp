<%-- 
    Document   : recepcion
    Created on : 27-06-2020, 18:59:24
    Author     : Franco
--%>

<%@page import="Modelo.Manejadoras.Manejadora_cliente"%>
<%@page import="Modelo.Entidades.Orden_compra"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Util"%>
<%@page import="Modelo.Manejadoras.Manejadora_orden"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv="Expires" content="0">
        <title>Recepcion HDC</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
        <link href="css/Cliente.css" rel="stylesheet" type="text/css"/>
        <link href="css/Util.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <!--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
        <!-- inicializacion de rut  -->
        <%
            String rut = "";
            try {
                rut = (String) request.getAttribute("rut");

            } catch (Exception e) {
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        %>
        <!--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
        <!-- lista de compras la tabla   -->

        <div class="container table-sm col-lg-10">
            <div >
                <h4 class="mb-5 mar" id="lista">Lista de compras</h4>

                <table class="table center-block" >
                    <thead>
                        <tr>
                            <th >codigo</th>
                            <th >desde</th>
                            <th >hasta</th>
                            <th >fecha comprado</th>
                            <th >precio total</th>
                            <th >tipo habitacion</th>
                            <th >tipo minuta</th>
                            <th >rut comprador</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style="cursor: not-allowed;">
                            </td>     
                            <%
                                try {
                                    Manejadora_orden ord = new Manejadora_orden();
                                    Manejadora_cliente mane_cli = new Manejadora_cliente();
                                    ArrayList<Orden_compra> arrayC = ord.listaComprasPorRUT(rut);
                                    try {
                                        for (int i = 0; i < arrayC.size(); i++) {

                                            int id = mane_cli.obtenerIdUsuario(rut);
                                            String rut_o = mane_cli.obtenerRutUsuario(id);
                                            Util util = new Util();
                                            String nom_mi = "";
                                            String nom_hab = "";

                                            nom_mi = util.tipo_min_nom(ord.getOrden().get(i).getTipo_min());
                                            nom_hab = util.tipo_hab_nom(ord.getOrden().get(i).getTipo_hab());
                                            out.print("<tr class='table-dark'>");
                                            out.print("<td>" + arrayC.get(i).getCodigo_compra() + "</td>"
                                                    + "<td>" + arrayC.get(i).getF_inicio() + "</td>"
                                                    + "<td>" + arrayC.get(i).getF_fin() + "</td>"
                                                    + "<td>" + arrayC.get(i).getF_compra() + "</td>"
                                                    + "<td>" + arrayC.get(i).getPrecio_total() + "</td>"
                                                    + "<td>" + nom_hab + "</td>"
                                                    + "<td>" + nom_mi + "</td>"
                                                    + "<td>" + arrayC.get(i).getCliente_rut_emp() + "</td>"
                                                    + "<td><a href='recep_delete.jsp?id="+arrayC.get(i).getCodigo_compra()+"' class='btn btn-warning btn-sm'>rece</a></td>"
                                                    + "</tr>");

                                        }
                                    } catch (Exception e) {
                                        out.print(e);
                                    }//
                                } catch (Exception e) {
                                    request.getRequestDispatcher("login.jsp").forward(request, response);
                                }
                            %>
                        </tr>
                    </tbody>
                </table>
                <br><br><br><br>
            </div>
        </div>
        <!--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->

    </body>
</html>
