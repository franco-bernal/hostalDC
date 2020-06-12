<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <body data-spy="scroll" id="inicio" class="text-capitalize" data-target="#navbar-example2">
        <%            HttpSession sesion = request.getSession();
            String usuario = sesion.getAttribute("user").toString();
            String aint = sesion.getAttribute("tipo").toString();
            int tip = Integer.parseInt(aint);
            String tipo;

            if (tip == 3) {
                tipo = "proveedor";
            } else {
                tipo = "salir";

            }
        %>


        <nav id="navbar-example2" class="navbar navbar-light bg-light ca" style="position: fixed;">
            <a class="navbar-brand" href="#"><%out.print(usuario);%></a>
            <ul class="nav nav-pills">
                <li class="nav-item">
                    <a class="nav-link" href="#inicio">Inicio </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#pedidos">Mis pedidos</a>
                </li>

                <form action="ControlUsuario" method="POST">
                    <input action="ControlUsuario" class="btn btn-dark btn-block" type="submit" name="accion" value="Salir">
                </form>
            </ul>
        </nav>


        <div data-spy="scroll" data-target="#navbar-example2" data-offset="0" >

            <div  class="giga center-block text-center centrar">
                <p   class="lead fue text-capitalize ">  <%out.print(usuario);%></p>
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

            <hr class="aba mar" id="pedidos">

            <h4  class="mb-5 mar">Mis pedidos </h4>
            <div class="container-fluid col-lg-8 col-sm-12 col-xs-5 mb-5 mar"> 
                <table class="table table-hover table-sm ">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">producto</th>
                            <th scope="col">cantidad</th>
                            <th scope="col">unidad</th>
                            <th scope="col">enviado/recibido</th>
                            <th scope="col">aceptar/rechazar</th>


                        </tr>
                    </thead>
                    <tbody>

                        <tr>
                            <th scope="row">1</th>
                            <td>manzanas</td>
                            <td>5</td>
                            <td>kg</td>
                            <td>01/02/20</td>
                            <td class="row">
                                <button type="button" class="btn btn-success">Aceptar</button>
                                <button type="button" class="btn btn-danger">Rechazar</button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>camas</td>
                            <td>2</td>
                            <td>Unidades</td>
                            <td>01/02/20</td>
                            <td class="row"> 
                                <button type="button" class="btn btn-success">Aceptar</button>
                                <button type="button" class="btn btn-danger">Rechazar</button>
                            </td>

                        </tr>
                        <tr class="table-success">
                            <th scope="row">3</th>
                            <td>papas</td>
                            <td>2</td>
                            <td>kg</td>
                            <td>31/02/20</td>
                            <td>Rechazado</td>


                        </tr>
                        <tr class="table-success">
                            <th scope="row">4</th>
                            <td>peras</td>
                            <td>5</td>
                            <td>kg</td>
                            <td>31/02/20</td>
                            <td>Enviado</td>

                        </tr>
                    </tbody>
                </table>
            </div>



            <!-- -->
        </div>


        <hr class="aba mar">
        <hr class="aba mar" >
        <hr class="aba mar" >





        <%
            if (sesion.getAttribute("user") == null || sesion.getAttribute("clave") == null) {
                sesion.setAttribute("user", null);
                sesion.invalidate();
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        %>

        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


    </body>
</html>