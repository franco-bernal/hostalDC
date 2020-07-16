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
        <title>Login HDC</title>
        <link href="css/login.css" rel="stylesheet" type="text/css"/>

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
    </body>

</html>