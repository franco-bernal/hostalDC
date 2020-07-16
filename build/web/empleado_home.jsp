<%@page import="Modelo.Entidades.Minuta"%>
<%@page import="Modelo.Manejadoras.Manejadora_minuta"%>
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
<html>
    <head>
        <meta http-equiv=”Content-Type” content=”text/html; charset=UTF-8″ />
        <title>Home Empleado</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link href="css/empleado.css" rel="stylesheet" type="text/css"/>
        <link href="css/Util.css" rel="stylesheet" type="text/css"/>





    </head>

    <body data-spy="scroll" class="text-capitalize letras text-center "  data-target="#navbar-example2">


        <%
            try {
        %>


        <nav id="navbar-example2" class="navbar navbar-dark bg-dark men" style="position: fixed;">

            <%
                Manejadora_orden mane_ord = null;
                Manejadora_cliente mane_cli = null;
                HttpSession sesion = null;
                String usuario = "";
                String aint = "";
                String rut = "";
                String tipo = "";

                try {
                    mane_ord = new Manejadora_orden();
                    mane_cli = new Manejadora_cliente();
                    sesion = request.getSession();
                    usuario = sesion.getAttribute("user").toString();
                    aint = sesion.getAttribute("tipo").toString();
                    rut = sesion.getAttribute("rut").toString();
                } catch (Exception e) {
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }

                int tip = Integer.parseInt(aint);

                if (usuario.compareToIgnoreCase("hostaldc") == 0) {
                    tipo = "Admin";
                } else {
                    if (tip == 2) {
                        tipo = "Empleado";
                    }
                }

            %>



            <a class="navbar-brand " href="#"><%out.print(usuario);%></a>
            <ul class="nav nav-pills">
                <li class="nav-item">
                    <a class="btn btn-sm btn-outline-secondary nav-link" type="button"  href="#recepcion">Recepcion Huespedes</a>
                </li>
                <li class="nav-item">
                    <a class="btn btn-sm btn-outline-secondary nav-link" type="button"   href="#pedidos">Recepcion Pedidos</a>
                </li>
                <li class="nav-item">
                    <a class="btn btn-sm btn-outline-secondary nav-link" type="button"  href="#pedir">Generar Pedido</a>
                </li>
                <li class="nav-item">
                    <a class="btn btn-sm btn-outline-secondary nav-link" type="button"   href="#minuta">Agregar Minuta</a>
                </li>
                <li class="nav-item">
                    <a class="btn btn-sm btn-outline-secondary nav-link" type="button"   href="#lista">Lista de Minutas</a>
                </li>
                <%
                    if (tipo == "Admin") {
                        out.print("<a class='btn btn-sm btn-outline-secondary nav-link' href='ad.jsp?id=ok'>Volver a admin</a>");
                    } else {
                        out.print(""
                                + "<form action='ControlUsuario'>"
                                + "<input action='ControlUsuario' class='btn btn-sm btn-outline-secondary nav-link' type='submit'  name='accion' value='Salir'>"
                                + "</form>");
                    }
                %>
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



            <!------------------------------------------------------------------------------------------->
            <!-- ....................... -->
            <!--Recepción Huespedes listado -->
            <br>
            <h4  id="recepcion">Recepción Huespedes </h4>


            <div  id="customers" class="container " >
                <div>
                    <div>

                        <%

                            try {
                                if (mane_cli.getCliente().size() > 0) {//tamaño de la lista de clientes completa
                                    for (int i = 0; i < mane_cli.getCliente().size(); i++) {//cliente por cliente
                                        if (mane_ord.cantidadDeOrdenes(mane_cli.getCliente().get(i).getRut_emp()) > 0) {//se revisa si es mayor a 0 la cantidad
                                            //acordeon boton

                                            out.print("<div  class='accordion'  id='accordionExample'    >"
                                                    + "<div class='card' >"
                                                    + "<div class='card-header' id='heading" + i + "'>"
                                                    + "<h2  class='mb-0'>"
                                                    + "<button  class=' btn  btn-block text-center' type='button' data-toggle='collapse' data-target='#collapse" + i + "' aria-expanded='true' aria-controls='collapse" + i + "' >"
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
                                    out.print("<p>No hay Clientes<p>");
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
            <hr>
            <br>
            <h4>Recepción Pedidos </h4>
            <br>

            <div id="customers" class="centrar" >

                <div style="text-align:center;" >




                    <div class=" col-lg-5 col-sm-12 col-xs-5 " >
                        <div class="ex3" >

                            <table WIDTH="600"  >

                                <thead  >
                                    <tr>
                                        <th>id</th>
                                        <th>Proveedor</th>
                                        <th>Rubro</th>
                                        <th>Emitido</th>
                                        <th>Estado</th>

                                    </tr>
                                </thead>

                                <%                                    Manejadora_proveedor mane_prov = new Manejadora_proveedor();
                                    Manejadora_pedidos mane_ped = new Manejadora_pedidos();
                                    String rutProveedor;
                                    String rutPedido;
                                    for (int i = 0; i < mane_prov.getProveedor().size(); i++) {

                                        for (int e = 0; e < mane_ped.getPedido().size(); e++) {

                                            rutProveedor = mane_prov.getProveedor().get(i).getRut();
                                            rutPedido = mane_ped.getPedido().get(e).getProveedor_rut();
                                            try {

                                                if (rutProveedor.compareToIgnoreCase(rutPedido) == 0) {
                                                    if (mane_ped.getPedido().get(e).getEstado() == 4) {
                                                        out.print("<tbody>"
                                                                + "<td>" + mane_ped.getPedido().get(e).getId_pedido() + "</td>"
                                                                + "<td>" + mane_prov.getProveedor().get(i).getNom_empresa() + "</td>"
                                                                + "<td>" + mane_prov.getProveedor().get(i).getRubro() + "</td>"
                                                                + "<td>" + mane_ped.getPedido().get(e).getF_emicion() + "</td>"
                                                                + "<td>"
                                                                + "<button type='button' class='btn btn-success'>Recibido</button>"
                                                                + "<button type='button' class='btn btn-danger'>Falta</button>"
                                                                + "</td>"
                                                                + "</tbody>");
                                                    }
                                                    if (mane_ped.getPedido().get(e).getEstado() == 3) {
                                                        out.print("<tbody>"
                                                                + "<td>" + mane_ped.getPedido().get(e).getId_pedido() + "</td>"
                                                                + "<td>" + mane_prov.getProveedor().get(i).getNom_empresa() + "</td>"
                                                                + "<td>" + mane_prov.getProveedor().get(i).getRubro() + "</td>"
                                                                + "<td>" + mane_ped.getPedido().get(e).getF_emicion() + "</td>"
                                                                + "<td>aceptado</td>"
                                                                + "</tbody>");
                                                    }
                                                    if (mane_ped.getPedido().get(e).getEstado() == 2) {
                                                        out.print("<tbody>"
                                                                + "<td>" + mane_ped.getPedido().get(e).getId_pedido() + "</td>"
                                                                + "<td>" + mane_prov.getProveedor().get(i).getNom_empresa() + "</td>"
                                                                + "<td>" + mane_prov.getProveedor().get(i).getRubro() + "</td>"
                                                                + "<td>" + mane_ped.getPedido().get(e).getF_emicion() + "</td>"
                                                                + "<td>enviado</td>"
                                                                + "</tbody>");
                                                    }
                                                    if (mane_ped.getPedido().get(e).getEstado() == 0) {
                                                        out.print("<tbody>"
                                                                + "<td>" + mane_ped.getPedido().get(e).getId_pedido() + "</td>"
                                                                + "<td>" + mane_prov.getProveedor().get(i).getNom_empresa() + "</td>"
                                                                + "<td>" + mane_prov.getProveedor().get(i).getRubro() + "</td>"
                                                                + "<td>" + mane_ped.getPedido().get(e).getF_emicion() + "</td>"
                                                                + "<td>Rechazado</td>"
                                                                + "</tbody>");
                                                    }

                                                }

                                            } catch (Exception u) {

                                            }
                                        }

                                    }


                                %>

                            </table>
                        </div>
                        <br>
                        <br

                    </div>
                </div>
            </div>
        </div>

        <!--FIN: Recepción pedidos Listado-->
        


        <!------------------------------------------------------------------------------------------->            



        <!-- FORM PEDIDOS-->
        <!-- herramientas para los pedidos -->

        <!-- FIN herramientas para los pedidos -->

        <hr>
        <br>
        <h4  class=" mb-5">Generar Pedido </h4>
        <div class="container col-lg-5 col-sm-12 col-xs-5"> 

            <form action="ControlPedido" method="post">
                <input type='text' class='form-control desactivar' name='txt_rut_emp' value="<%=rut%>">

                <div class="col-sm">
                    <p class="p-3 mb-2 bg-dark text-white text-center ">Pedido</p>
                    <div class="form-group">
                        <label for="sel1" class="mt-2">Seleccionar Proveedor</label>
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
                    <label class="form-check-label" for="exampleCheck1">Revise los Datos</label>
                </div>
                <button type="submit" class="btn btn-dark" name="accion" value="ComenzarPedido">Comenzar Pedido</button>
            </form>
        </div>
        <!--FIN: FORM PEDIDOS-->
        <br>
        <br>
        <br>
        <!------------------------------------------------------------------------------------------->
        <!------------------------------------------------------------------------------------------->
        <!------------------------------------------------------------------------------------------->
        <!------------------------------------------------------------------------------------------->
        <!------------------------------------------------------------------------------------------->

        <div class="container col-lg-5">
            <hr class="aba mar" id="minuta">
            <br>
            <br>
            <h4>Agregar Minuta</h4>
            <div class="container col-lg-12 col-sm-12 col-xs-5 mar"> 
                <form action="C_Minuta" method="POST">
                    <div class="col-sm">
                        <p class="p-3 mb-2 bg-dark text-white text-center ">Agregar Minuta</p>

                        <!--text area -->
                        <input type="text" class="form-control" name="txt_titulo" placeholder="Titulo" required="true" maxlength="18">
                        <!--FIn text area -->

                        <!--text area -->
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Descripción</span>
                                <span class="input-group-text">-></span>
                            </div>
                            <textarea class="form-control" name="txt_detalle" aria-label="With textarea" maxlength="100"></textarea>
                        </div>
                        <!--FIn text area -->


                        <!-- select -->
                        <div class="form-group">
                            <label for="sel1" class="mt-2">Tipo de Minuta</label>
                            <select class="form-control" name="select_min" id="sel1">
                                <%                                    Manejadora_minuta mane_min = new Manejadora_minuta();

                                    try {
                                        if (mane_min.getTipo().size() == 0) {
                                            out.print("<option>Aún no hay minutas</option>");
                                        } else {
                                            for (int i = 0; i < mane_min.getTipo().size(); i++) {
                                                out.print("<option>" + mane_min.getTipo().get(i).getNom_tipo() + "</option>");
                                            }
                                        }
                                    } catch (Exception e) {
                                        out.print("<option>Error en esta area</option>");
                                    }


                                %>
                            </select>
                            <!--FIn select -->
                        </div>
                    </div>
                    <hr>
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input"  required="true">
                        <label class="form-check-label" for="exampleCheck1">Revise los Datos</label>
                    </div>
                    <button type="submit" class="btn btn-dark" name="accion" value="RegistrarMin">Enviar Minuta</button>
                </form>

                <hr class="aba mar">
            </div>
            <!------------------------------------------------------------------------------------------->
            <!------------------------------------------------------------------------------------------->
            <!------------------------------------------------------------------------------------------->
            <!------------------------------------------------------------------------------------------->
            <!------------------------------------------------------------------------------------------->

            <br>
            <br>
            <br>


            <!--minutas----------------------------------------------------------------------------------------------->

            <h4  class="mb-5 mar">Lista de minutas </h4>
            <a href="minuta.jsp" class="btn btn-sm btn-outline-secondary nav-link">ver minutas</a>
            <!--FIn:-minutas------------------------------------------------------------------------------------------>






            <br>
            <br>
            <br>
            <hr>
            <form action="C_Minuta" method="Post">
                <!-- Cuadros de texto-->
                <h1>Modificar Minuta</h1>
                <label>seleccione minuta a modificar:</label>
                <select class="form-control" name="select_mi" id="sel1" required="" >
                    <option></option>
                    <%                    for (int i = 0; i < mane_min.getMinuta().size(); i++) {
                            Minuta min = mane_min.getMinuta().get(i);
                            if (mane_min.getMinuta().get(i).getDetalle().compareToIgnoreCase("off") == 0) {
                                if (mane_min.getMinuta().get(i).getId_minuta() < 10) {
                                    out.print("<option>id:0" + min.getId_minuta() + " ,titulo:" + min.getTitulo() + " TIPO:" + mane_min.obtenerTipoMinuta(min.getId_tipo_min()) + " ESTADO:" + min.getDetalle() + "</option>");

                                } else {
                                    out.print("<option>id:" + min.getId_minuta() + " ,titulo:" + min.getTitulo() + " TIPO:" + mane_min.obtenerTipoMinuta(min.getId_tipo_min()) + " ESTADO:" + min.getDetalle() + "</option>");

                                }
                            } else {
                                if (mane_min.getMinuta().get(i).getId_minuta() < 10) {
                                    out.print("<option>id:0" + min.getId_minuta() + " ,titulo:" + min.getTitulo() + " TIPO:" + mane_min.obtenerTipoMinuta(min.getId_tipo_min()) + "</option>");

                                } else {
                                    out.print("<option>id:" + min.getId_minuta() + " ,titulo:" + min.getTitulo() + " TIPO:" + mane_min.obtenerTipoMinuta(min.getId_tipo_min()) + "</option>");

                                }
                            }

                        }
                    %>
                </select>
                <br>
                <label>nuevo titulo:</label>
                <input type="text-area" name="txt_titulo" placeholder="agregar título" required="true" maxlength="49">
                <br>
                <label>nueva descripcion:</label>
                <textarea type="text-area" name="txt_descripcion" placeholder="agregar descripcion" required="true" maxlength="499"></textarea>
                <br>      
                <br>          
                <label>nuevo tipo:</label>
                <select class="form-control" name="select_tipo" id="sel1" required="true" >
                    <option></option>
                    <%
                        int id = 10;
                        tipo = "";
                        for (int o = 0; o < mane_min.getTipo().size(); o++) {
                            tipo = mane_min.getTipo().get(o).getNom_tipo();
                            id = mane_min.getTipo().get(o).getId_tipo_minuta();

                            out.print("<option>" + id + "   || " + tipo + "</option>");

                        }
                    %>
                </select>
                <!--Checkbox-->
                <div class="form-group form-check">
                    <input type="checkbox"  required="true">
                    <label>modificar</label>
                </div>
                <!--FIN: Checkbox-->
                <button type="submit" class="btn btn-dark btn-block" name="accion" value="modificar_mi" style='width:220px; height:35px'>Actualizar</button>
            </form>
            <hr>
            <br>
            <br>
            <br>

            <!--Eliminar minutas -->
            <form action="C_Minuta" method="Post">
                <!-- Cuadros de texto-->
                <h1>Dar de baja minuta</h1>
                <select class="form-control" name="select_min" id="sel1">
                    <option>seleccionar minuta</option>
                    <%                    tipo = "";

                        for (int i = 0; i < mane_min.getMinuta().size(); i++) {
                            if (mane_min.getMinuta().get(i).getDetalle().compareToIgnoreCase("off") == 0) {

                            } else {
                                if (mane_min.getMinuta().get(i).getId_minuta() < 10) {
                                    out.print("<option>id:0" + mane_min.getMinuta().get(i).getId_minuta() + " ," + mane_min.getMinuta().get(i).getTitulo() + "</option>");

                                } else {
                                    out.print("<option>id:" + mane_min.getMinuta().get(i).getId_minuta() + " ," + mane_min.getMinuta().get(i).getTitulo() + "</option>");

                                }
                            }

                        }
                    %>      
                </select>   
                <!--Checkbox-->
                <div class="form-group form-check">
                    <input type="checkbox"  required="true">
                    <label>modificar</label>
                </div>          
                <!--FIN: Checkbox-->
                <button type="submit" class="btn btn-dark btn-block" name="accion" value="eliminar_mi" style='width:220px; height:35px'>Dar de baja</button>
            </form>         
            <!--FIn:Eliminar minutas  -->
            <hr>
            <br>
            <br>
            <br>
            <!--Eliminar minutas -->
            <form action="C_Minuta" method="Post">
                <!-- Cuadros de texto-->
                <h1>Recuperar minuta</h1>
                <select class="form-control" name="select_min" id="sel1">
                    <option>seleccionar minuta</option>
                    <%                    tipo = "";

                        for (int i = 0; i < mane_min.getMinuta().size(); i++) {
                            if (mane_min.getMinuta().get(i).getDetalle().compareToIgnoreCase("off") == 0) {
                                if (mane_min.getMinuta().get(i).getId_minuta() < 10) {
                                    out.print("<option>id:0" + mane_min.getMinuta().get(i).getId_minuta() + " ," + mane_min.getMinuta().get(i).getTitulo() + "</option>");

                                } else {
                                    out.print("<option>id:" + mane_min.getMinuta().get(i).getId_minuta() + " ," + mane_min.getMinuta().get(i).getTitulo() + "</option>");

                                }
                            } else {

                            }

                        }
                    %>      
                </select>   
                <!--Checkbox-->
                <div class="form-group form-check">
                    <input type="checkbox"  required="true">
                    <label>modificar</label>
                </div>          
                <!--FIN: Checkbox-->
                <button type="submit" class="btn btn-dark btn-block" name="accion" value="recuperar_mi" style='width:220px; height:35px'>Recuperar</button>
            </form>         
            <!--FIn:Eliminar minutas  -->


            <!-- -->



            <div>

                <br>
                <!--Modal de ayuda -->            
                <button type="button" class="button1 button1" data-toggle="modal" data-target=".bd-example-modal-lg">Ayuda</button>

                <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <embed src="pdf/CASO.pdf#page=3" type="application/pdf" width="100%" height="600px" />
                        </div>
                    </div>
                </div>
                <!--Fin Modal   <object  data="pdf/CASO.pdf#page=2"></object>                         <iframe  src="pdf/CASO.pdf#page=2"></iframe>-->

                <!-- ....................... -->
                <!-- ....................... -->
            </div>


            <br>
            <br>
        </div>
    </div>


    <%    if (sesion.getAttribute("user") == null || sesion.getAttribute("clave") == null) {
                sesion.setAttribute("user", null);
                sesion.invalidate();
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } catch (Exception e) {
            HttpSession rs = request.getSession();
            rs.setAttribute("desde", "empleado_home.jsp");
            rs.setAttribute("pag", "login.jsp");
            rs.setAttribute("titulo", "Inicie sesion otra vez.");
            rs.setAttribute("detalle", "Algo ha salido mal en la pagina.");
            rs.setAttribute("sms", "falló empleado_home + " + e);
            rs.setAttribute("tip", "error");
            response.sendRedirect("true.jsp");

        }
    %>


    <script src="js/form.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>

</body>
</html>