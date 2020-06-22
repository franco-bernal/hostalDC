<%-- 
    Document   : huesped
    Created on : 16-06-2020, 0:57:16
    Author     : Franco
--%>

<%@page import="Modelo.Manejadoras.Manejadora_hab"%>
<%@page import="Modelo.Manejadoras.Manejadora_minuta"%>
<%@page import="Modelo.Entidades.Orden_compra"%>
<%@page import="Modelo.Entidades.Huesped"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Manejadoras.Manejadora_orden"%>
<%@page import="Modelo.Manejadoras.Manejadora_huesped"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv="Expires" content="0">
        <title>Huesped</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
        <link href="css/pruebas.css" rel="stylesheet" type="text/css"/>
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);

        %>
    </head>
    <body>
        <%            HttpSession hue = request.getSession();
            int codigo = Integer.parseInt(hue.getAttribute("cod").toString());
            Manejadora_orden mane_ord = new Manejadora_orden();
            Orden_compra ord = mane_ord.devolverCompraCompleta(codigo);
            hue.setAttribute("codigo_com", ord.getCodigo_compra());
            int precio = ord.getPrecio_total();


        %>

        <div class="container col-lg-5 col-sm-12 col-xs-5"> 
            <form action="AgregarHuesped" method="Post">
                <div class="col-sm">
                    <p class="p-3 mb-2 bg-dark text-white ">Compra</p>
                    <input type="text" class="form-control" name="txt_rut" placeholder="rut" required="ingrese rut" maxlength="18">
                    <input type="text" class="form-control" name="txt_nombre" placeholder="nombre" required="true" maxlength="20">
                    <input type="text" class="form-control" name="txt_apellido" placeholder="apellido" required="true" maxlength="20">
                </div>
                <hr>
                <div class="form-group form-check">
                    <input type="checkbox" class="form-check-input"  required="true">
                    <label class="form-check-label" for="exampleCheck1">Revisé los datos</label>
                </div>
                <button type="submit" class="btn btn-dark btn-block" name="accion" value="AgregarHue">Aceptar y agregar huesped</button>


            </form>
            <hr>
            <form action="AgregarHuesped" method="Post">
                <button type="submit" class="btn btn-dark btn-block" name="accion" value="Cancelar">Cancelar y volver</button>
            </form>
            <hr>
            <a href="cliente_home.jsp"  class="btn btn-dark btn-block">Volver</a>

        </div>
        <hr>
        <div class="container table-sm  col-lg-10 col-sm-12 col-xs-5 mb-5 mar"> 
            <table class="table table-hover ">
                <thead>
                    <tr>
                        <th scope="col">rut</th>
                        <th scope="col">nombre</th>
                        <th scope="col">apellido</th>
                    </tr>
                </thead>
                <tbody>

                    <%                        Manejadora_huesped mane = new Manejadora_huesped();

                        try {
                            for (int i = 0; i < mane.getHuesped().size(); i++) {
                                if (mane.getHuesped().get(i).getORDEN_compra_codigo_compra() == codigo) {
                                    out.print("<tr class='table-dark'>");
                                    out.print("<td>" + mane.getHuesped().get(i).getRut() + "</td>"
                                            + "<td>" + mane.getHuesped().get(i).getNombre() + "</td>"
                                            + "<td>" + mane.getHuesped().get(i).getApellido() + "</td>"
                                            + "</tr>");
                                } else {
                                    if (mane.getHuesped().size() == 0) {
                                        out.print("<td>" + "Agregue huesped" + "</td>");
                                    }
                                }

                            }
                        } catch (Exception e) {
                            out.print(e);
                        }//

                        int cod_com = Integer.parseInt(hue.getAttribute("codigo_com").toString());

                        int tipo_mi = ord.getTipo_min();
                        int tipo_ha = ord.getTipo_hab();

                        Manejadora_minuta ma_mi = new Manejadora_minuta();
                        Manejadora_hab ma_ha = new Manejadora_hab();

                        int precio_mi = ma_mi.valorMinuta(tipo_mi);
                        int precio_ha = ma_ha.valorHab(tipo_ha);


                    %>
                
                    <% out.print("<h1>precio total: " + precio+ " </h1><p>  | Valor minuta:"+precio_mi+ " | Valor habitacion:"+precio_ha+"</p>");%>
               
                </tbody>
            </table>



        </div> 

        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    </body>
</html>
