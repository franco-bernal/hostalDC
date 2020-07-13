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
       
        <title>Modulo principal</title>
        <link href="css/Principal_admin.css" color="#fefffa" rel="stylesheet" type="text/css"/>

    </head>
    <body class="letras" >
        <br>
      
    
  <!---------titulo---------> 
        
        <div class="container" >
  <h3 class="titulo">
    Módulo Principal
  </h3>
  <a class="link" href="login.jsp"><i class="fa fa-angle-double-left" aria-hidden="true"></i> volver a login principal</a>
<div class="row">
  
    
  <!--------modulo admin----------> 
    
<div id="accesos" class="centrar">
<div class="modulo" >
  <img class="imgmodulo" src="https://www.vippng.com/png/detail/250-2501976_project-management-images-png.png">
<div class="contenido">
  <h2 class="nombremodulo">
       <br>
   Administración <br>
   Usuario
  </h2>
    
    
    <p class="descmodulo">Modúlo Administración de Usuarios </p>
  
  
    <a href="ad.jsp" class="btn btn-success">Ingresar <i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
</div>
  <br>
</div>

</div>
  
   <!---------modulo facturacion---------> 
    
<div id="accesos" class="centrar">
<div class="modulo">
  <img class="imgmodulo" src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRwOiM5OAfSNOIabldm1K6oXZBYATxVw7kITw&usqp=CAU">
<div class="contenido">
  <h2 class="nombremodulo">
       <br>
   Informes <br>Facturación
  </h2>
    
    <p class="descmodulo">Descripción del módulo Facturación</p>
  

    <a href="admi/Registro_factura.jsp" class="btn btn-success" >Ingresar <i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
   
    
</div>
   <br>
</div>
</div>
  
   
  
 <!-------modulo info compra-----------> 
 
   

<div  class="centrar" id="accesos">
<div class="modulo" >
  <img class="imgmodulo" src="https://image.flaticon.com/icons/png/512/1195/1195524.png">
<div class="contenido">
  <h2 class="nombremodulo">
      <br>
      Informes de <br>Compra
  </h2>
    
    <p class="descmodulo">Descripción del módulo de Compra</p>
  
  
    <a href="admi/administrador.jsp"class="btn btn-success" >Ingresar<i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
</div>
  <br>
</div>
</div>    
  
  
  
  <!-------modulo info visitas-----------> 
 
 
 <div  class="centrar" id="accesos">
<div class="modulo" >
  <img class="imgmodulo" src="https://digitalmarketing.net.co/wp-content/uploads/2019/04/redaccion-de-contenido-para-web.png">
<div class="contenido">
  <h2 class="nombremodulo">
      <br>
      Informes de <br>Visitas
  </h2>
    
    <p class="descmodulo">Descripción de los informes de visitas</p>
  
 
    <a href="#" class="btn btn-success">Ingresar <i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
</div>
  <br>
</div>
</div>    
 
 
 
 

</div>
</div>
        
  <!-------btn ayuda----------->         
         <div >
   <br>
    <img class="imgmodulo1" src="https://image.flaticon.com/icons/png/512/64/64670.png">
   
   
   
            <!--Modal de ayuda -->            
            <button type="button" class="button button1" data-toggle="modal" data-target=".bd-example-modal-lg">Ayuda</button>

            <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <embed src="pdf/CASO.pdf#page=3" type="application/pdf" width="100%" height="600px" />
                    </div>
                </div>
            </div>
            <!--Fin Modal   <object  data="pdf/CASO.pdf#page=2"></object>                         <iframe  src="pdf/CASO.pdf#page=2"></iframe>-->

        </div>   
        
 
        
           <br>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


    </body>
</html>