<%-- 
    Document   : Registro_factura
    Created on : 10-07-2020, 19:31:33
    Author     : Franco
--%>

<%@page import="Modelo.Manejadoras.Manejadora_factura"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>facturas</title>
        <%
            Manejadora_factura mane_fa = new Manejadora_factura();
        %>
        <script src="../js/configExcel/xlsx.full.min.js"></script>
        <script src="../js/configExcel/FileSaver.min.js"></script>
        <script src="../js/configExcel/tableexport.min.js"></script>
    </head>
    <body>
        <!-------------------------->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script>


        <button id="btnExportar">Exportar</button>  
        <button onclick="aPDF();"> Exportar a pdf </button>
        <button type="button" onclick="javascript:window.print()">Imprimir</button>
        <!---------------------->

        <div class="row">
            <div  class="col-xs-12  d-flex justify-content-center">
                <h1 class="page-header">
                    Facturas
                </h1>
                <!-- TABLA INICIA orden compra-->


                <table border="2" width="1" cellpadding="5" id="tabla tblData" class="table table-striped ">
                    <thead>
                        <tr>
                            <td colspan="4">
                                <input id="buscar" type="text" class="form-control" placeholder="Escriba algo para filtrar" />
                            </td>
                        </tr>
                        <tr>
                            <th>Codigo</th>
                            <th>fecha emicion</th>
                            <th>Valor total</th>
                        </tr>

                    </thead>
                    <tbody>
                        <%
                            for (int i = 0; i < mane_fa.getFactura().size(); i++) {
                                out.print(""
                                        + "<tr>"
                                        + "<td>cod-" + mane_fa.getFactura().get(i).getCod_factura() + "</td>"
                                        + "<td>" + mane_fa.getFactura().get(i).getF_emicion() + "</td>"
                                        + "<td>" + mane_fa.getFactura().get(i).getValor_total() + "</td>"
                                        + "</tr>");
                            }
                        %>
                    </tbody>
                </table>
                <!-- TABLA FINALIZA -->




            </div>
        </div>



        <script src="/js/exportExcel.js"></script>

        <!------------------------------------------------------- -->

        <script>
            function aPDF() {
                let doc = new jsPDF('p', 'pt', 'a4');

                doc.addHTML(document.body, function () {
                    doc.save('facturas.pdf');
                });
            }
        </script>




        <script>
            //script de filtros
            var busqueda = document.getElementById('buscar');
            var table = document.getElementById("tabla").tBodies[0];

            buscaTabla = function () {
                texto = busqueda.value.toLowerCase();
                var r = 0;
                while (row = table.rows[r++])
                {
                    if (row.innerText.toLowerCase().indexOf(texto) !== -1)
                        row.style.display = null;
                    else
                        row.style.display = 'none';
                }
            }

            busqueda.addEventListener('keyup', buscaTabla);



        </script>




    </body>
</html>
