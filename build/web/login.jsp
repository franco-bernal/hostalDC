<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Manejadoras.Manejadora_usuario" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
        %>

       
    </head>
    <body>
        <div id="cuadro">
            <form action="ControlUsuario" method="POST">
                <p id="titulo">Hostal Doña Clarita</p>
                <hr>
                <br/><br/>
                <label id="subtitulo1">NOMBRE DE USUARIO</label>
                <br/><br/>
                <input type="text" class="entrada"  name="txt_nom" placeholder=" Ingrese nombre de usuario"  maxlength="30" required="true"/>
                <br/><br/>
                <label id="subtitulo2">CONTRASEÑA</label>
                <br/><br/>
                <input type="password" class="entrada" name="txt_clave" placeholder="Ingrese su contraseña" class="form-control"  maxlength="20" required="true"/>
                <br/><br/>
                <input type="submit"  id="boton"  name="accion" value="Ingresar"/>

                <div class="alert btn-outline-dark text-center letras" role="alert">
                    <p>
                        <%                            Manejadora_usuario mane = new Manejadora_usuario();
                            String nom;
                            String clave;
                            nom = request.getParameter("txt_nom");
                            clave = request.getParameter("txt_clave");

                            try {
                                if (nom.compareToIgnoreCase("") == 0 || clave.compareToIgnoreCase("") == 0) {
                                    out.print("");
                                }
                                if (mane.obtenerUsuario(nom, clave) == null) {
                                    out.print("no se encontró usuario");
                                }

                            } catch (Exception ex) {
                                out.print("Ingrese los datos solicitados");
                            }
                        %>
                    </p>
                </div>

            </form>
            <br/>

            <form action="select.jsp">

                <input type="submit" value="Registro"  id="boton2">

            </form>

            <p id="marca">Alojamiento y Servicio de Comedor para Empresas</p>
        </div>


    </body>
</html>
