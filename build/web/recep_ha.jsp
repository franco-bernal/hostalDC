<%-- 
    Document   : recep_delete
    Created on : 27-06-2020, 22:47:15
    Author     : Franco
--%>

<%@page import="Modelo.Manejadoras.Manejadora_hab"%>
<%@page import="Modelo.Manejadoras.Manejadora_huesped"%>
<%@page import="Modelo.Manejadoras.Manejadora_orden"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/recep_ha.css "  rel="stylesheet" type="text/css"/>
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
         <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
    </head>
    <body>
        <!---------------------------------------------------------------------------------------------------------------------------------------------------------------->
        <!-- Inicializacion-->        
        <%%>
        <!--Obtenido cod de compra y rut del comprador-->
        <%
            int id_compra = Integer.parseInt(request.getParameter("id"));
            String rut = request.getParameter("rut");

            Manejadora_orden mane_ord = new Manejadora_orden();
            Manejadora_huesped mane_hue = new Manejadora_huesped();
            Manejadora_hab mane_hab = new Manejadora_hab();
        %>
        <!--Fin: obtenido cod de compra y rut del comprador-->
   <br>
    <br>
     <br>
    <br>     <!---------------------------------------------------------------------------------------------------------------------------------------------------------------->
<div id="customers" class="centrar">
     <h2   >Lista de huespedes y sus habitaciones</h2>
  
     
     <div class="accesos">
         <br>
    </div>
    </div>   
      </div> 
    <br>     <!---------------------------------------------------------------------------------------------------------------------------------------------------------------->

    <div class="centrar" >
  <div>
    <div class="logo">
    <img src="https://image.flaticon.com/icons/svg/157/157805.svg" alt="">
  </div>
  </div>
    <h3> 

        <%            for (int i = 0; i < mane_hue.getHuesped().size(); i++) {
                if (mane_hue.getHuesped().get(i).getORDEN_compra_codigo_compra() == id_compra) {
                    out.print("<p>Nombre: "+mane_hue.getHuesped().get(i).getNombre() +""
                            + " "+""+mane_hue.getHuesped().get(i).getApellido()+"  N°"+mane_hue.getHuesped().get(i).getHABITACION_num_hab()+"</p>");
                }
            }

        %>
        <br>
            </h3> 
     </div>
  </div>

  <br>  <br>  <br>
<div class="centrar" >
   <a href="empleado_home.jsp" class="btn btn-secondary btn-sm" >volver</a>
</div>
        <!---------------------------------------------------------------------------------------------------------------------------------------------------------------->
        <!---------------------------------------------------------------------------------------------------------------------------------------------------------------->
        <!---------------------------------------------------------------------------------------------------------------------------------------------------------------->

    </body>
</html>
  
    