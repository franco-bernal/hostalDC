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
            int cod_orden=0;
            String opc = hue.getAttribute("opc").toString();
            int cod_factura = 0;

            try {
                cod_orden=Integer.parseInt(hue.getAttribute("cod_orden").toString());
                cod_factura = Integer.parseInt(hue.getAttribute("cod_factura").toString());
                fac = mane_fac.obtenerFacturaPorCod(cod_factura);
                out.print(cod_factura + " - " + fac.getCod_factura() + " - " + opc);
            } catch (Exception e) {
                out.print(cod_factura + " - " + fac.getCod_factura() + " - " + opc);
            }

            try {

                if (fac != null) {

                    if (opc.compareToIgnoreCase("uno") == 0) {
                        arrayCompras=new ArrayList<Orden_compra>(mane_ord.listaComprasPorCodigo(cod_orden));
                        cli = mane_cli.obtenerClienteCompleto("13.555.555-k");
                        out.print(" - - - - "+cli.getNom_emp());

                    }/* else {
                        arrayCompras = mane_ord.listaDeComprasPorFactura(cod_factura);
                        out.print("todos");
                    }
*/
                    if (arrayCompras != null) {
                        cli = mane_cli.obtenerClienteCompleto(arrayCompras.get(0).getCliente_rut_emp());
                        if (cli != null) {
                            usu = mane_usu.obtenerUsuarioPorId(cli.getUsuario_id_usuario());
                            f_ven = mane_fac.fecha_vencimiento(fac.getF_emicion());
                            out.print("Factura cargada.");
                        } else {
                            out.print("cli if");
                        }
                    } else {
                        out.print("array if");
                    }

                } else {
                    out.print("fac if");
                }

            } catch (Exception e) {
                out.print("_los if..." + e.toString() + "---------------" + fac.getCod_factura());
            }


        %>
    </head>
    <body>

        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </body>
</html>
