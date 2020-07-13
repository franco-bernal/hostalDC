<%@page import="Modelo.Entidades.Producto"%>
<%@page import="Modelo.Manejadoras.Manejadora_productos"%>
<%@page import="Modelo.Entidades.Orden_pedido"%>
<%@page import="Modelo.Manejadoras.Manejadora_pedidos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Proveedor </title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
        <link href="css/pruebas.css" rel="stylesheet" type="text/css"/>
        <link href="css/Util.css" rel="stylesheet" type="text/css"/>   
        <link href="css/proveedor.css" rel="stylesheet" type="text/css"/>

    </head>

    <body data-spy="scroll" class="text-capitalize fon cen letras" data-target="#navbar-example2">

        <nav id="navbar-example2" class="navbar navbar-dark bg-dark men" style="position: fixed;">
            <%            HttpSession sesion = request.getSession();
                String usuario = sesion.getAttribute("user").toString();
                String aint = sesion.getAttribute("tipo").toString();
                String rut = sesion.getAttribute("rut").toString();

                int tip = Integer.parseInt(aint);
                String tipo;

                if (tip == 3) {
                    tipo = "proveedor";
                } else {
                    tipo = "salir";

                }
            %>


            <a class="navbar-brand"  href="#"><%out.print(usuario);%></a>
            <ul class="nav nav-pills">
                <li class="nav-item">
                    <a class="btn btn-sm btn-outline-secondary nav-link" type="button" href="#inicio">Inicio </a>
                </li>
                <li class="nav-item">
                    <a class="btn btn-sm btn-outline-secondary nav-link" type="button" href="#pedidos">Mis pedidos</a>
                </li>

                <form action="ControlUsuario">
                    <input action="ControlUsuario" class="btn btn-sm btn-outline-secondary nav-link" type="submit"  name="accion" value="Salir">
                </form>
            </ul>
        </nav>


        <div class="fo" >  

            <div data-spy="scroll">

                <div   class="usu">
                    <p> <% out.print(usuario);%> </p>
                </div>
                <div class="let" class="tipo">
                    <p> <% out.print(tipo);%> </p>
                </div>

            </div>
        </div>

   <br>
            <!--Modal de ayuda -->            
            <button type="button" data-toggle="modal" data-target=".bd-example-modal-lg">Ayuda</button>

            <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <embed src="pdf/CASO.pdf#page=3" type="application/pdf" width="100%" height="600px" />
                    </div>
                </div>
            </div>
            <!--Fin Modal   <object  data="pdf/CASO.pdf#page=2"></object>                         <iframe  src="pdf/CASO.pdf#page=2"></iframe>-->

        <!--|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
        <%
            Manejadora_pedidos mane_ped = new Manejadora_pedidos();
            Manejadora_productos mane_prod = new Manejadora_productos();
            Orden_pedido ord = new Orden_pedido();
            Producto prod = new Producto();

        %>


        <div id="tabla" clas="cent" > 

            <br>

            <h4 >Mis pedidos </h4>

            <div id="customers" class="container "   >   
                <div  id="tabla"  class="customers" class="container">
                    <div class="container ">
                        <div>
                            <h4>Lista de compras</h4>
                            <table>
                                <thead>
                                    <tr>
                                        <th scope="col">IdPedido</th>
                                        <th scope="col">Fecha de Emisión</th>
                                        <th scope="col">Aceptar/Rechazar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!--Elementos tr de la tabla-->
                                    <tr>

                                        <%                            for (int i = 0; i < mane_ped.getPedido().size(); i++) {

                                                ord = mane_ped.getPedido().get(i);
                                                if (ord.getProveedor_rut().compareToIgnoreCase(rut) == 0) {
                                                    prod = mane_prod.obtenerProductoPorId(ord.getId_pedido());
                                                    if (ord.getEstado() == 2) {
                                                        out.print(""
                                                                + "<tr>"
                                                                + "<td>N°" + ord.getId_pedido() + "</td>"
                                                                + "<td>" + ord.getF_emicion() + "</td>"
                                                                + "<td class='row'>"
                                                                + "<a href='detalle_pedido.jsp?id=" + ord.getId_pedido() + "'>Revisar</a>"
                                                                + "<a href='aux_eliminar.jsp?id=" + ord.getId_pedido() + "&accion=rechazar'>Rechazar</a> "
                                                                + "</td>"
                                                                + "</tr>");

                                                    }
                                                    if (ord.getEstado() == 3) {//procesado
                                                        out.print(""
                                                                + "<tr class='table-success'>"
                                                                + "<td>N°" + ord.getId_pedido() + "</td>"
                                                                + "<td>" + ord.getF_emicion() + "</td>"
                                                                + "<td class='row'>"
                                                                + "Enviado"
                                                                + "</td>"
                                                                + "</tr>");
                                                    }
                                                    if (ord.getEstado() == 0) {//rechazado
                                                        out.print(""
                                                                + "<tr class='table-success'>"
                                                                + "<td>N°" + ord.getId_pedido() + "</td>"
                                                                + "<td>" + ord.getF_emicion() + "</td>"
                                                                + "<td class='row'>"
                                                                + "Rechazado"
                                                                + " </td>"
                                                                + " </tr>");
                                                    }
                                                }
                                            }
                                            //     + "<td>"+mane_ped.EstadoDelPedido(ord.getEstado())+"</td>"
                                        %>

                                </tbody>
                            </table>
                        </div>



                        <!--|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->

                    </div>
                </div>
            </div>
        </div>
        <br>
        <br>
        <br>
        <br>
        <div id="accesos">  
            <div class="pro"  id="customers" class="container " >

                <h4>Agregar Productos</h4>

                <form action="ControlPedido" method="post">
                    <p>Pedido</p>
                    <input type='text' class='form-control desactivar' name='txt_rut' value="<%=rut%>">

                    <label>Nombre Producto</label>
                    <input type="text" name="txt_nombre" maxlength="10" >
                    <br>
                    <label>Detalle Producto</label>
                    <input type="text" name="txt_detalle" maxlength="20" >
                    <br>
                    <label>Valor</label>
                    <input type="number" name="txt_valor" min="1" max="1000000" >
                    <br>

                    <input type="checkbox"  required="true">
                    <label >Revise los datos</label>
                    <br>
                    <button type="submit"  name="accion" value="insert_prod">Agregar al carro</button>
                </form>
            </div>
        </div>
        <br>
        <br>
        <br> 
        <div>
            <div id="customers" class="container " >
                <div id="customers" class="container " >   
                    <div  class="customers" class="container">
                        <div class="container table-sm col-lg-10" >


                            <div class="ex3">

                                <table class="table center-block" >

                                    <thead>
                                        <tr>
                                            <th>Nombre</th>
                                            <th>Detalle</th>
                                            <th>Valor</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            if (mane_prod.getProducto().size() > 0) {
                                                for (int i = 0; i < mane_prod.getProducto().size(); i++) {
                                                    Producto pro = mane_prod.getProducto().get(i);
                                                    if (pro.getProveedor_rut().compareToIgnoreCase(rut) == 0) {
                                                        out.print(""
                                                                + "<tr>"
                                                                + "<td>" + pro.getNombre() + "</td>"
                                                                + "<td>" + pro.getDetalle() + "</td>"
                                                                + "<td>" + pro.getValor() + "</td>"
                                                                + "</tr>");
                                                    }
                                                }
                                            } else {
                                                out.print(""
                                                        + "<tr>"
                                                        + "<td>No tiene productos registrados</td>"
                                                        + "</tr>");
                                            }

                                            //    
                                        %>

                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%            if (sesion.getAttribute("user") == null || sesion.getAttribute("clave") == null) {
                sesion.setAttribute("user", null);
                sesion.invalidate();
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        %>

        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <br>
        <br>  
        <br>
        <br>  
        <br>
        <br> 
    </body>
</html>