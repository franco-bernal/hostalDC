<%@page import="Modelo.Util"%>
<%@page import="Modelo.Manejadoras.Manejadora_minuta"%>
<%@page import="Modelo.Manejadoras.Manejadora_hab"%>
<%@page import="Modelo.Manejadoras.Manejadora_cliente"%>
<%@page import="Modelo.DAO.DAOusuario_cli"%>
<%@page import="Modelo.Manejadoras.Manejadora_orden"%>
<%@page import="Modelo.Manejadoras.Manejadora_huesped"%>
<%@page import="Modelo.Entidades.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%@page import="Modelo.DAO.DAOusuario" %>

<%

    DAOusuario u = new DAOusuario();
    Manejadora_cliente mane_cli = new Manejadora_cliente();
    String usuario = "";
    String clave = "";
    String aint = "";
    String rut = "";
    int id_usuario = 3;
    int con = 3;
    int tip = 0;
    String tipo = "";
    HttpSession sesion = request.getSession();

    if (sesion == null) {
        out.print("error");
    } else {
        try {
            usuario = sesion.getAttribute("user").toString();
            clave = sesion.getAttribute("clave").toString();
            aint = sesion.getAttribute("tipo").toString();
            tip = Integer.parseInt(aint);
            id_usuario = Integer.parseInt(sesion.getAttribute("id").toString());
            rut = sesion.getAttribute("rut").toString();
        } catch (Exception e) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

        Usuario usu = u.buscarUsuarioNombreClave(usuario, clave);

        if (sesion.getAttribute("user").toString() == null) {
            session.invalidate();
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

        if (usuario.compareToIgnoreCase("hostaldc") == 0) {
            tipo = "Admin";
        } else {
            if (tip == 4) {
                tipo = "Cliente";
            }
        }

    }
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv="Expires" content="0">
        <title>Home Cliente</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
        <link href="css/Cliente.css" rel="stylesheet" type="text/css"/>
        <link href="css/Util.css" rel="stylesheet" type="text/css"/>



    </head>
    <body  data-spy="scroll" class="text-capitalize "  data-target="#navbar-example2">


        <nav id="navbar-example2" class="navbar navbar-dark bg-dark men" style="position: fixed;">       
            <a class="navbar-brand " href="#"><%out.print(usuario);%></a>
            <ul class="nav nav-pills">
                <li class="nav-item">
                    <a class="btn btn-sm btn-outline-secondary nav-link" type="button"  href="#">Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="btn btn-sm btn-outline-secondary nav-link" type="button"  href="#eliminar">Eliminar</a>
                </li>
                <li class="nav-item">
                    <a class="btn btn-sm btn-outline-secondary nav-link" type="button"  href="#lista">Lista</a>
                </li>

                <li class="nav-item">
                    <a class="btn btn-sm btn-outline-secondary nav-link" type="button"  href="#comprar">Comprar</a>
                </li>
                <%
                    if (tipo == "Admin") {
                        out.print("<a class='btn btn-sm btn-outline-secondary nav-link' href='ad.jsp?id=ok'>Volver a admin</a>");
                    } else {
                        out.print(""
                                + " <form action='ControlUsuario' method='POST'>"
                                + " <input action='ControlUsuario' class='btn btn-sm btn-outline-secondary nav-link'  type='submit' name='accion' value='Salir'>"
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
            <h4 class="text-center"><%out.print(rut);%></h4>
            <div  class="tipo">
                <p>  <%=tipo%>  </p>
            </div>
        </div>


        <!--...............-->   
        <div class="fon " data-spy="scroll" data-target="#navbar-example2" data-offset="0" >   
            <!-- cuerpo con identificadores reconocibles para el manejo del menu(nav,header) -->


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

            <br>
            <br>
            <hr class="aba mar">
            <!--..............-->
            <br><br>
            <!--.........Lista de compras.....-->
            <div  class="customers" class="container">
                <div class="container table-sm col-lg-10">
                    <div>
                        <h4 class="mb-5 mar" id="lista">Lista de compras</h4>
                        <table class="table center-block" >
                            <thead>
                                <tr>
                                    <th >Codigo</th>
                                    <th >Desde</th>
                                    <th >Hasta</th>
                                    <th >Fecha Comprado</th>
                                    <th >Precio Total</th>
                                    <th >Eliminar</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!--Elementos tr de la tabla-->
                                <tr>
                                    <%
                                        Manejadora_orden ord = new Manejadora_orden();

                                        try {
                                            for (int i = 0; i < ord.getOrden().size(); i++) {

                                                int id = mane_cli.obtenerIdUsuario(rut);
                                                String rut_o = mane_cli.obtenerRutUsuario(id);
                                                Util util = new Util();
                                                String nom_mi = "";
                                                if (ord.getOrden().get(i).getCliente_rut_emp().compareToIgnoreCase(rut_o) == 0) {
                                                    nom_mi = util.tipo_min_nom(ord.getOrden().get(i).getTipo_min());
                                                    // nom_hab = util.tipo_hab_nom(ord.getOrden().get(i).getTipo_hab());
                                                    out.print("<tr class='table-dark text-center'>");
                                                    out.print("<td>" + ord.getOrden().get(i).getCodigo_compra() + "</td>"
                                                            + "<td>" + ord.getOrden().get(i).getF_inicio() + "</td>"
                                                            + "<td>" + ord.getOrden().get(i).getF_fin() + "</td>"
                                                            + "<td>" + ord.getOrden().get(i).getF_compra() + "</td>"
                                                            + "<td> $" + ord.getOrden().get(i).getPrecio_total() + "</td>"
                                                            + "<td><a href='aux_eliminar.jsp?id=" + ord.getOrden().get(i).getCodigo_compra() + "&accion=el_ord' class='btn btn-warning btn-sm'>Eliminar</a></td>"
                                                            + "</tr>");
                                                }
                                            }
                                        } catch (Exception e) {
                                            out.print(e);
                                        }//
%>
                                </tr>
                            </tbody>
                        </table>
                        <br><br><br><br>
                    </div>
                </div>
            </div>
            <!--......Fin lista de compras.......-->   

            <br><br>
            <!--.............-->   

            <h4  class="mb-5 mar" id="comprar">Comprar </h4>

            <div class="container col-lg-5 col-sm-12 col-xs-5"> 
                <form action="AgregarHuesped" method="Post">

                    <div class="col-sm">
                        <p class="p-3 mb-2 bg-dark text-white " >Compra</p>
                        <!-- Cuadros de texto-->
                        <input type='text' class='form-control desactivar' name='txt_rut' value="<%=rut%>">
                        <label for="sel1" class="mt-2">Desde</label>
                        <input type="date" class="form-control" name="txt_f_inicio" placeholder="Desde" required="true" maxlength="18">
                        <label for="sel1" class="mt-2">Hasta</label>
                        <input type="date" class="form-control" name="txt_f_fin" placeholder="Hasta" required="true" maxlength="20" >
                        <!--FIN: Cuadros de texto-->
                        <!--combobox "TIPO DE COMIDA-->
                        <div class="form-group">
                            <label for="sel1" class="mt-2">Tipo de comida</label>
                            <select class="form-control" name="select_co" id="sel1">
                                <%
                                    Manejadora_minuta mane_mi = new Manejadora_minuta();
                                    for (int i = 0; i < mane_mi.getTipo().size(); i++) {
                                        out.print("<option>" + mane_mi.getTipo().get(i).getNom_tipo() + "</option>");
                                    }
                                %>
                            </select>
                        </div>
                        <!--FIN: combobox "TIPO DE COMIDA-->
                        <hr>
                        <!--Checkbox-->
                        <div class="form-group form-check">
                            <input type="checkbox" class="form-check-input"  required="true">
                            <label class="form-check-label" for="exampleCheck1">Revise los datos</label>
                        </div>
                        <!--FIN: Checkbox-->
                        <button type="submit" class="btn btn-dark btn-block" name="accion" value="Agregar" style='width:220px; height:35px'>Agregar Huesped</button>
                    </div>
                </form>
            </div>


            <hr>
            <br><br>


            <h4>Generar factura</h4>

            <form action="ControlCliente" method="post">           


                <div class="fac">  
                    <br><br>
                    <label>cantidad a facturar </label>
                    <br>
                    <select   name="select_opc" onChange="pagoOnChange(this)"  >
                        <option>uno</option>
                        <option>todos</option>
                    </select>
                    <div  id="nTargeta" style="display:'';">
                        <br>
                        <label for="">Ingrese codigo a facturar:</label>
                        <br>
                        <input type="number"  name="cod_ord"> 
                        <br> 
                        <br> 
                    </div>

                    <input type='text' class='form-control desactivar' name='txt_rut' value="<%=rut%>">
                    <div class="b">
                        <button type="submit"  class="btn btn-dark btn-block" name="accion" value="generarFactura" style='width:100px; height:35px'>Generar</button>
                    </div>
                </div>

            </form>
            <br><br><br>



            
            
            <!--Script select factura -->
            <script>
                function pagoOnChange(sel) {
                    if (sel.value == "uno") {
                        divT = document.getElementById("nTargeta");
                        divT.style.display = "";
                    } else {
                        if (sel.value == "todos") {
                            divT = document.getElementById("nTargeta");
                            divT.style.display = "none";
                        }




                    }
                }
            </script>



            <!-- cuerpo con identificadores reconocibles para el manejo del menu(nav,header) -->
            <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    </body>
</html>


