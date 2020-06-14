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
            String usuario = "";
            String clave;
            String aint;
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
                <form action="ControlCliente" method="POST">
                    <div class="col-sm">
                        <p class="p-3 mb-2 bg-dark text-white ">Compra</p>
                        <input type="text" class="form-control" name="txt_f_inicio" placeholder="Desde" required="true" maxlength="18">
                        <input type="text" class="form-control" name="txt_f_fin" placeholder="Hasta" required="true" maxlength="20">
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
                            <select class="form-control" name="select_ha" id="sel1">
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
                    <button type="submit" class="btn btn-dark btn-block" name="accion" value="RegistrarCli">Enviar</button>

                </form>
            </div>
        </div>




        <hr class="aba mar">


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
                    <a><%out.print("usuario");%></a>
                    <a>Example@gmail.com</a>
                </div>
            </div>
        </nav>
-->