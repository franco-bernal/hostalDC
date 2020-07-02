<%-- 
    Document   : newjsp
    Created on : 27-06-2020, 22:29:11
    Author     : Enfoks
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <link rel="shortcut icon" href="/favicon.ico" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link href="css/select.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">

        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
        %>


    </head>
    <body>


        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
        <div id="accesos">
            <h1>Administración Hostal DC</h1>
            <ul>
                <li>
                    <input type="checkbox" checked>
                    <i class="chevron"></i>

                    <h2>Registro de Clientes<img src="data:image/jpeg;base64,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" /></h2>

                    <div class="contAcordeon">
                        <div class="callout">


                            <form action="ControlCliente" method="POST">
                                <div class="col-sm">
                                    <p class="p-3 mb-2 bg-dark text-white ">Datos de la Empresa</p>
                                    <input type="text" class="form-control" name="txt_nom_emp" placeholder="Nombre Empresa" required="true" maxlength="18">
                                    <input type="text" class="form-control" name="txt_rut_emp" placeholder="Rut Empresa" required="true" maxlength="20">
                                    <input type="mail" class="form-control" id="mail" name="txt_correo_emp" placeholder="Email" >

                                    <input type="tel" class="form-control" name="txt_tele_emp" placeholder="Telefono (+569)">

                                    <input type="text" class="form-control" name="txt_dir_emp" placeholder="Direccion" required="true" maxlength="30">
                                </div>
                                <hr>
                                <div class="col-12">
                                    <input type="password" class="form-control" placeholder="Contraseña" required="true" maxlength="20">
                                    <input type="password" class="form-control" name="txt_clave" placeholder="Repetir contraseña" required="true" maxlength="20">
                                </div>
                                <hr>
                                <div class="form-group form-check">
                                    <input type="checkbox" class="form-check-input"  required="true">
                                    <label class="form-check-label" for="exampleCheck1">Revisé los Datos</label>
                                </div>
                                <button type="submit" class="btn btn-dark" name="accion" value="RegistrarCli">Crear Cuenta</button>

                            </form>


                        </div>
                    </div>

                <li>
                    <input type="checkbox" checked>
                    <i class="chevron"></i>

                    <h2>Registro de Proveedores<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTgDV4ivjlj8VlVj5EAUSG_ZToARToRiPPWAQ&usqp=CAU" /></h2>

                    <div class="contAcordeon">
                        <div class="callout">


                            <form action="ControlProveedor" method="POST">
                                <div class="col-sm">
                                    <p class="p-3 mb-2 bg-dark text-white ">Datos de la Empresa</p>
                                    <input type="text" class="form-control" name="txt_nom_emp" placeholder="Nombre Empresa" required="true" maxlength="18">
                                    <input type="text" class="form-control" name="txt_rut_emp" placeholder="Rut Empresa" required="true" maxlength="20">
                                    <input type="email" class="form-control" name="txt_correo_emp" placeholder="Correo Empresa" required="true" maxlength="30">
                                    <input type="text" class="form-control" name="txt_rubro" placeholder="Rubro" required="true">
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
                                <button type="submit" class="btn btn-dark" name="accion" value="RegistrarProv">Crear cuenta</button>

                            </form>

                        </div>
                    </div>



                <li>
                    <input type="checkbox" checked>
                    <i class="chevron"></i>

                    <h2>Registro de Empleados<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQUSr9b1rQzlTUCEcYRYlDD0JzmetBXYvOBqQ&usqp=CAU" /></h2>

                    <div class="contAcordeon">
                        <div class="callout">

                            <form action="ControlEmp" method="POST">
                                <div class="col-sm">
                                    <p class="p-3 mb-2 bg-dark text-white ">Datos de Empleados</p>
                                    <input type="text" class="form-control" name="txt_nom_emp" placeholder="Nombres Apellidos" required="true" maxlength="18">
                                    <input type="text" class="form-control" name="txt_rut_emp" placeholder="Rut " required="true" maxlength="20">
                                    <input type="email" class="form-control" name="txt_correo_emp" placeholder="Correo" required="true" maxlength="30">
                                </div>
                                <hr>
                                <div class="col-12">
                                    <input type="password" class="form-control" placeholder="Contraseña" required="true" maxlength="20">
                                    <input type="password" class="form-control" name="txt_clave" placeholder="Repetir contraseña" required="true" maxlength="20">
                                </div>
                                <hr>
                                <div class="form-group form-check">
                                    <input type="checkbox" class="form-check-input" required="true">
                                    <label class="form-check-label" for="exampleCheck1">Revisé los datos</label>
                                </div>
                                <button type="submit" class="btn btn-dark " name="accion" value="RegistrarEmple">Crear cuenta</button>

                            </form>

                        </div>
                    </div>


                    </div>

                    <div >
                        <a href="login.jsp" class="boton verde">Volver</a>

                    </div >

                    <div class="agre">
                        <div class='row'>
                            <img src='data:image/png;base64,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'  width='80' height='80'/> 
                            <div >

                                <a href='ad.jsp' class="boton verde">Administrador Usuario</a>
                            </div>
                            <strong>HostalDC</strong></div>
                    </div>               
                    <br>                <br>
                    <br>
                    <br>


                    <div class="dere">
                        <div style="color: white" id="copyright" style="text-align: center;" >Copyright&copy; 2020 - Todos los derechos reservados</div>
                    </div>




                    <!--Bootstrap-->
                    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
                    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

                    </body>
                    </html>
