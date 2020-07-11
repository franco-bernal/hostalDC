<%-- 
    Document   : administrador
    Created on : 08-07-2020, 19:07:10
    Author     : Franco
--%>

<%@page import="Modelo.Entidades.detalle_pedido"%>
<%@page import="Modelo.Manejadoras.Manejadora_pedidos"%>
<%@page import="Modelo.Manejadoras.Manejadora_orden"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Informes y est.</title>
        <link rel="icon" type="image/vnd.microsoft.icon" href="favicon-cdlibre-16.ico" sizes="16x16">
        <%
                         Manejadora_orden mane_ord=new Manejadora_orden();
                         Manejadora_pedidos mane_ped=new Manejadora_pedidos();
        %>

    </head>
    <body>
        <a>Informes y estadisticas</a>
        <button type="button" onclick="javascript:window.print()">Imprimir</button>
            <div class="row">
                <div class="col-xs-12  d-flex justify-content-center">
                    <h1 class="page-header">
                        Ordenes de compra
                    </h1>

                    <!-- TABLA INICIA orden compra-->
              
                    
                    <table border="2" width="1" cellpadding="5" id="tabla" class="table table-striped ">
                        <thead>
                             <tr>
                                <td colspan="4">
                                    <input id="buscar" type="text" class="form-control" placeholder="Escriba algo para filtrar" />
                                </td>
                            </tr>
                            <tr>
                                <th>Codigo</th>
                                <th>rut empresa</th>
                                <th>fecha de compra</th>
                                <th>precio total</th>
                                <th>cod-factura</th>
                            </tr>
                           
                        </thead>
                        <tbody>
                            <%
                            for(int i=0;i<mane_ord.getOrden().size();i++){
                                out.print(""
                                        + "<tr>"
                                        + "<td>cod-"+mane_ord.getOrden().get(i).getCodigo_compra()+"</td>"
                                        + "<td>"+mane_ord.getOrden().get(i).getCliente_rut_emp()+"</td>"
                                        + "<td>"+mane_ord.getOrden().get(i).getF_compra()+"</td>"
                                        +" <td class='text-right'>$"+mane_ord.getOrden().get(i).getPrecio_total()+"</td>"
                                        +"<td>f-"+mane_ord.getOrden().get(i).getFACTURA_cod_factura()+"</td>"
                                        + "</tr>");
                            }
                            %>
                        </tbody>
                    </table>
                    <!-- TABLA FINALIZA -->

                    
                 

                </div>
            </div>

                     

        <script src="js/form.js"></script>

    </body>
</html>
