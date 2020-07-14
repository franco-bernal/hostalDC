<%-- 
    Document   : configuracion
    Created on : 14-07-2020, 1:53:39
    Author     : Franco
--%>
<%@page import="Modelo.Manejadoras.Manejadora_hab"%>
<%@page import="Modelo.Manejadoras.Manejadora_conf"%>
<%
    Manejadora_conf maneCo = new Manejadora_conf();
    Manejadora_hab mane_ha = new Manejadora_hab();
    
  

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Configuracion</title>
        <link href="css/Util.css" rel="stylesheet" type="text/css"/>
        <link href="css/franco.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>

    </head>
    <body style="background-color: black;">

        <div class="confColor abs-center container col-lg-5">
            <h1 class="text-center">Mantenedor</h1>
            <a href='Principal_admin.jsp' class="btn btn-dark btn-block">Volver</a>

            <hr class="rayas">
            <form action="C_config" method="Post">
                <!-- Cuadros de texto-->
                <h1>IVA actual: <%=maneCo.getConfig().get(0).getIva()%>%</h1>
                <label>modificador de IVA</label>
                <input type="number" name="txt_iva" placeholder="IVA" required="true" maxlength="2">
                <!--Checkbox-->
                <div class="form-group form-check">
                    <input type="checkbox"  required="true">
                    <label>modificar</label>
                </div>
                <!--FIN: Checkbox-->
                <button type="submit" class="btn btn-dark btn-block" name="accion" value="iva" style='width:220px; height:35px'>Modificar</button>
            </form>
            <br>
            <br>
            <br>
            <hr class="rayas">
            <form action="C_config" method="Post">
                <!-- Cuadros de texto-->
                <h1>Codigo actual: <%=maneCo.getConfig().get(0).getCod_seguridad()%></h1>
                <label>Actualizar codigo de seguridad</label>
                <input type="number" name="txt_cod" placeholder="Codigo" required="true" maxlength="5">
                <!--Checkbox-->
                <div class="form-group form-check">
                    <input type="checkbox"  required="true">
                    <label>modificar</label>
                </div>
                <!--FIN: Checkbox-->
                <button type="submit" class="btn btn-dark btn-block" name="accion" value="cod" style='width:220px; height:35px'>Actualizar</button>
            </form>
            <br>
            <br>
            <br>
            <hr class="rayas">
            <form action="C_config" method="Post">
                <!-- Cuadros de texto-->
                <h1>Meta de visitas actual: <%=maneCo.getConfig().get(0).getMeta_visitas()%></h1>
                <label>Actualizar Meta</label>
                <input type="number" name="txt_meta" placeholder="Meta" required="true" maxlength="5">
                <!--Checkbox-->
                <div class="form-group form-check">
                    <input type="checkbox"  required="true">
                    <label>modificar</label>
                </div>
                <!--FIN: Checkbox-->
                <button type="submit" class="btn btn-dark btn-block" name="accion" value="meta" style='width:220px; height:35px'>Actualizar</button>
            </form>
            <br>
            <br>
            <br>
            <hr class="rayas">
            <h1>Configuracion de habitaciones</h1>
            <form action="C_config" method="Post">
                <!-- Cuadros de texto-->
                <h1>agregar la habitacion N°<%out.print(mane_ha.getHab().size()); %></h1>
                <label>accesorios</label>
                <input type="text-area" name="txt_acc" placeholder="Accesorios de la habitacion" required="true" maxlength="49">
                <select class="form-control" name="select_habitacion" id="sel1">
                    <option>ver todas las  habitaciones</option>
                    <%
                        String tipo;
                        tipo = "";
                        int habi = 0;
                        for (int i = 0; i < mane_ha.getHab().size(); i++) {

                            for (int e = 0; e < mane_ha.getTipo().size(); e++) {
                                if (mane_ha.getHab().get(i).getTIPO_HAB_id_tipo_hab() == mane_ha.getTipo().get(e).getId_tipo_hab()) {
                                    tipo = mane_ha.getTipo().get(e).getNom_tipo();
                                }
                            }
                            habi = mane_ha.getHab().get(i).getNum_hab();
                            out.print("<option>" + habi + " || " + tipo + "</option>");
                        }
                    %>
                </select>
                <br>
                <select class="form-control" name="select_tipo" id="sel1">
                    <%
                        tipo = "";
                        int id = 10;
                        for (int i = 0; i < mane_ha.getTipo().size(); i++) {
                            tipo = mane_ha.getTipo().get(i).getNom_tipo();
                            id = mane_ha.getTipo().get(i).getId_tipo_hab();
                            out.print("<option>" + id + " || " + tipo + "</option>");
                        }
                    %>
                </select>
                <!--Checkbox-->
                <div class="form-group form-check">
                    <input type="checkbox"  required="true">
                    <label>modificar</label>
                </div>
                <!--FIN: Checkbox-->
                <button type="submit" class="btn btn-dark btn-block" name="accion" value="ingresar_ha" style='width:220px; height:35px'>Actualizar</button>
            </form>
            <br>
            <br>
            <br>
            <hr class="rayas">
            <form action="C_config" method="Post">
                <!-- Cuadros de texto-->
                <h1>Modificar habitacion</h1>
                <label>accesorios</label>
                <input type="text-area" name="txt_acc" placeholder="Accesorios de la habitacion" required="true" maxlength="49">
                <select class="form-control" name="select_habitacion" id="sel1">
                    <option>seleccionar habitacion</option>
                    <%
                        tipo = "";
                        habi = 0;
                        for (int i = 0; i < mane_ha.getHab().size(); i++) {

                            for (int e = 0; e < mane_ha.getTipo().size(); e++) {
                                if (mane_ha.getHab().get(i).getTIPO_HAB_id_tipo_hab() == mane_ha.getTipo().get(e).getId_tipo_hab()) {
                                    tipo = mane_ha.getTipo().get(e).getNom_tipo();
                                }
                            }
                            habi = mane_ha.getHab().get(i).getNum_hab();
                            if (mane_ha.getHab().get(i).getDisponibilidad().compareToIgnoreCase("De baja") == 0) {
                                if (habi < 10) {
                                    out.print("<option>0" + habi + " || Tipo: " + tipo + "  || Accesorios:" + mane_ha.getHab().get(i).getAccesorio() + " | Estado:" + mane_ha.getHab().get(i).getDisponibilidad() + "</option>");
                                } else {
                                    out.print("<option>" + habi + " ||  Tipo: " + tipo + "  || Accesorios:" + mane_ha.getHab().get(i).getAccesorio() + " | Estado:" + mane_ha.getHab().get(i).getDisponibilidad() + "</option>");
                                }
                            } else {
                                if (habi < 10) {
                                    out.print("<option>0" + habi + " || Tipo: " + tipo + "  || Accesorios:" + mane_ha.getHab().get(i).getAccesorio() + "</option>");
                                } else {
                                    out.print("<option>" + habi + " ||  Tipo: " + tipo + "  || Accesorios:" + mane_ha.getHab().get(i).getAccesorio() + "</option>");
                                }
                            }

                        }
                    %>
                </select>
                <br>
                <select class="form-control" name="select_tipo" id="sel1">
                    <%
                        tipo = "";
                        for (int i = 0; i < mane_ha.getTipo().size(); i++) {
                            tipo = mane_ha.getTipo().get(i).getNom_tipo();
                            id = mane_ha.getTipo().get(i).getId_tipo_hab();

                            out.print("<option>" + id + "   || " + tipo + "</option>");

                        }
                    %>
                </select>
                <!--Checkbox-->
                <div class="form-group form-check">
                    <input type="checkbox"  required="true">
                    <label>modificar</label>
                </div>
                <!--FIN: Checkbox-->
                <button type="submit" class="btn btn-dark btn-block" name="accion" value="modificar_ha" style='width:220px; height:35px'>Actualizar</button>
            </form>
            <br>
            <br>
            <br>
            <hr class="rayas">
            <form action="C_config" method="Post">
                <!-- Cuadros de texto-->
                <h1>Cambiar disponibilidad habitacion</h1>
                <select class="form-control" name="select_habitacion" id="sel1">
                    <option>seleccionar habitacion</option>
                    <%
                        tipo = "";
                        habi = 0;
                        for (int i = 0; i < mane_ha.getHab().size(); i++) {

                            for (int e = 0; e < mane_ha.getTipo().size(); e++) {
                                if (mane_ha.getHab().get(i).getTIPO_HAB_id_tipo_hab() == mane_ha.getTipo().get(e).getId_tipo_hab()) {
                                    tipo = mane_ha.getTipo().get(e).getNom_tipo();
                                }
                            }
                            habi = mane_ha.getHab().get(i).getNum_hab();
                            if (mane_ha.getHab().get(i).getDisponibilidad().compareToIgnoreCase("De alta") == 0 || mane_ha.getHab().get(i).getDisponibilidad().compareToIgnoreCase("De baja") == 0) {

                            } else {
                                if (habi < 10) {
                                    out.print("<option>0" + habi + " || Disponibilidad: " + mane_ha.getHab().get(i).getDisponibilidad() + "</option>");
                                } else {
                                    out.print("<option>" + habi + " || Disponibilidad: " + mane_ha.getHab().get(i).getDisponibilidad() + "</option>");
                                }
                            }

                        }
                    %>
                </select>
                <br>

                <select class="form-control" name="select_dis" id="sel1">
                    <option>Mantenimiento</option>
                    <option>Disponible</option>
                    <option>Reservada</option>
                </select>
                <!--Checkbox-->
                <div class="form-group form-check">
                    <input type="checkbox"  required="true">
                    <label>modificar</label>
                </div>
                <!--FIN: Checkbox-->
                <button type="submit" class="btn btn-dark btn-block" name="accion" value="modificar_dis" style='width:220px; height:35px'>Actualizar</button>
            </form>
            <br>
            <br>
            <br>
            <hr class="rayas">
            <form action="C_config" method="Post">
                <!-- Cuadros de texto-->
                <h1>Dar de baja habitacion(eliminar)</h1>
                <select class="form-control" name="select_habitacion" id="sel1">
                    <option>seleccionar habitacion</option>
                    <%
                        tipo = "";
                        habi = 0;
                        for (int i = 0; i < mane_ha.getHab().size(); i++) {

                            for (int e = 0; e < mane_ha.getTipo().size(); e++) {
                                if (mane_ha.getHab().get(i).getTIPO_HAB_id_tipo_hab() == mane_ha.getTipo().get(e).getId_tipo_hab()) {
                                    tipo = mane_ha.getTipo().get(e).getNom_tipo();
                                }
                            }
                            habi = mane_ha.getHab().get(i).getNum_hab();
                            if (mane_ha.getHab().get(i).getDisponibilidad().compareToIgnoreCase("Reservada") == 0 || mane_ha.getHab().get(i).getDisponibilidad().compareToIgnoreCase("De baja") == 0) {

                            } else {
                                if (habi < 10) {
                                    out.print("<option>0" + habi + " || Disponibilidad: " + mane_ha.getHab().get(i).getDisponibilidad() + "</option>");
                                } else {
                                    out.print("<option>" + habi + " || Disponibilidad: " + mane_ha.getHab().get(i).getDisponibilidad() + "</option>");
                                }
                            }

                        }
                    %>      
                </select>   
                <!--Checkbox-->
                <div class="form-group form-check">
                    <input type="checkbox"  required="true">
                    <label>modificar</label>
                </div>          
                <!--FIN: Checkbox-->
                <button type="submit" class="btn btn-dark btn-block" name="accion" value="baja_ha" style='width:220px; height:35px'>Dar de baja</button>
            </form>             
            <br>
            <br>
            <br>
            <hr class="rayas">
            <form action="C_config" method="Post">
                <!-- Cuadros de texto-->
                <h1>Dar de Alta habitacion(Restaurar)</h1>
                <select class="form-control" name="select_habitacion" id="sel1">
                    <option>seleccionar habitacion</option>
                    <%
                        tipo = "";
                        habi = 0;
                        for (int i = 0; i < mane_ha.getHab().size(); i++) {

                            for (int e = 0; e < mane_ha.getTipo().size(); e++) {
                                if (mane_ha.getHab().get(i).getTIPO_HAB_id_tipo_hab() == mane_ha.getTipo().get(e).getId_tipo_hab()) {
                                    tipo = mane_ha.getTipo().get(e).getNom_tipo();
                                }
                            }
                            habi = mane_ha.getHab().get(i).getNum_hab();
                            if (mane_ha.getHab().get(i).getDisponibilidad().compareToIgnoreCase("De baja") == 0) {
                                if (habi < 10) {
                                    out.print("<option>0" + habi + " || Disponibilidad: " + mane_ha.getHab().get(i).getDisponibilidad() + "</option>");
                                } else {
                                    out.print("<option>" + habi + " || Disponibilidad: " + mane_ha.getHab().get(i).getDisponibilidad() + "</option>");
                                }
                            } else {

                            }

                        }
                    %>      
                </select>   
                <!--Checkbox-->
                <div class="form-group form-check">
                    <input type="checkbox"  required="true">
                    <label>modificar</label>
                </div>          
                <!--FIN: Checkbox-->
                <button type="submit" class="btn btn-dark btn-block" name="accion" value="alta_ha" style='width:220px; height:35px'>Restaurar</button>
            </form>             
            <hr>
            <a href='Principal_admin.jsp' class="btn btn-dark btn-block">Volver</a>
                        <br>

        </div>

        <!-- cuerpo con identificadores reconocibles para el manejo del menu(nav,header) -->
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

        
        <%
          //Seguridad de pagina
    HttpSession hue = request.getSession();
    hue.setAttribute("per", "Configuraciones de administrador");
    try {
        String permiso = request.getParameter("id");
        if (permiso == null) {
            permiso = hue.getAttribute("per").toString();
            if (permiso == null) {
                response.sendRedirect("login.jsp");
            } else {
                out.print(""+permiso+"");
            }
        } else {
            out.print(""+permiso+"");
        }
    } catch (Exception e) {
        response.sendRedirect("login.jsp");
    }

        %>
    </body>
</html>
