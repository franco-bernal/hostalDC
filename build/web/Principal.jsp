<%-- 
    Document   : Principal
    Created on : 27-04-2020, 4:10:26
    Author     : Franco
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Principal</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>

    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            String usuario = sesion.getAttribute("user").toString();
            String tipo = sesion.getAttribute("tipo").toString();

        %>
        <nav class="navbar navbar-dark bg-dark">
            <a style="color:white" class="navbar-toggler"><span class="navbar-toggler-icon"></span>HOME</a>
            <div class="dropdown">
                <a style="color:white" class="nav-link dropdown-toggle"  data-toggle="dropdown">Cerrar session</a>
                <div class="dropdown-menu text-center">

                    <a><img src="https://w7.pngwing.com/pngs/205/286/png-transparent-computer-icons-user-encapsulated-postscript-pig-icon-snout-buscar-utensilio.png" height="20" width="20"></a>
                    <a><%out.print("usuario");%></a>
                    <a>Example@gmail.com</a>

                    <h1>tipo</h1>
                    <h1>
                        <%
                            out.print(tipo);
                        %>  
                    </h1>
                </div>
            </div>
        </nav>
        <div class="container mt-4">

            <h1>Bienvenido al sistema. . . . . 
                <strong>Usuario:
                    <%
                        out.print(usuario);
                    %>
                </strong>
            </h1>     
            <a href="index.jsp">salir</a>
        </div>

        <form action="ControlUsuario" method="POST">
            <input action="ControlUsuario" class="btn btn-dark btn-block" type="submit" name="accion" value="Salir">

        </form>
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
