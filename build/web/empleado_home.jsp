<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html >
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

    <body  data-spy="scroll" class="text-capitalize "  data-target="#navbar-example2">


        <nav id="navbar-example2" class="navbar navbar-light bg-light ca " style="position: fixed;">
            <%     
                HttpSession sesion = request.getSession();
                String usuario = sesion.getAttribute("user").toString();
                String aint = sesion.getAttribute("tipo").toString();
                int tip = Integer.parseInt(aint);
                String tipo;

                if (tip == 2) {
                    tipo = "Empleado";
                } else {
                    tipo = "salir";

                }
            %>
            <a class="navbar-brand " href="#"><%out.print(usuario);%></a>
            <ul class="nav nav-pills ">

                <li class="nav-item">
                    <a class="nav-link" href="#recepcion">Recepcion pedidos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#pedir">Generar pedido</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#minuta">Agregar minuta</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#lista">Lista de minutas</a>
                </li>
                <form action="ControlUsuario" method="POST">
                    <input action="ControlUsuario" class="btn btn-dark btn-block" type="submit" name="accion" value="Salir">
                </form>
            </ul>
        </nav>


        <div data-spy="scroll" data-target="#navbar-example2" data-offset="0" >

            <div  class="giga center-block text-center centrar">
                <p   class="lead fue text-capitalize ">  <%out.print(usuario);%> </p>
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

            <hr class="aba mar" id="recepcion">


            <h4  class="mb-5 mar">Recepcion pedidos </h4>
            <div class="container table-sm  col-lg-10 col-sm-12 col-xs-5 mb-5 mar"> 
                <table class="table table-hover ">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Proveedor</th>
                            <th scope="col">producto</th>
                            <th scope="col">cantidad</th>
                            <th scope="col">unidad</th>
                            <th scope="col">enviado/recibido</th>
                            <th scope="col">recibido</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="table-dark">
                            <th scope="row">1</th>
                            <td>macdonal</td>
                            <td>papas</td>
                            <td>2</td>
                            <td>kg</td>
                            <td>31/02/20</td>
                            <td class="row">
                                <button type="button" class="btn btn-success">Recibido</button>
                                <button type="button" class="btn btn-danger">falta</button>
                            </td>

                        </tr>
                        <tr class="table-success">
                            <th scope="row">2</th>
                            <td>Frutas y verdades</td>
                            <td>peras</td>
                            <td>5</td>
                            <td>kg</td>
                            <td>31/02/20</td>
                            <td>Sí</td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td>Frutas y verdades</td>
                            <td>manzanas</td>
                            <td>5</td>
                            <td>kg</td>
                            <td>01/02/20</td>
                            <td>No</td>

                        </tr>
                        <tr>
                            <th scope="row">4</th>
                            <td>AbcDin</td>
                            <td>camas</td>
                            <td>2</td>
                            <td>Unidades</td>
                            <td>01/02/20</td>
                            <td>No</td>


                        </tr>
                    </tbody>
                </table>
            </div>


            <hr class="aba mar" id="pedir">

            <h4  class=" mb-5 mar">generar pedido </h4>
            <div class="container col-lg-5 col-sm-12 col-xs-5 mar"> 
                <form action="ControlCliente" method="POST">
                    <div class="col-sm">
                        <p class="p-3 mb-2 bg-dark text-white text-center ">Llegados</p>
                        <div class="form-group">
                            <label for="sel1" class="mt-2">Proveedores</label>
                            <select class="form-control" name="select_ha" id="sel1">
                                <option>macdonal</option>
                                <option>la esquina</option>
                                <option>AbcDin</option>
                                <option>Frutas y verdades</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="sel1" class="mt-2">sus productos</label>
                            <select class="form-control" name="select_ha" id="sel1">
                                <option>manjar</option>
                                <option>azucar</option>
                                <option>gel</option>
                            </select>
                        </div>
                        <input type="email" class="form-control" name="txt_cantidad" placeholder="Cantidad" required="true" maxlength="30">

                        <input type="text" class="form-control" name="txt_plazo_limite" placeholder="Plazo limite" required="true" maxlength="20">

                    </div>
                    <hr>
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input"  required="true">
                        <label class="form-check-label" for="exampleCheck1">Revisé los datos</label>
                    </div>
                    <button type="submit" class="btn btn-dark btn-block" name="accion" value="RegistrarCli">Enviar a proveedor</button>

                </form>
            </div>


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
                    <button type="submit" class="btn btn-dark btn-block" name="accion" value="RegistrarCli">Enviar</button>

                </form>
                <hr class="aba mar">
            </div>


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
                            <td>general</td>
                            <td>pan</td>
                            <td>papas fritas</td>
                            <td>te</td>
                            <td>pan</td>

                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>Especial</td>
                            <td>pan</td>
                            <td>papa</td>
                            <td>te</td>
                            <td>pan</td>

                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td>general</td>
                            <td>pan</td>
                            <td>papa</td>
                            <td>te</td>
                            <td>pan</td>

                        </tr>
                        <tr>
                            <th scope="row">4</th>
                            <td>general</td>
                            <td>pan</td>
                            <td>papa</td>
                            <td>te</td>
                            <td>pan</td>

                        </tr>
                    </tbody>
                </table>
            </div>


            <hr class="aba mar" id="lista">

            <!-- -->
        </div>









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