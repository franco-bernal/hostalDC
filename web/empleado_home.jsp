<%@page import="Modelo.Manejadoras.Manejadora_pedidos"%>
<%@page import="Modelo.Manejadoras.Manejadora_proveedor"%>
<%@page import="Modelo.Entidades.Orden_compra"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Util"%>
<%@page import="Modelo.Entidades.UsuarioEmpleado"%>
<%@page import="Modelo.Manejadoras.Manejadora_empleado"%>
<%@page import="Modelo.Entidades.UsuarioCli_detalle"%>
<%@page import="Modelo.Manejadoras.Manejadora_cliente"%>
<%@page import="Modelo.Manejadoras.Manejadora_orden"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html >
    <head>
        <meta http-equiv=”Content-Type” content=”text/html; charset=UTF-8″ />
        <title>Home Empleado</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link href="css/empleado.css" rel="stylesheet" type="text/css"/>
        <link href="css/Util.css" rel="stylesheet" type="text/css"/>
    </head>

    <body  data-spy="scroll" class="text-capitalize letras text-center "  data-target="#navbar-example2">
        <%
            try {
        %>

        <nav id="navbar-example2" class="navbar navbar-dark bg-dark men" style="position: fixed;">
            <%
                HttpSession sesion = null;
                String usuario = "";
                String aint = "";
                String rut = "";
                Manejadora_orden mane_ord = null;
                Manejadora_cliente mane_cli = null;
                String tipo = "";

                try {
                    mane_ord = new Manejadora_orden();
                    mane_cli = new Manejadora_cliente();
                    sesion = request.getSession();
                    usuario = sesion.getAttribute("user").toString();
                    aint = sesion.getAttribute("tipo").toString();
                    rut = sesion.getAttribute("rut").toString();
                } catch (Exception e) {
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
                int tip = Integer.parseInt(aint);

                if (tip == 2) {
                    tipo = "Empleado";
                } else {
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }

            %>





            <a class="navbar-brand " href="#"><%out.print(usuario);%></a>
            <ul class="nav nav-pills">
                <li class="nav-item">
                    <a class="btn btn-sm btn-outline-secondary nav-link" type="button"  href="#recepcion">Recepcion huespedes</a>
                </li>
                <li class="nav-item">
                    <a class="btn btn-sm btn-outline-secondary nav-link" type="button"   href="#pedidos">Recepcion pedidos</a>
                </li>
                <li class="nav-item">
                    <a class="btn btn-sm btn-outline-secondary nav-link" type="button"  href="#pedir">Generar pedido</a>
                </li>
                <li class="nav-item">
                    <a class="btn btn-sm btn-outline-secondary nav-link" type="button"   href="#minuta">Agregar minuta</a>
                </li>
                <li class="nav-item">
                    <a class="btn btn-sm btn-outline-secondary nav-link" type="button"   href="#lista">Lista de minutas</a>
                </li>
                <form action="ControlUsuario">
                    <input action="ControlUsuario" class="btn btn-sm btn-outline-secondary" type="submit"  name="accion" value="Salir">
                </form>
            </ul>

        </nav>

        <div class="giga" data-spy="scroll">
            <br>
            <br>
            <br>


            <div  class="usu">
                <p> <% out.print(usuario);%> </p>
            </div>

            <div  class="tipo">
                <p> <% out.print(tipo);%> </p>
            </div>

        </div>

        <div class="fon" data-spy="scroll" data-target="#navbar-example2" data-offset="0" >  
            <!-- ....................... -->
            <!-- ....................... -->


            <!------------------------------------------------------------------------------------------->
            <!-- ....................... -->
            <!--Recepción Huespedes listado -->
            <h4  class="mb-5 mar" id="recepcion">Recepción Huespedes </h4>


            <div  id="customers" class="container " >
                <div>
                    <div>
                        <%
                            try {
                                if (mane_cli.getCliente().size() > 0) {//tamaño de la lista de clientes completa
                                    for (int i = 0; i < mane_cli.getCliente().size(); i++) {//cliente por cliente
                                        if (mane_ord.cantidadDeOrdenes(mane_cli.getCliente().get(i).getRut_emp()) > 0) {//se revisa si es mayor a 0 la cantidad
                                            //acordeon boton
                                            out.print("<div class='accordion' id='accordionExample'>"
                                                    + "<div class='card'>"
                                                    + "<div class='card-header' id='heading" + i + "'>"
                                                    + "<h2 class='mb-0'>"
                                                    + "<button class=' btn  btn-block text-center' type='button' data-toggle='collapse' data-target='#collapse" + i + "' aria-expanded='true' aria-controls='collapse" + i + "' >"
                                                    + mane_cli.getCliente().get(i).getNom_emp() + " | " + mane_cli.getCliente().get(i).getRut_emp()
                                                    + " </button>"
                                                    + "</h2>"
                                                    + "</div>");
                                            /////////////////termino boton/////////////////////////////
                                            out.print("<div id='collapse" + i + "'  aria-labelledby='heading" + i + "' data-parent='#accordionExample' >"
                                                    + "<div>");
                                            ///////////comienza el body////////////
                                            Manejadora_orden ord = new Manejadora_orden();
                                            ArrayList<Orden_compra> arrayC = ord.listaComprasPorRUT(mane_cli.getCliente().get(i).getRut_emp());//se rellena el arrayC con la lista buscada por rut

                                            //se colocan las columnas
                                            out.print("<table class='table center-block container-fluid' >"
                                                    + "<thead>"
                                                    + "<tr>"
                                                    + "<th>codigo</th>"
                                                    + "<th>desde</th>"
                                                    + "<th>hasta</th>"
                                                    + "<th>fecha comprado</th>"
                                                    + "</tr>"
                                                    + "</thead>"
                                                    + "<tbody>");
                                            //fin columnas

                                            for (int e = 0; e < arrayC.size(); e++) {//recorre la lista filtrada por rut

                                                int id = mane_cli.obtenerIdUsuario(mane_cli.getCliente().get(i).getRut_emp());
                                                String rut_o = mane_cli.obtenerRutUsuario(id);
                                                Util util = new Util();
                                                String nom_mi = "";
                                                String nom_hab = "";
                                                String cod = String.valueOf(arrayC.get(e).getCodigo_compra());
                                                //nom_mi = util.tipo_min_nom(ord.getOrden().get(i).getTipo_min());
                                                //nom_hab = util.tipo_hab_nom(ord.getOrden().get(i).getTipo_hab());

                                                out.print("<tr>"
                                                        + "<td> #" + cod + "</td>"
                                                        + "<td>" + arrayC.get(e).getF_inicio() + "</td>"
                                                        + "<td>" + arrayC.get(e).getF_fin() + "</td>"
                                                        + "<td>" + arrayC.get(e).getF_compra() + "</td>"
                                                        + "<td><a href='recep_ha.jsp?id=" + arrayC.get(e).getCodigo_compra() + "&rut=" + mane_cli.getCliente().get(i).getRut_emp() + "' class='btn btn-warning btn-sm'>rece</a></td>"
                                                        + "</tr>");
                                            }

                                            out.print("</tbody>"
                                                    + "</table>"
                                                    + "</div>"
                                                    + "</div>"
                                                    + "</div>");

                                        }
                                    }
                                } else {
                                    out.print("<p>no hay clientes<p>");
                                }
                            } catch (Exception e) {
                                request.getRequestDispatcher("login.jsp").forward(request, response);
                            }
                        %>

                        <br>
                        <br
                            <hr>
                    </div>
                </div>
            </div>

            <!-- ....................... -->
            <!--FIN: Recepción Huespedes listado -->
            <!------------------------------------------------------------------------------------------->            
            <!-- ....................... -->
            <!--Recepción pedidos Listado-->
            <h4  class="mb-5 mar" id="pedidos">Recepción pedidos </h4>


            <div  id="customers" class="container" >

                <br>
                <div >
                    <div >
                        <table class="table center-block">
                            <thead>
                                <tr>
                                    <th>Proveedor</th>
                                    <th>rubro</th>
                                    <th>emitido</th>
                                    <th>Estado</th>

                                </tr>
                            </thead>

                            <%
                                Manejadora_proveedor mane_prov = new Manejadora_proveedor();
                                Manejadora_pedidos mane_ped = new Manejadora_pedidos();
                                String rutProveedor;
                                String rutPedido;
                                for (int i = 0; i < mane_prov.getProveedor().size(); i++) {

                                    for (int e = 0; e < mane_ped.getPedido().size(); e++) {

                                        rutProveedor = mane_prov.getProveedor().get(i).getRut();
                                        rutPedido = mane_ped.getPedido().get(e).getProveedor_rut();
                                        try {

                                            if (rutProveedor.compareToIgnoreCase(rutPedido) == 0) {
                                                out.print("<tbody>"
                                                        + "<td>" + mane_prov.getProveedor().get(i).getNom_empresa() + "</td>"
                                                        + "<td>" + mane_prov.getProveedor().get(i).getRubro() + "</td>"
                                                        + "<td>" + mane_ped.getPedido().get(e).getF_emicion() + "</td>"
                                                        + "<td>"
                                                        + "<button type='button' class='btn btn-success'>Recibido</button>"
                                                        + "<button type='button' class='btn btn-danger'>falta</button>"
                                                        + "</td>"
                                                        + "</tbody>");

                                            }

                                        } catch (Exception u) {

                                        }
                                    }

                                }


                            %>

                        </table>
                        <br>
                        <br

                    </div>
                </div>
            </div>
            <!--FIN: Recepción pedidos Listado-->
            <!------------------------------------------------------------------------------------------->            



            <!-- FORM PEDIDOS-->
            <!-- herramientas para los pedidos -->

            <!-- FIN herramientas para los pedidos -->
            <hr class="aba mar" id="pedir">

            <h4  class=" mb-5 mar">Generar pedido </h4>
            <div class="container col-lg-5 col-sm-12 col-xs-5 mar"> 

                <form action="ControlPedido" method="post">
                    <div class="col-sm">
                        <p class="p-3 mb-2 bg-dark text-white text-center ">Pedido</p>
                        <div class="form-group">
                            <label for="sel1" class="mt-2">Seleccionar proveedor</label>
                            <select class="form-control" name="select_prov" id="sel1">
                                <%                                    try {
                                        if (mane_prov.getProveedor().size() == 0) {
                                            out.print("<option>Aún no hay proveedores</option>");
                                        } else {
                                            for (int i = 0; i < mane_prov.getProveedor().size(); i++) {
                                                out.print("<option>" + mane_prov.getProveedor().get(i).getNom_empresa() + "</option>");
                                            }
                                        }
                                    } catch (Exception e) {
                                        out.print("<option>Error en esta area</option>");
                                    }


                                %>
                            </select>
                        </div>
                    </div>
                    <hr>
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input"  required="true">
                        <label class="form-check-label" for="exampleCheck1">Revisé los datos</label>
                    </div>
                    <button type="submit" class="btn btn-dark" name="accion" value="ComenzarPedido">Comenzar pedido</button>
                </form>
            </div>
            <!--FIN: FORM PEDIDOS-->
            <!------------------------------------------------------------------------------------------->

            <hr class="aba mar" id="minuta">
            <h4>Agregar minuta </h4>
            <div class="container col-lg-5 col-sm-12 col-xs-5 mar"> 
                <form action="ControlCliente" method="POST">
                    <div class="col-sm">
                        <p class="p-3 mb-2 bg-dark text-white text-center ">Agregar minuta</p>
                        <input type="text" class="form-control" name="txt_titulo" placeholder="titulo" required="true" maxlength="18">
                        <input type="text" class="form-control" name="txt_f_fin" placeholder="desayuno" required="true" maxlength="20">
                        <input type="email" class="form-control" name="txt_cantidad" placeholder="almuerzo" required="true" maxlength="30">
                        <input type="email" class="form-control" name="txt_cantidad" placeholder="once" required="true" maxlength="30">
                        <input type="email" class="form-control" name="txt_cantidad" placeholder="cena" required="true" maxlength="30">
                        <input type="email" class="form-control" name="txt_cantidad" placeholder="valor" required="true" maxlength="30">
                    </div>
                    <hr>
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input"  required="true">
                        <label class="form-check-label" for="exampleCheck1">Revisé los datos</label>
                    </div>
                    <button type="submit" class="btn btn-dark" name="accion" value="RegistrarCli">Enviar Minuta</button>

                </form>
                <hr class="aba mar">
            </div>


<!--minutas----------------------------------------------------------------------------------------------->
<button type="button" class="" data-toggle="modal" data-target=".bd-example-modal-lg">Lista de minutas</button>

<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content text-center">
        <!-- la siguiente linea incluye la minuta.jsp -->
        <jsp:include page="minuta.jsp" />
    </div>
  </div>
</div>
<!--FIn:-minutas------------------------------------------------------------------------------------------>
            <hr class="aba mar" id="lista">


            <h4  class="mb-5 mar">Lista de minutas </h4>
            <div class="container-fluid col-lg-10 col-sm-12 col-xs-5 mb-5 mar"> 
                <table class="table table-hover ">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Tipo</th>
                            <th scope="col">desayuno</th>
                            <th scope="col">almuerzo</th>
                            <th scope="col">once</th>
                            <th scope="col">cena</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>General</td>
                            <td>pan, te o cafe, huevos</td>
                            <td>Tallarines y ensalada</td>
                            <td>Te o cafe, pan</td>
                            <td>Un sandwich de pan integral con filete de pollo</td>

                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>Especial</td>
                            <td>Pan, Te o cafe, jugo, Tostadas</td>
                            <td>Entrada, Plato de fondo, ensalada y postre</td>
                            <td>Pan, Te o cafe</td>
                            <td>Crema de verduras.</td>

                        </tr>

                    </tbody>
                </table>
            </div>


            <hr class="aba mar" id="lista">

            <!-- -->
        </div>
    </div>


</div>





<%    if (sesion.getAttribute("user") == null || sesion.getAttribute("clave") == null) {
            sesion.setAttribute("user", null);
            sesion.invalidate();
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    } catch (Exception e) {
        request.setAttribute("desde", "empleado_home.jsp");
        request.setAttribute("pag", "login.jsp");
        request.setAttribute("titulo", "Inicie sesion otra vez.");
        request.setAttribute("detalle", "Algo ha salido mal en la pagina.");
        request.setAttribute("sms", "falló empleado_home");
        request.setAttribute("tipo", "error");

        request.getRequestDispatcher("true.jsp").forward(request, response);

    }
%>


<script src="js/form.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


</body>
</html>