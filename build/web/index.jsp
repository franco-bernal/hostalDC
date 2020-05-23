<%-- 
    Document   : index
    Created on : 21-05-2020, 13:08:39
    Author     : Franco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#">Hostal Doña Clarita</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">

                    </li>

                    <div class="col-sm-12 col-xl-9 bordex d-flex  flex-column flex-md-row" >

                        <a href="login.jsp" class="btn btn-secondary btn-lg active" role="button" aria-pressed="true">Inicio sesión</a>
                        <a href="pre_quienes_somos.html" class="btn btn-secondary btn-lg active" role="button" aria-pressed="true">Quienes somos</a>
                        <a href="#" class="btn btn-secondary btn-lg active" role="button" aria-pressed="true">Habitaciones</a>
                        <a href="#" class="btn btn-secondary btn-lg active" role="button" aria-pressed="true">Servicios</a>
                        <a href="#" class="btn btn-secondary btn-lg active" role="button" aria-pressed="true">Contactanos</a>


                    </div>



                    <li class="nav-item">

                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">

                    <input class="form-control mr-sm-2" type="search" placeholder="Buscar..." aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
                </form>
            </div>
        </nav>

        <div id="banner" class="container-fluid d-flex justify-content-center">
            <div class="row ">
                <div class="container">
                    <div class="">
                        <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner">
                                <div class="carousel-item active " DATA-INTERVAL="5000">
                                    <img src="carru1.jpg" class="d-block w-100 img-fluid" alt="..."
                                         style="height: 350px; width: 600px">
                                </div>
                                <div class="carousel-item col-xl-12" DATA-INTERVAL="5000">
                                    <img src="carru2.jpg" class="d-block w-100 img-fluid porte2 " alt="..." 
                                         style="height: 350px; width: 600px">
                                </div>
                                <div class="carousel-item" DATA-INTERVAL="5000">
                                    <img src="carru3.jpg" class="d-block w-100 img-fluid porte2 " alt="..."
                                         style="height: 350px; width: 600px">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>

            <div class="wpb_wrapper"><div class="wpb_text_column "><div class="wpb_wrapper">
                        <h1 style="text-align: center;">¡Bienvenid@s!</h1></div></div>
                <br>
                </br>
                <img src="flecha-hacia-abajo-png-1.png"  width="50" height="40" class="container-fluid">

                <br>
                </br>  

                <p style="text-align: center;"><em><strong>Cabañas y Hostal Doña Clarita,</strong></em> 
                    nace como un emprendimiento familiar, el año 2019, inicialmente trabajando con nuestra propia casa. 
                    Paulatinamente y con perseverancia fuimos construyendo y atendiendo constantemente más y más público, 
                    con una visión y filosofía de servicio vanguardista, y muy consciente que nuestra misión era superar las 
                    expectativas de nuestros huéspedes, quienes nos confían la responsabilidad de ofrecerles experiencia de un buen servicio, 
                    lo que ha sido y será nuestro norte.</p></div></div>


    </div>


    <br>

    </br>
    <div style="color: black" id="copyright">Copyright&copy; 2020  - Todos los derechos reservados</div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>
