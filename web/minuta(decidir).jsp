<%-- 
    Document   : minuta
    Created on : 15-06-2020, 23:49:12
    Author     : Enfoks
--%>
<%@page import="Modelo.Manejadoras.Manejadora_minuta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<html>
<!DOCTYPE html>
<head>
  
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Menú</title>
    <link href="css/minuta.css" rel="stylesheet">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">


</head>

<body>
    <%
    Manejadora_minuta mane_minuta = new Manejadora_minuta();
    %>
    <section id="popular" class="module">
        <div class="modal-dialog " >
       <div class="centrar" class="modal-header">
             <img class="imgmodulo1" src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRlvBwoOHmGVhu4f_shHg1dFI32poNMDuLTQA&usqp=CAU">
              </div>  
            <div >
                <div class="">
                    <div class=" wow fadeInUp animated" style="visibility: visible; animation-name: fadeInUp;">
                        <h2 class="module-title">Hostal Doña Clarita</h2>
                        <h3 class="module-subtitle">Minuta</h3>
                    </div>
                </div>
            
 
            </div><!-- .row -->
            <br>
            <br>
            <div class="row">

                <div class="">
                   
                    <%
                    for(int i = 0;i<mane_minuta.getMinuta().size();i++){
                        int id_tipo=mane_minuta.getMinuta().get(i).getId_tipo_min();
                        int valor=mane_minuta.valorMinuta(id_tipo);
                                    
                        //se pueden cambiar todas las etiquetas
                        out.print(""
                        + "<div class='menu'>"
                        +     "<div class='row'>"
                        +         "<div class='col-sm-8'>"
                        +             "<h4 class='menu-title'>"+mane_minuta.getMinuta().get(i).getTitulo()+"</h4>"
                        +             "<div class='menu-detail'>"+mane_minuta.getMinuta().get(i).getDetalle()+"</div>"
                        +         "</div>"
                        +         "<div class='col-sm-4 menu-price-detail'>"
                        +             "<h4 class='menu-price'>$"+valor+"</h4>"
                        +        "</div>"
                        +     "</div>"
                        + "</div>");
                        
                    }
                    %>
                    
               

                </div><!-- .col-sm-6 -->


            </div><!-- .row -->
 
          
              <div class="centrar" class="modal-header">
             <img class="imgmodulo1" src="https://i.dlpng.com/static/png/505475_preview.png">
              </div>  
 
         

        </div><!-- .container -->
       
        
        
    </section>

    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src='https://isotope.metafizzy.co/beta/isotope.pkgd.js'></script>
    <script src="minuta.js"></script>
    
</body>
</html>