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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Empleado</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link href="css/empleado.css" rel="stylesheet" type="text/css"/>
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
        %>
    </head>

    <body  data-spy="scroll" class="text-capitalize "  data-target="#navbar-example2">


        <nav id="navbar-example2" class="navbar navbar-dark bg-dark men" style="position: fixed;">
            <%
                HttpSession sesion = request.getSession();
                String usuario = sesion.getAttribute("user").toString();
                String aint = sesion.getAttribute("tipo").toString();
                String rut = sesion.getAttribute("rut").toString();

                int tip = Integer.parseInt(aint);
                String tipo;

                if (tip == 2) {
                    tipo = "Empleado";
                } else {
                    tipo = "salir";

                }

                Manejadora_orden mane_ord = new Manejadora_orden();
                Manejadora_cliente mane_cli = new Manejadora_cliente();
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



            <h4  class="mb-5 mar" id="recepcion">Recepción Huespedes </h4>


            <div  id="customers" class="container" >
                <br>
                <div >
                    <div >
                        <table class="table center-block">
                            <thead>
                                <tr>
                                    <th>Nombre</th>
                                    <th>Rut</th>
                                    <th>Contacto</th>
                                    <th>Recepcion</th>
                                </tr>
                            </thead>
                            <tbody>

                                <%
                                    if (mane_cli.getCliente().size() > 0) {
                                        for (int i = 0; i < mane_cli.getCliente().size(); i++) {
                                            if (mane_ord.cantidadDeOrdenes(mane_cli.getCliente().get(i).getRut_emp()) > 0) {
                                                out.print("<tr ><td style='cursor: not-allowed;'>" + mane_cli.getCliente().get(i).getNom_emp() + "</td>"
                                                        + "<td editable-td field='apellidos'>" + mane_cli.getCliente().get(i).getRut_emp() + "</td>"
                                                        + "<td editable-td field='apellidos'>" + mane_cli.getCliente().get(i).getTele_emp() + "</td>"
                                                        + "<td editable-td  field='email'><button type='button' class='btn btn-success'>Recepcionar</button></td></tr>");
                                            }

                                        }
                                    } else {
                                        out.print("<td>no hay</td>");
                                    }


                                %>





                            <span class="glyphicon glyphicon-trash" style="cursor: pointer;" />
                            </tbody>
                        </table>
                        <br>
                        <br

                    </div>
                </div>
            </div>


            <!-- ....................... -->

            <!--.........................-->
            <h4  class="mb-5 mar" id="pedidos">Recepción pedidos </h4>


            <div  id="customers" class="container" >

                <br>
                <div >
                    <div >
                        <table class="table center-block">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Proveedor</th>
                                    <th>producto</th>
                                    <th>cantidad</th>
                                    <th>Estado</th>

                                </tr>
                            </thead>
                            <tbody>
                                <tr >
                                    <td style="cursor: not-allowed;">
                                        1
                                    </td>
                                    <td editable-td field="nombres">
                                        Lider
                                    </td>
                                    <td editable-td field="apellidos">
                                        Lechugas
                                    </td>
                                    <td editable-td  field="email">
                                        2
                                    </td>

                                    <td class="row-center">
                                        <button type="button"  class="btn btn-success">Recibido</button>
                                        <button type="button" class="btn btn-danger">falta</button>

                            <tbody>


                            <td style="cursor: not-allowed;">
                                1
                            </td>
                            <td editable-td field="">
                                Marley coffee
                            </td>
                            <td editable-td field="">
                                Cafe
                            </td>
                            <td editable-td  field="">
                                2
                            </td>

                            <td class="row-center">
                                <button type="button" class="btn btn-success">Recibido</button>
                                <button type="button" class="btn btn-danger">falta</button>



                            <tbody>


                            <tbody>
                                <tr >
                                    <td style="cursor: not-allowed;">
                                        2
                                    </td>
                                    <td editable-td field="nombres">
                                        Falabella
                                    </td>
                                    <td editable-td field="apellidos">
                                        Camas
                                    </td>
                                    <td editable-td  field="email">
                                        4
                                    </td>

                                    <td class="row-center">
                                        <button type="button" class="btn btn-success">Recibido</button>
                                        <button type="button" class="btn btn-danger">falta</button>



                            <tbody>

                            <span class="glyphicon glyphicon-trash" style="cursor: pointer;" />
                            </tbody>
                        </table>
                        <br>
                        <br

                    </div>
                </div>
            </div>







            <hr class="aba mar" id="pedir">

            <h4  class=" mb-5 mar">generar pedido </h4>
            <div class="container col-lg-5 col-sm-12 col-xs-5 mar"> 
                <form action="ControlCliente" method="POST">
                    <div class="col-sm">
                        <p class="p-3 mb-2 bg-dark text-white text-center ">Pedido</p>
                        <div class="form-group">
                            <label for="sel1" class="mt-2">Proveedores</label>
                            <select class="form-control" name="select_ha" id="sel1">
                                <option>Lider</option>
                                <option>Falabella</option>
                                <option>AbcDin</option>
                                <option>Coca-cola Andina</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="sel1" class="mt-2">sus productos</label>
                            <select class="form-control" name="select_ha" id="sel1">
                                <option>manjar</option>
                                <option>azucar</option>
                                <option>Televisor</option>
                                <option>Camas</option>
                                <option>Bebidas</option>
                                <option>Jugos</option>
                            </select>
                        </div>
                        <input type="cantidad" class="form-control" name="txt_cantidad" placeholder="Cantidad" required="true" maxlength="30">

                    </div>
                    <hr>
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input"  required="true">
                        <label class="form-check-label" for="exampleCheck1">Revisé los datos</label>
                    </div>
                    <button type="submit" class="btn btn-dark" name="accion" value="RegistrarCli">Enviar a proveedor</button>

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
                    <button type="submit" class="btn btn-dark" name="accion" value="RegistrarCli">Enviar Minuta</button>

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
%>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


</body>
</html>