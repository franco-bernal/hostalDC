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
        <title>Home</title>
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
    <body id="inicio" data-spy="scroll" class="text-capitalize" data-target="#navbar-example2" >

        <%            DAOusuario u = new DAOusuario();
                        Manejadora_cliente mane_cli= new Manejadora_cliente();
            String usuario = "";
            String clave;
            String aint;
            String rut = "";
            int id_usuario = 3;
            int con = 3;
            String tipo = "";

            HttpSession sesion = request.getSession();
            if (sesion == null) {
                out.print("error");
            } else {
                usuario = sesion.getAttribute("user").toString();
                clave = sesion.getAttribute("clave").toString();
                aint = sesion.getAttribute("tipo").toString();
                id_usuario = Integer.parseInt(sesion.getAttribute("id").toString());
                rut = sesion.getAttribute("rut").toString();

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


        <nav id="navbar-example2" class="navbar navbar-light bg-light ca" style="position: fixed;">
            <a class="navbar-brand " href="#"><strong><%out.print(usuario);%></strong></a>
            <ul class="nav nav-pills">
                <li class="nav-item">
                    <a class="nav-link" href="#inicio">Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#comprar">Comprar</a>
                </li>
                <form action="ControlUsuario" method="POST">
                    <input action="ControlUsuario" class="btn btn-dark btn-block" type="submit" name="accion" value="Salir">
                </form>
            </ul>
        </nav>
        <div data-spy="scroll" data-target="#navbar-example2" data-offset="0">

            <div class="giga center-block text-center centrar">
                <p class="lead fue text-capitalize " ><%out.print(usuario);%></p>
                <p> <%out.print(rut);%></p>
            </div>

            <div class="jumbotron jumbotron-fluid mb-5 " >
                <div class="container">
                    <h1 class="display-4">
                        <%
                            out.print(tipo);
                        %>   
                    </h1>
                </div>
            </div>

            <hr class="aba mar" id="comprar">


            <h4 >Comprar</h4>
            <div class="container col-lg-5 col-sm-12 col-xs-5"> 
                <form action="AgregarHuesped" method="Post">
                    <div class="col-sm">
                        <p class="p-3 mb-2 bg-dark text-white ">Compra</p>
                        <input type="date" class="form-control" name="txt_f_inicio" placeholder="Desde" required="true" maxlength="18">
                        <input type="date" class="form-control" name="txt_f_fin" placeholder="Hasta" required="true" maxlength="20">
                        <div class="form-group">
                            <label for="sel1" class="mt-2">Tipo de habitacion</label>
                            <select class="form-control" name="select_ha" id="sel1">
                                <option>sin cama</option>
                                <option>cama helada</option>
                                <option>sin ventana</option>
                                <option>sin habitacion</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="sel1" class="mt-2">Tipo de comida</label>
                            <select class="form-control" name="select_co" id="sel1">
                                <option>Servicios ejecutivos</option>
                                <option>Especiales</option>
                                <option>Generales</option>
                                <option>juegos del hambre</option>
                            </select>
                        </div>


                    </div>
                    <hr>
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input"  required="true">
                        <label class="form-check-label" for="exampleCheck1">Revisé los datos</label>
                    </div>
                    <button type="submit" class="btn btn-dark btn-block" name="accion" value="Agregar">Aceptar y agregar huesped</button>

                </form>
            </div>
        </div>

        <hr>
        <div class="container table-sm ">
            <div class="row">
                <table class="table table-hover col-lg-9">
                    <thead>
                        <tr>
                            <th scope="col">codigo</th>
                            <th scope="col">desde</th>
                            <th scope="col">hasta</th>
                            <th scope="col">fecha comprado</th>
                            <th scope="col">precio total</th>
                            <th scope="col">tipo habitacion</th>
                            <th scope="col">tipo minuta</th>
                            <th scope="col">rut comprador</th>

                        </tr>
                    </thead>
                    <tbody>

                        <%
                            Manejadora_orden ord = new Manejadora_orden();
                            

                            try {
                                for (int i = 0; i < ord.getOrden().size(); i++) {
                                    int id =mane_cli.obtenerIdUsuario(rut);
                                    String rut_o =mane_cli.obtenerRutUsuario(id);
                                    if (rut_o.compareToIgnoreCase(rut) == 0) {
                                        out.print("<tr class='table-dark'>");
                                        out.print("<td>" + ord.getOrden().get(i).getCodigo_compra() + "</td>"
                                                + "<td>" + ord.getOrden().get(i).getF_inicio() + "</td>"
                                                + "<td>" + ord.getOrden().get(i).getF_fin() + "</td>"
                                                + "<td>" + ord.getOrden().get(i).getF_compra() + "</td>"
                                                + "<td>" + ord.getOrden().get(i).getPrecio_total() + "</td>"
                                                + "<td>" + ord.getOrden().get(i).getTipo_hab() + "</td>"
                                                + "<td>" + ord.getOrden().get(i).getTipo_min() + "</td>"
                                                + "<td>" + ord.getOrden().get(i).getCliente_rut_emp() + "</td>"
                                                + "</tr>");
                                    } else {
                                        if (ord.getOrden().size() == 0) {
                                            out.print("<td>" + "Sin compras" + "</td>");
                                        } else {
                                            out.print("<td>" + rut_o + "  /+/ " + rut + "</td>");

                                        }
                                    }

                                }
                            } catch (Exception e) {
                                out.print(e);
                            }//
                        %>
                    </tbody>
                </table>




                <hr class="aba mar">
                <div class="col-lg-3">
                    <form action="AgregarHuesped" method="Post">
                    <h1>Eliminar compra</h1>
                    <input type="text" class="form-control" name="txt_cod" placeholder="codigo" required="ingrese dato" maxlength="18">
                    <button type="submit" class="btn btn-dark btn-block" name="accion" value="borrar">Borrar compra</button>
                </form>
                </div>
                
            </div>
        </div>
        <a href="plantilla.jsp" class="btn btn-primary btn-lg  mt-5 " role="button" >generar factura</a>



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