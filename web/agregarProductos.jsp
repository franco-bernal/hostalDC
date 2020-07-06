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


    </head>
    <body>
        <script>
        </script>
        <%
            HttpSession rs = request.getSession();
            Util util = new Util();
            Manejadora_proveedor mane_prov = new Manejadora_proveedor();
            Manejadora_productos mane_produ = new Manejadora_productos();
            UsuarioProveedor prov = new UsuarioProveedor();
            

            String nom_prov = rs.getAttribute("prov").toString();
            int id=Integer.parseInt(rs.getAttribute("id").toString());
            rs.setAttribute("id_ord", id);
            for (int i = 0; i < mane_prov.getProveedor().size(); i++) {
                String nom_comparar = util.quitarEspaciosAlFInal(mane_prov.getProveedor().get(i).getNom_empresa());
                if (nom_comparar.compareToIgnoreCase(nom_prov) == 0) {

                    prov = mane_prov.getProveedor().get(i);

                }

            }

        %>


        <h1><% out.print(prov.getNom_empresa()); %>|</h1>
        <h2>rubro:<%out.print(prov.getRubro());%></h2>
        <h3>rut:<%out.print(prov.getRut());%></h3>
        <h1>Compra:<%out.print(id); %> </h1>


        <form action="ControlPedido" method="post">
            <p>Pedido</p>
            <input type='text' class='form-control desactivar' name='txt_rut' value="<%=prov.getRut() %>">
            <label>elija un producto</label>
            <select name="select_prod">
                <%
                    try {
                        if (mane_produ.getProducto().size() == 0) {
                            out.print("<option>Aún no tiene productos</option>");
                        } else {
                            for (int i = 0; i < mane_produ.getProducto().size(); i++) {
                                if (mane_produ.getProducto().get(i).getProveedor_rut().compareToIgnoreCase(prov.getRut()) == 0) {
                                    out.print("<option>" + mane_produ.getProducto().get(i).getNombre() + "</option>");
                                }
                            }
                        }
                    } catch (Exception e) {
                        out.print("<option>Error en esta area</option>");
                    }
                %>
            </select>
            <hr>
            <label>cantidad</label>
            <input type="number" name="txt_cant" min="1" max="10000" >


            <label id="aa">cantidad</label>

            <hr>
            <input type="checkbox"  required="true">
            <label >Revisé los datos</label>
            <button type="submit"  name="accion" value="Agregar_productos">Agregar al carro</button>
        </form>
            
            <!--boton Cancelar -->
            <form action="ControlPedido" method="post">
                <button type="submit"  name="accion" value="cancelar">salir y eliminar compra</button>
            </form>
            <form action="ControlPedido" method="post">
                <button type="submit"  name="accion" value="Enviar">Confirmar y enviar</button>
            </form>
            

            <a href='empleado_home.jsp' class="boton verde">Dejar pendiente</a>
    </body>
</html>
