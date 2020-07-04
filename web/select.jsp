<%-- 
    Document   : select1
    Created on : 02-07-2020, 18:56:56
    Author     : Enfoks
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv=”Content-Type” content=”text/html; charset=UTF-8″ />
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
     
        <h1 style="text-align: center;">Administración Hostal DC</h1>

        <div id="accesos">
            
<div class="accordion">
  <div class="accordion-item">
    <div class="accordion-item-header">
     <h2 id="accesos">Registro de Clientes   <img src="data:image/jpeg;base64,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" /></h2>
    </div>
    <div class="accordion-item-body">
      <div class="accordion-item-body-content">

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
                            <label class="form-check-label" for="exampleCheck1">Revisé los datos</label>
                        </div>
                        <button type="submit" class="btn btn-dark" name="accion" value="RegistrarCli">Crear Cuenta</button>

                    </form>

      </div>
    </div>
  </div>
    
    
    
    
  <div class="accordion-item">
    <div class="accordion-item-header">
                <h2 id="accesos">Registro de Proveedores<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTgDV4ivjlj8VlVj5EAUSG_ZToARToRiPPWAQ&usqp=CAU" /></h2>

    </div>
    <div class="accordion-item-body">
      <div class="accordion-item-body-content">



<form action="ControlProveedor" method="POST">
                        <div class="col-sm">
                            <p class="p-3 mb-2 bg-dark text-white ">Datos de la Empresa</p>
                            <input type="text" class="form-control" name="txt_nom_emp" placeholder="Nombre Empresa" required="true" maxlength="18">
                            <input type="text" class="form-control" name="txt_rut_emp" placeholder="Rut Empresa" required="true" maxlength="20">
                            <input type="email" class="form-control" name="txt_correo_emp" placeholder="Correo Empresa" required="true" maxlength="30">
                            <input type="text" class="form-control" name="txt_rubro" placeholder="Rubro" required="true" maxlength="20">
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
  </div>
    
    
  
  <div class="accordion-item">
    <div class="accordion-item-header">
            <h2 id="accesos">Registro de Empleados<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQUSr9b1rQzlTUCEcYRYlDD0JzmetBXYvOBqQ&usqp=CAU" /></h2>
    </div>
    <div class="accordion-item-body">
      <div class="accordion-item-body-content">
     
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
  
</div>
        
        
          
</div>
        
        
        
        
        
        
        <div class="agre">
            <div class="im" class='row'>
                <img src='data:image/png;base64,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'  width='80' height='80'/> 
                <div >

                    <a href='ad.jsp' class="boton verde">Administrador Usuario</a>
                </div>
                <strong>HostalDC</strong></div>
        </div>               

        <div class="ubi">
            <a href="login.jsp" class="boton verde">Volver</a>

        </div >

        <div class="dere">
            <div style="color: white" id="copyright" style="text-align: center;" >Copyright&copy; 2020 - Todos los derechos reservados</div>
        </div>





        <!--Bootstrap-->
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script src="js/select.js"></script>
        
    </body>
</html>
