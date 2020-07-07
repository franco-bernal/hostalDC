<%-- 
    Document   : detalle_pedido
    Created on : 06-07-2020, 17:58:58
    Author     : Franco
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.DAO.DAOorden_pedido"%>
<%@page import="Modelo.Entidades.detalle_pedido"%>
<%@page import="Modelo.Entidades.Orden_pedido"%>
<%@page import="Modelo.Manejadoras.Manejadora_pedidos"%>
<%@page import="Modelo.Entidades.Producto"%>
<%@page import="Modelo.Manejadoras.Manejadora_productos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%

            int id_ped = Integer.parseInt(request.getParameter("id").toString());

        %>

        <h1>orden de pedido N°<%=id_ped %></h1>
        
        <table>
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Cantidad</th>
                </tr>
            </thead>
            <tbody>
                <%                    Manejadora_productos mane_prod = new Manejadora_productos();
                    Manejadora_pedidos mane_ped = new Manejadora_pedidos();

                    if (mane_ped.getDetallePedidos().size() > 0) {

                        for (int i = 0; i < mane_ped.getDetallePedidos().size(); i++) {
                            if (mane_ped.getDetallePedidos().get(i).getORDEN_PEDIDO_id_pedido() == id_ped) {//si el pedido es encontrado

                                detalle_pedido det = mane_ped.getDetallePedidos().get(i);

                                for (int p = 0; p < mane_prod.getProducto().size(); p++) {
                                    Producto pro = mane_prod.getProducto().get(p);

                                    if (pro.getId_producto() == det.getPRODUCTOS_id_producto()) {
                                        out.print(""
                                                + "<tr>"
                                                + "<td>" + pro.getNombre() + "</td>");
                                        out.print(""
                                                + "<td>" + det.getCantidad() + "</td>"
                                                + "</tr>");
                                    }

                                }
                            }

                        }
                       
                                 out.print("<a href='aux_eliminar.jsp?id="+id_ped+"&accion=aceptar'>Aceptar</a> ");

                    } else {

                    }

                %>




            </tbody>
        </table>

    </body>
</html>
