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
    </head>
    <body data-spy="scroll" data-target="#navbar-example2">
        <%
            HttpSession sesion = request.getSession();
            String usuario = sesion.getAttribute("user").toString();
            String aint = sesion.getAttribute("tipo").toString();
            int tipo = Integer.parseInt(aint);
        %>



        <nav id="navbar-example2" class="navbar navbar-light bg-light" style="position: fixed;">
            <a class="navbar-brand" href="#">HostalDC</a>
            <ul class="nav nav-pills">
                <li class="nav-item">
                    <a class="nav-link" href="#inicio">Inicio ⌂</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#comprar">Comprar $</a>
                </li>
                <form action="ControlUsuario" method="POST">
                    <input action="ControlUsuario" class="btn btn-dark btn-block" type="submit" name="accion" value="Salir">
                </form>
            </ul>
        </nav>
        <div data-spy="scroll" data-target="#navbar-example2" data-offset="0">
            <h4 id="inicio">Inicio</h4>

            <div class="giga center-block text-center centrar">
              <p class="lead fue text-capitalize ">  <%out.print(usuario);%> ♜</p>
            </div>
            <div class="jumbotron jumbotron-fluid mb-5 " >
                <div class="container">
                    <h1 class="display-4">
                        <%
                            if (tipo == 3) {
                                out.print("Proveedor ");
                            } else {
                                out.print(tipo);
                            }
                        %>   
                    </h1>
                </div>
            </div>



            <h4 id="comprar">Comprar</h4>
            <div class="container col-lg-5 col-sm-12 col-xs-5"> 
                <form action="ControlCliente" method="POST">
                    <div class="col-sm">
                        <p class="p-3 mb-2 bg-dark text-white ">Compra</p>
                        <input type="text" class="form-control" name="txt_f_inicio" placeholder="Desde" required="true" maxlength="18">
                        <input type="text" class="form-control" name="txt_f_fin" placeholder="Hasta" required="true" maxlength="20">
                        <input type="email" class="form-control" name="txt_cantidad" placeholder="Cantidad de huespedes" required="true" maxlength="30">
                        <div class="row mt-2">
                            <p class="ml-3 mr-3 mt-2">+569 </p>
                        <input type="tel" class="form-control col-3" name="txt_tele" pattern="[0-9]{8}" title="Ingrese solo números" placeholder="Celular" maxlength="8">
                        </div>
                        <input type="text" class="form-control" name="txt_dir_emp" placeholder="Direccion empresa" required="true" maxlength="30">
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
                            </select>
                        </div>
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







        <a href="plantilla.jsp" class="btn btn-primary btn-lg  mt-5 " role="button" >generar factura</a>


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
