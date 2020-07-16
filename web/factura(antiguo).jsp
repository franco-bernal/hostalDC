<%-- 
    Document   : factura
    Created on : 07-07-2020, 20:50:25
    Author     : Enfoks
--%>


<%@page import="Modelo.Manejadoras.Manejadora_huesped"%>
<%@page import="Modelo.Manejadoras.Manejadora_minuta"%>
<%@page import="Modelo.Manejadoras.Manejadora_hab"%>
<%@page import="java.sql.Date"%>
<%@page import="Modelo.Manejadoras.Manejadora_usuario"%>
<%@page import="Modelo.Entidades.Usuario"%>
<%@page import="Modelo.Entidades.UsuarioCli_detalle"%>
<%@page import="Modelo.Manejadoras.Manejadora_cliente"%>
<%@page import="Modelo.Entidades.Orden_compra"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Entidades.Factura"%>
<%@page import="Modelo.Manejadoras.Manejadora_factura"%>
<%@page import="Modelo.Manejadoras.Manejadora_orden"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link href="css/factura.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">



        <%
            Manejadora_orden mane_ord = new Manejadora_orden();
            Manejadora_factura mane_fac = new Manejadora_factura();
            Manejadora_cliente mane_cli = new Manejadora_cliente();
            Manejadora_usuario mane_usu = new Manejadora_usuario();
            Manejadora_huesped mane_hue = new Manejadora_huesped();
            Manejadora_hab mane_ha = new Manejadora_hab();
            Manejadora_minuta mane_mi = new Manejadora_minuta();

            HttpSession hue = request.getSession();
            Factura fac = null;
            ArrayList<Orden_compra> arrayCompras = null;
            UsuarioCli_detalle cli = null;
            Usuario usu = null;

            java.sql.Date f_ven = null;
            int cod_orden = 0;
            int cant_pagos = 0;
            String opc = "";
            opc = hue.getAttribute("opc").toString();
            int cod_factura = 0;

            try {
                cod_factura = Integer.parseInt(hue.getAttribute("cod_factura").toString());
                fac = mane_fac.obtenerFacturaPorCod(cod_factura);
            } catch (Exception e) {
                out.print("error " + cod_factura + " - " + fac.getCod_factura() + " - " + opc);
            }

            try {

                if (fac != null) {

                    arrayCompras = mane_ord.listaDeComprasPorFactura(cod_factura);

                    int o = 0;
                    if (opc.compareToIgnoreCase("uno") == 0) {
                        o = 1;
                    }
                    if (opc.compareToIgnoreCase("todos") == 0) {
                        o = 2;
                    }
                    switch (o) {
                        case 1:
                            cant_pagos = 1;
                            break;
                        case 2:
                            cant_pagos = arrayCompras.size();
                            break;
                        default:
                            request.getRequestDispatcher("cliente_home.jsp").forward(request, response);
                    }
                    if (arrayCompras != null) {
                        cli = mane_cli.obtenerClienteCompleto(arrayCompras.get(0).getCliente_rut_emp());
                    }

                    if (cli != null) {
                        usu = mane_usu.obtenerUsuarioPorId(cli.getUsuario_id_usuario());
                        f_ven = mane_fac.fecha_vencimiento(fac.getF_emicion());
                    }
                    ////////////////////////////////////////
                } else {
                    out.print("factura no encontrada");
                }

            } catch (Exception e) {
                out.print("Vuelva a intentarlo por favor");
            }


        %>



    </head>
    <body>

    </div><div id="app" class="col-11">

        <h2>Factura</h2>
        <p>N°<%=fac.getCod_factura()%></p>

        <hr />

        <div class="row fact-info mt-3">
            <div class="col-3">
                <h5>Facturar a</h5>
                <p>
                    <%out.print(cli.getNom_emp()); %>
                </p>
            </div>
            <div class="col-3">
                <h5>Enviar a</h5>
                <p>
                    <%out.print(cli.getDir_emp()); %>
                </p>
                <p>
                    <%out.print(usu.getCorreo());%>
                </p>
            </div>
            <div class="col-3">
                <h5>N° de factura</h5>
                <h5>Fecha</h5>
                <h5>Fecha de vencimiento</h5>
            </div>
            <div class="col-3">
                <h5> n° <%=fac.getCod_factura()%></h5>
                <p><%=fac.getF_emicion()%></p>
                <p><%=f_ven%></p>
            </div>
        </div>

        <!-- -->
        <div class="row my-5">
            <table class="table table-borderless factura">
                <thead>
                    <tr>
                        <th>Cod.Compra</th>
                        <th>Minuta x semana</th>
                        <th>Valor por dia</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (int i = 0; i < cant_pagos; i++) {
                            String tipo_hab = mane_ha.obtenerTipoHab(arrayCompras.get(i).getTipo_hab());
                            String tipo_mi = mane_mi.obtenerTipoMinuta(arrayCompras.get(i).getTipo_min());
                            out.print(""
                                    + " <tr>"
                                    + " <td>" + arrayCompras.get(i).getCodigo_compra() + "</td>"
                                    + "<td>" + tipo_mi + " $" + mane_mi.valorMinuta(arrayCompras.get(i).getTipo_min()) + " x " + mane_ord.cantidadDias(arrayCompras.get(i).getCodigo_compra()) + " días </td>"
                                    + "<td>hab simple:$" + mane_ha.getTipo().get(i).getValor_hab() + " hab com:$" + mane_mi.getTipo().get(i).getValor_minuta() + "</td>"
                                    + "<td>" + mane_hue.cantidadHuespedesOrdenCompra(arrayCompras.get(i).getCodigo_compra()) + "</td>"
                                    + " </tr>");
                        }
                    %>

                </tbody>
                <tfoot>
                    <tr>
                        <th></th>
                        <th></th>
                        <th>Total Factura</th>
                        <th>$<%=fac.getValor_total()%>.-</th>
                    </tr>
                </tfoot>
            </table>
        </div>
        <!-- -->

        <div class="cond row">
            <div class="col-12 mt-3">
                <h4>Condiciones y formas de pago</h4>
                <p>El pago se debe realizar en un plazo de 15 dias.</p>
                <p>
                    Banco Estado
                    <br />
                    Cuenta corriente 0075 20 20 4060
                    <br />
                </p>
            </div>
        </div>
    </div>






    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    </body>
</html>
