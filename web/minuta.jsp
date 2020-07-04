<%-- 
    Document   : minuta
    Created on : 15-06-2020, 23:49:12
    Author     : Enfoks
--%>
<%@page import="Modelo.Manejadoras.Manejadora_minuta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>


<!DOCTYPE html>
<head>
    <meta charset="UTF-8">

    <title>Menú</title>
    <link href="css/minuta.css" rel="stylesheet">
</head>

<body>
    <%
    Manejadora_minuta mane_minuta = new Manejadora_minuta();
    %>
    <section id="popular" class="module">
        <div class="container">

            <div class="row">
                <div class="col-sm-6 col-sm-offset-3">
                    <div class="module-header wow fadeInUp animated" style="visibility: visible; animation-name: fadeInUp;">
                        <h2 class="module-title">Hostal Doña Clarita</h2>
                        <h3 class="module-subtitle">Minuta</h3>
                    </div>
                </div>
            </div><!-- .row -->

            <div class="row">

                <div class="col-sm-6 col-lg-5">
                   
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
                    
                    
                    <!--  ejemplo de lo que repite el for de arriba
                    <div class="menu">
                        <div class="row">
                            <div class="col-sm-8">
                                <h4 class="menu-title">titulo</h4>
                                <div class="menu-detail">detalle</div>
                            </div>
                            <div class="col-sm-4 menu-price-detail">
                                <h4 class="menu-price">$</h4>
                            </div>
                        </div>
                    </div>
                    -->
                    

                </div><!-- .col-sm-6 -->


            </div><!-- .row -->

            <div class="row">
                <div class="col-sm-6 col-sm-offset-3 long-up text-center">
                    <a href="empleado_home.jsp" class="btn btn-custom-1">Menu</a>
                </div>
            </div><!-- .row -->

            <div class="row">
                <div class="col-sm-6 col-sm-offset-3">
                    <div class="devider">
                    </div>
                </div>
            </div><!-- .row -->

        </div><!-- .container -->
    </section>

    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src='https://isotope.metafizzy.co/beta/isotope.pkgd.js'></script>
    <script src="minuta.js"></script>
</body>