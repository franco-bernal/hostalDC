<%-- 
    Document   : Principal_admin
    Created on : 16-06-2020, 15:43:38
    Author     : Enfoks
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>


<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menú</title>
        <link href="css.Principal_admin.css" rel="stylesheet">
        <title>Modulo principal</title>
        <link href="css/Principal_admin.css" rel="stylesheet" type="text/css"/>

    </head>
    <body >


        <div>


            <div class="title">
                <h2>Modulo<br/>Principal</h2>

                <a target="_blank" href="login.jsp"  class="white-mode">Login</a>
            </div>

            <!--
                    <div>
                        <a href="#" class="button1">Informes y Estadisticas</a>
                    </div>
           

            <div>
                <a  href="#" class="button1"  ></a>
            </div>
            -->


            <div>

                <a href="ad.jsp" class="button1">Administración de Usuarios</a>
            </div>
            <br>

            <h1 class="text-center">Informes</h1>
            <div>
                <a href="admi/Registro_factura.jsp" class="button1"  >Facturación</a>
            </div>


            <div>
                <a href="admi/administrador.jsp" class="button1"  >Compras</a>
            </div>
        </div>



        <br>
        <br>
        <br>
        <br>
        <br>

        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


    </body>
</html>