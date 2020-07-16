<%-- 
    Document   : login
    Created on : 17-06-2020, 3:02:38
    Author     : Enfoks
--%>
<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Manejadoras.Manejadora_usuario" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login HDC</title>
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
        %>
    </head>


    <body>

        <div class="login">
            <form action="ControlUsuario" method="POST" class="box">

                <img src="https://cdn3.iconfinder.com/data/icons/security-3-1/512/access-512.png" alt="">
                <div class="input-box">
                    <label >NOMBRE DE USUARIO</label>
                    <input type="text" class="entrada"  name="txt_nom" placeholder=" Ingrese nombre de usuario"  maxlength="30" required="true"/>
                </div>

                <div class="input-box">
                    <label>CONTRASEÑA</label>
                    <input type="password" class="entrada" name="txt_clave" placeholder="Ingrese su contraseña" class="form-control"  maxlength="20" required="true"/>
                </div>

                <button name="accion" value="Ingresar" type="submit">Ingresar</button>
                <div class="footer-box">
                    <div class="alert btn-outline-dark text-center letras" role="alert">
                        <p>
                             <%
                                String nom = "";
                                String clave = "";
                                String textoSinEncriptar = "";
                                Manejadora_usuario mane = null;
                                try {
                                    mane = new Manejadora_usuario();
                                    nom = request.getParameter("txt_nom");
                                    textoSinEncriptar = request.getParameter("txt_clave");
                                    clave = DigestUtils.md5Hex(textoSinEncriptar);

                                } catch (Exception e) {
                                    nom = "";
                                    clave = "";
                                }

                                try {
                                    if (nom.compareToIgnoreCase("") == 0 || clave.compareToIgnoreCase("") == 0) {
                                        out.print("");
                                    } else {
                                        if (mane.obtenerUsuario(nom, clave) == null) {
                                            out.print("no se encontró usuario");
                                        }
                                    }

                                } catch (Exception ex) {
                                    out.print("");
                                }

                                HttpSession hue = request.getSession();
                                hue.invalidate();
                            %>
                        </p>
                    </div>
                </div>

                <div >
                    <a href="select.jsp" class="boton verde">Registrar</a>
                </div >

                <div class="dere">           
                    <p >Copyright&copy; 2020 - Todos los derechos reservados</p>
                </div>
            </form>   
        </div>  
              
                        <div class="recu"  >                    
<button type="button" class=" btn-primary"  data-toggle="modal" data-target="#exampleModal" data-whatever="@gmail">Olvidaste tu contraseña?</button>
    </div>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div  class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Recupera tu contraseña</h5>
       
      </div>
      <div class="modal-body">
        <form>
          <div class="form">
            <label for="recipient-name" class="col-form-label">Ingrese su email:</label>
            <input type="email" id="email" name="email" class="form-control" id="recipient-name" placeholder=" 1234@com" >
          </div>
        
        </form>
      </div>
         <div class="recu2"  > 
      
        <button type="button" class=" boton btn-secondary" data-dismiss="modal" >Cerrar</button>
        <button  type="button" class=" boton btn-primary" data-dismiss="modal" >Enviar</button>
 

      
    </div>
  </div>
</div>    </div>    
                        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    </body>
   
</html>