<%-- 
    Document   : agregarProductos
    Created on : 01-07-2020, 2:35:29
    Author     : Franco
--%>

<%@page import="Modelo.Util"%>
<%@page import="Modelo.Entidades.Producto"%>
<%@page import="Modelo.Manejadoras.Manejadora_productos"%>
<%@page import="Modelo.Entidades.UsuarioProveedor"%>
<%@page import="Modelo.Manejadoras.Manejadora_proveedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar pedidos</title>
        <link href="css/Util.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link href="css/agregar.css" rel="stylesheet" type="text/css"/>      
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    </head>
    <body  class="letras ">
        <div id="accesos" class="som" >
            <script>
            </script>
            <%
                HttpSession rs = request.getSession();
                Util util = new Util();
                Manejadora_proveedor mane_prov = new Manejadora_proveedor();
                Manejadora_productos mane_produ = new Manejadora_productos();
                UsuarioProveedor prov = new UsuarioProveedor();

                String nom_prov = rs.getAttribute("prov").toString();
                int id = Integer.parseInt(rs.getAttribute("id").toString());
                rs.setAttribute("id_ord", id);
                for (int i = 0; i < mane_prov.getProveedor().size(); i++) {
                    String nom_comparar = util.quitarEspaciosAlFInal(mane_prov.getProveedor().get(i).getNom_empresa());
                    if (nom_comparar.compareToIgnoreCase(nom_prov) == 0) {

                        prov = mane_prov.getProveedor().get(i);

                    }

                }

            %>


            <h1><% out.print(prov.getNom_empresa()); %> | <%out.print(prov.getRubro());%> </h1>

            <h4>Rut:<%out.print(prov.getRut());%></h4>
            <h4>Compra:<%out.print(id);%> </h4>


            <form action="ControlPedido" method="post">
                <h4>Pedido</h4> <input type='text' class='form-control desactivar' name='txt_rut' value="<%=prov.getRut()%>">
                <h4>Elija un Producto</h4>
                <select  style="text-align:center;"   class="form-control" name="select_prod">
                    <%
                        try {
                            if (mane_produ.getProducto().size() == 0) {
                                out.print("<option >Aún no tiene productos</option>");
                            } else {
                                for (int i = 0; i < mane_produ.getProducto().size(); i++) {
                                    if (mane_produ.getProducto().get(i).getProveedor_rut().compareToIgnoreCase(prov.getRut()) == 0) {
                                        out.print("<option>" + mane_produ.getProducto().get(i).getNombre() + "</option>");
                                    }
                                }
                            }
                        } catch (Exception e) {
                            out.print("<option >Error en esta area</option>");
                        }
                    %>
                </select>


                <h5  >Cantidad</h5>
                <input type="number" class="can" style="width:35%"  class=" form-control"  name="txt_cant" min="1" max="10000" >
                <br> <br>
                <input type="checkbox"  required="true">
                <h4>Revise los datos</h4>
                <button type="submit" class="btn btn-success bt" name="accion" value="Agregar_productos">Agregar al carro</button>
            </form>

            <!--boton Cancelar -->
            <form action="ControlPedido" method="post">
                <button type="submit" class="btn btn-danger bt" name="accion" value="cancelar">Salir y Eliminar Compra</button>
            </form>
            <form action="ControlPedido" method="post">
                <button type="submit" class="btn btn-success bt" name="accion" value="Enviar">Confirmar y enviar</button>
            </form>


            <a href='empleado_home.jsp' class="btn btn-warning bt">Dejar pendiente</a>
            <br>
            <br>
        </div>
    </body>
</html>
