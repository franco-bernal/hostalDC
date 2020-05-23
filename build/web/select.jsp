<%-- 
    Document   : select
    Created on : 11-05-2020, 22:51:21
    Author     : Franco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tipo registro</title>
        <link rel="shortcut icon" href="/favicon.ico" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    </head>
    <body>
        <!-- 
         <a class="btn btn-info" href="registro.jsp" role="button">Registro clientes</a>
                    <hr>
                    <a class="btn btn-info" href="index.jsp" role="button">Registro proveedores</a>
                     <a class="btn btn-outline-danger letras" href="index.jsp" role="button">Volver</a>
        -->
        <div class="container col-lg-4 col-sm-12 col-xs-12 containercolor d-flex flex-column bd-highlight mb-3 text-center">
            <div class="accordion" id="accordionExample">
                <div class="card">
                    <!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
                    <button class="btn btn-outline-secondary" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        Registro de clientes
                    </button>
                    <!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
                    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                        <div class="card-body">
                            <!-- -->
                            <form action="ControlCliente" method="POST">
                                <div class="col-sm">
                                    <p class="p-3 mb-2 bg-dark text-white ">Datos de la empresa</p>
                                    <input type="text" class="form-control" name="txt_nom_emp" placeholder="nombre empresa" required="true" maxlength="18">
                                    <input type="text" class="form-control" name="txt_rut_emp" placeholder="rut empresa" required="true" maxlength="20">
                                    <input type="email" class="form-control" name="txt_correo_emp" placeholder="Correo empresa" required="true" maxlength="30">
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
                            <!-- -->  
                        </div>
                    </div>
                </div>


                <div class="card">
                    <!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
                    <button class="btn btn-outline-secondary" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                        Registro de proveedores
                    </button>
                    <!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                        <div class="card-body">
                            <form action="ControlProveedor" method="POST">
                                <div class="col-sm">
                                    <p class="p-3 mb-2 bg-dark text-white ">Datos de la empresa</p>
                                    <input type="text" class="form-control" name="txt_nom_emp" placeholder="nombre empresa" required="true" maxlength="18">
                                    <input type="text" class="form-control" name="txt_rut_emp" placeholder="rut empresa" required="true" maxlength="20">
                                    <input type="email" class="form-control" name="txt_correo_emp" placeholder="Correo empresa" required="true" maxlength="30">
                                    <input type="number" class="form-control" name="txt_rubro" placeholder="rubro" required="true">
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
                                <button type="submit" class="btn btn-dark btn-block" name="accion" value="RegistrarProv">Crear cuenta</button>

                            </form> </div>
                    </div>
                </div>


                <div class="card">
                    <!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
                    <button class="btn btn-outline-secondary" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                        Registro de empleados
                    </button>
                    <!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
                    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                        <div class="card-body">
                            <form action="ControlEmp" method="POST">
                                <div class="col-sm">
                                    <p class="p-3 mb-2 bg-dark text-white ">Datos de la empresa</p>
                                    <input type="text" class="form-control" name="txt_nom_emp" placeholder="nombre" required="true" maxlength="18">
                                    <input type="text" class="form-control" name="txt_ape_emp" placeholder="apellido" required="true" maxlength="20">
                                    <input type="text" class="form-control" name="txt_rut_emp" placeholder="rut empresa" required="true" maxlength="20">
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
                                <button type="submit" class="btn btn-dark btn-block" name="accion" value="RegistrarEmple">Crear cuenta</button>

                            </form> </div>
                    </div>
                </div>
            </div>
            <a class="btn btn-outline-danger letras" href="index.jsp" role="button">Volver</a>
            <hr>
            <h1 class="letras">HostalDC</h1>
        </div>




        <!--Bootstrap-->
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    </body>
</html>
