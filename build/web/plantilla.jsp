<%-- 
    Document   : plantilla
    Created on : 27-05-2020, 12:53:39
    Author     : Franco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>plantilla</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            String usuario = sesion.getAttribute("user").toString();
            String aint = sesion.getAttribute("tipo").toString();
            int tipo = Integer.parseInt(aint);
        %>

        <nav id="navbar-example2" class="navbar navbar-light bg-light fijo" style="position: fixed;">
            <a class="navbar-brand" href="#">Navbar</a>
            <ul class="nav nav-pills">
                <li class="nav-item">
                    <a class="nav-link" href="#fat">@fat</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#mdo">@mdo</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="#one">one</a>
                        <a class="dropdown-item" href="#two">two</a>
                        <div role="separator" class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#three">three</a>
                    </div>
                </li>
            </ul>
        </nav>
        <div data-spy="scroll" data-target="#navbar-example2" data-offset="0">
            <h4 id="fat">@fat</h4>
            <div class="jumbotron jumbotron-fluid">
                <div class="container">
                    <h1 class="display-4">
                        <%
                            if (tipo == 4) {
                                out.print("Cliente ");
                            } else {
                                out.print(tipo);
                            }
                        %>   
                    </h1>
                    <p class="lead">  <%out.print(usuario);%></p>
                </div>
            </div>
            <form action="ControlUsuario" method="POST">
                <input action="ControlUsuario" class="btn btn-dark btn-block" type="submit" name="accion" value="Salir">

            </form>
            <h4 id="mdo">@mdo</h4>
            <p>
                <a class="btn btn-primary" data-toggle="collapse" href="#multiCollapseExample1" role="button" aria-expanded="false" aria-controls="multiCollapseExample1">Comprar</a>
            </p>
            <div class="row">
                <div class="col">
                    <div class="collapse multi-collapse" id="multiCollapseExample1">
                        <div class="card card-body container col-lg-5 col-sm-12">

                            <form action="ControlCliente" method="POST">
                                <div class="col-sm">
                                    <p class="p-3 mb-2 bg-dark text-white ">Compra</p>
                                    <input type="text" class="form-control" name="txt_f_inicio" placeholder="Desde" required="true" maxlength="18">
                                    <input type="text" class="form-control" name="txt_f_fin" placeholder="Hasta" required="true" maxlength="20">
                                    <input type="email" class="form-control" name="txt_cantidad" placeholder="Cantidad de huespedes" required="true" maxlength="30">

                                    <input type="number" class="form-control" name="txt_tele_emp" placeholder="Telefono empresa" required="true">
                                    <input type="text" class="form-control" name="txt_dir_emp" placeholder="Direccion empresa" required="true" maxlength="30">
                                </div>
                                <hr>
                                <div class="col-12">
                                    <input type="password" class="form-control" placeholder="Contraseña" required="true" maxlength="20">
                                    <input type="password" class="form-control" name="txt_clave" placeholder="Repetir contraseña" required="true" maxlength="20">
                                </div>
                                <hr>
                                <div class="form-group form-check">
                                    <input type="checkbox" class="form-check-input"  required="true">
                                    <label class="form-check-label" for="exampleCheck1">Revisé los datos</label>
                                </div>
                                <button type="submit" class="btn btn-dark btn-block" name="accion" value="RegistrarCli">Crear cuenta</button>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <h4 id="one">one</h4>
            <p>...</p>
            <h4 id="two">two</h4>
            <p>...</p>
            <h4 id="three">three</h4>
            <p>...</p>
        </div>

        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


    </body>
</html>
