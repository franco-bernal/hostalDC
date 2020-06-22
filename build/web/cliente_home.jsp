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

        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);

        %>

    </head>

    <body  data-spy="scroll" class="text-capitalize "  data-target="#navbar-example2">


        <nav id="navbar-example2" class="navbar navbar-dark bg-dark men" style="position: fixed;">       
            <%            DAOusuario u = new DAOusuario();
                Manejadora_cliente mane_cli = new Manejadora_cliente();
                String usuario = "";
                String clave = "";
                String aint = "";
                String rut = "";
                int id_usuario = 3;
                int con = 3;
                String tipo = "";

                HttpSession sesion = request.getSession();
                if (sesion == null) {
                    out.print("error");
                } else {
                    try {
                        usuario = sesion.getAttribute("user").toString();
                        clave = sesion.getAttribute("clave").toString();
                        aint = sesion.getAttribute("tipo").toString();
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

                    int tip = Integer.parseInt(aint);

                    if (tip == 4) {
                        tipo = "Cliente";
                    } else {
                        tipo = "salir";
                    }
                    if (tipo == "salir") {
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    }
                }
            %>




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

                <form action="ControlUsuario" method="POST">
                    <input action="ControlUsuario" class="btn btn-sm btn-outline-secondary"  class="nav-link" type="submit" name="accion" value="Salir">
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
            <h4 class="text-center"><%out.print(rut);%></h4>
            <div  class="tipo">
                <p>  <%
                    out.print(tipo);
                    %>  </p>
            </div>
        </div>


        <!--...............-->   
        <div class="fon " data-spy="scroll" data-target="#navbar-example2" data-offset="0" >   
            <br>
            <br>
            <hr class="aba mar">

            <!--...............-->

            <div class="col-lg-2 d-flex justify-content-center">
                <form action="AgregarHuesped" method="Post">
                    <h4 class="mb-5 mar" id="eliminar">Eliminar compra</h4>
                    <input type="text" class="form-control" name="txt_cod" placeholder="codigo" required="ingrese dato" maxlength="18">
                    <button type="submit" class="btn btn-dark btn-block" name="accion" value="borrar">Borrar compra</button>
                </form>
            </div>
            <br><br><br><br>
            <!--..............-->
            <br><br>

            <div  class="customers" class="container">
                <!--.............-->   
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
                                        Manejadora_orden ord = new Manejadora_orden();

                                        try {
                                            for (int i = 0; i < ord.getOrden().size(); i++) {

                                                int id = mane_cli.obtenerIdUsuario(rut);
                                                String rut_o = mane_cli.obtenerRutUsuario(id);
                                                Util util=new Util();
                                               String nom_mi="";
                                               String nom_hab="";

                                                if (ord.getOrden().size() == 0) {
                                                    out.print("<td>" + "Sin compras" + "</td>");
                                                } else {
                                                    if (ord.getOrden().get(i).getCliente_rut_emp().compareToIgnoreCase(rut_o) == 0) {
                                                        nom_mi=util.tipo_min_nom(ord.getOrden().get(i).getTipo_min());
                                                        nom_hab=util.tipo_hab_nom( ord.getOrden().get(i).getTipo_hab());
                                                        out.print("<tr class='table-dark'>");
                                                        out.print("<td>" + ord.getOrden().get(i).getCodigo_compra() + "</td>"
                                                                + "<td>" + ord.getOrden().get(i).getF_inicio() + "</td>"
                                                                + "<td>" + ord.getOrden().get(i).getF_fin() + "</td>"
                                                                + "<td>" + ord.getOrden().get(i).getF_compra() + "</td>"
                                                                + "<td>" + ord.getOrden().get(i).getPrecio_total() + "</td>"
                                                                + "<td>" + nom_hab + "</td>"
                                                                + "<td>" + nom_mi + "</td>"
                                                                + "<td>" + ord.getOrden().get(i).getCliente_rut_emp() + "</td>"
                                                                + "</tr>");
                                                    }
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
            <br><br>
            <!--.............-->   

            <h4  class="mb-5 mar" id="comprar">Comprar </h4>

            <div class="container col-lg-5 col-sm-12 col-xs-5"> 
                <form action="AgregarHuesped" method="Post">
                    <div class="col-sm">
                        <p class="p-3 mb-2 bg-dark text-white " >Compra</p>
                        <input type='text' class='form-control desactivar' name='txt_rut' value="<%=rut%>">
                        <label for="sel1" class="mt-2">inicio</label>
                        <input type="date" class="form-control" name="txt_f_inicio" placeholder="Desde" required="true" maxlength="18">
                        <label for="sel1" class="mt-2">fin</label>
                        <input type="date" class="form-control" name="txt_f_fin" placeholder="Hasta" required="true" maxlength="20">
                        <div class="form-group">
                            <label for="sel1" class="mt-2">Tipo de habitacion</label>
                            <select class="form-control" name="select_ha" id="sel1">
                                <%
                                    Manejadora_hab mane_ha = new Manejadora_hab();
                                    for (int i = 0; i < mane_ha.getTipo().size(); i++) {
                                        out.print("<option>" + mane_ha.getTipo().get(i).getNom_tipo() + "</option>");
                                    }
                                %>
                            </select>
                        </div>
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
                    </div>
                    <hr>
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input"  required="true">
                        <label class="form-check-label" for="exampleCheck1">Revisé los datos</label>
                    </div>
                    <button type="submit" class="btn btn-dark btn-block" name="accion" value="Agregar" style='width:220px; height:35px'>Agregar Huesped</button>
                </form>
            </div>


            <hr>
            <br><br><br><br><br>

        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    </body>
</html>


<!-- 
<nav class="navbar navbar-dark bg-dark">
            <a style="color:white" class="navbar-toggler"><span class="navbar-toggler-icon"></span>HOME</a>
            <div class="dropdown">
                <a style="color:white" class="nav-link dropdown-toggle"  data-toggle="dropdown">Cerrar session</a>
                <div class="dropdown-menu text-center">
                    <a><img src="https://w7.pngwing.com/pngs/205/286/png-transparent-computer-icons-user-encapsulated-postscript-pig-icon-snout-buscar-utensilio.png" height="20" width="20"></a>
                    <a><%out.print(
                                "usuario");%></a>
                    <a>Example@gmail.com</a>
                </div>
            </div>
        </nav>
-->