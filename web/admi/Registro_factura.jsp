<%-- 
    Document   : Registro_factura
    Created on : 10-07-2020, 19:31:33
    Author     : Franco
--%>

<%@page import="Modelo.Manejadoras.Manejadora_factura"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
            //Seguridad de pagina
            String llave = "ok";
            try {
                String permiso = request.getParameter("id");
                if (permiso == null) {
                    response.sendRedirect("../login.jsp");
                } else {
                    if (permiso.compareToIgnoreCase(llave) == 0) {
                        out.print(permiso + "-");
                    } else {
                        response.sendRedirect("../login.jsp");
                    }
                }
            } catch (Exception e) {
                response.sendRedirect("../login.jsp");
            }
        %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        <title>Facturas</title>
        <%
            Manejadora_factura mane_fa = new Manejadora_factura();
        %>
        <script src="../js/configExcel/xlsx.full.min.js"></script>
        <script src="../js/configExcel/FileSaver.min.js"></script>
        <script src="../js/configExcel/tableexport.min.js"></script>
         <link href="/hostalDC-master/css/registro_factura.css"  rel="stylesheet" type="text/css"/>
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
         <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
    </head>
    <body >
        <!-------------------------->


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script>
        <button class="btn btn-secondary btn-sm" onclick="aPDF();"> Exportar a pdf </button>

        <button type="button" class="btn btn-secondary btn-sm" onclick="javascript:window.print()">Imprimir</button>

        <button class="btn btn-secondary btn-sm" onclick="Export2Doc('exportContent');">Export as .doc</button>
        <button class="btn btn-secondary btn-sm" id="btnExportar">Exportar a excel</button>
          <a href="/hostalDC-master/Principal_admin.jsp" class="btn btn-secondary btn-sm" aria-pressed="true">Volver</a>
        
        <!---------------------->

        <div class="centrar" id="customers" class="text-center"  >
            <div id="exportContent">
                <h1  class="page-header" >
                    <br>
                    <br>
                    Facturas
                </h1>
                <div class="accesos">
                    <br>
                </div>
                
                <!-- TABLA INICIA orden compra-->

                <table   WIDTH="30" HEIGHT="40" border="2" width="2"  cellpadding="10"  class="table "  id="tabla" >
                    <thead>
                        <tr>
                            <td >
                                <input id="buscar" type="text"  placeholder="Filtrar Busqueda" />
                            </td>
                        </tr>
                        <tr>
                            <th>Codigo</th>
                            <th>Fecha Emisión</th>
                            <th>Valor total</th>
                        </tr>

                    </thead>
                    <tbody> 
                        <%
                            for (int i = 0; i < mane_fa.getFactura().size(); i++) {
                                out.print(""
                                        + "<tr>"
                                        + "<td WIDTH='30' HEIGHT='40' >" + mane_fa.getFactura().get(i).getCod_factura() + "</td>"
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






        <!-- scripts para exports -->
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

        <script>

            const $btnExportar = document.querySelector("#btnExportar"),
                    $tabla = document.querySelector("#tabla");

            $btnExportar.addEventListener("click", function () {
                let tableExport = new TableExport($tabla, {
                    exportButtons: false, // No queremos botones
                    filename: "Mi tabla de Excel", //Nombre del archivo de Excel
                    sheetname: "Mi tabla de Excel", //Título de la hoja
                });
                let datos = tableExport.getExportData();
                let preferenciasDocumento = datos.tabla.xlsx;
                tableExport.export2file(preferenciasDocumento.data, preferenciasDocumento.mimeType, preferenciasDocumento.filename, preferenciasDocumento.fileExtension, preferenciasDocumento.merges, preferenciasDocumento.RTL, preferenciasDocumento.sheetname);
            });
        </script>

        <script>
            function Export2Doc(element, filename = '') {
                var preHtml = "<html xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:w='urn:schemas-microsoft-com:office:word' xmlns='http://www.w3.org/TR/REC-html40'><head><meta charset='utf-8'><title>Export HTML To Doc</title></head><body>";
                var postHtml = "</body></html>";
                var html = preHtml + document.getElementById(element).innerHTML + postHtml;

                var blob = new Blob(['\ufeff', html], {
                    type: 'application/msword'
                });

                // Specify link url
                var url = 'data:application/vnd.ms-word;charset=utf-8,' + encodeURIComponent(html);

                // Specify file name
                filename = filename ? filename + '.doc' : 'document.doc';

                // Create download link element
                var downloadLink = document.createElement("a");

                document.body.appendChild(downloadLink);

                if (navigator.msSaveOrOpenBlob) {
                    navigator.msSaveOrOpenBlob(blob, filename);
                } else {
                    // Create a link to the file
                    downloadLink.href = url;

                    // Setting the file name
                    downloadLink.download = filename;

                    //triggering the function
                    downloadLink.click();
                }

                document.body.removeChild(downloadLink);
            }
        </script>


        <script>
            function aPDF() {
                let doc = new jsPDF('p', 'pt', 'a4');

                doc.addHTML(document.body, function () {
                    doc.save('facturas.pdf');
                });
            }
        </script>

    </body>
</html>
