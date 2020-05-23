<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Entidades.Usuario" %>
<%@page import="Modelo.Manejadoras.Manejadora_usuario" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">


    </head>
    <body class="letras">
        <h1 >Resultado metodos:</h1>
        <hr>
        <hr>
        <h1>
            <%
                 Manejadora_usuario mane = new Manejadora_usuario();
                try {

                    Usuario r = mane.obtenerUsuario("Equi1nox2", "4321");
                    out.print(r.getCorreo());

                } catch (Exception e) {
                    out.print(e);
                }


            %>
        </h1>

        <h1 class="text-center">Lista de usuarios creados y claves</h1>

        <div class="container-fluid">
            <div class="row">
                <%                   

                    try {
                        for (int i = 0; i < mane.getUsu().size(); i++) {

                            out.print("<div class='containercolor a container   letras'><div class='row'>  <div><div>Id:" + mane.getUsu().get(i).getId_usuario() + "</div><div> Nombre Usuario:   " + mane.getUsu().get(i).getNom_usuario() + "</div><div>    CLAVE:" + mane.getUsu().get(i).getClave() + "</div><div>correo: " + mane.getUsu().get(i).getCorreo() +"</div> <div><h1>tipo:"+mane.getUsu().get(i).getTipo_usuario_permiso()+"</h1></div><strong>HostalDC</strong></div></div></div>");
                        }
                    } catch (Exception e) {
                        out.print(e);
                    }

                    out.print("<div class='containercolor a container   letras'><div class='row'><img src='https://image.flaticon.com/icons/png/512/14/14598.png'  width='120' height='120'/>  <div><a href='select.jsp'><hr><h1>Agregar</h1></a></div><strong>HostalDC</strong></div></div></div>");

                %>
            </div>
        </div>




        <!-- 
        -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">



    </body>
</html>
