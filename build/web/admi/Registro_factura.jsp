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
        <button onclick="aPDF();"> Exportar a pdf </button>

        <button type="button" onclick="javascript:window.print()">Imprimir</button>

        <button onclick="Export2Doc('exportContent');">Export as .doc</button>
        <button id="btnExportar">Exportar a excel</button>
        <!---------------------->

        <div class="row">
            <div  class="col-xs-12  d-flex justify-content-center" id="exportContent">
                <h1 class="page-header">
                    Facturas
                </h1>
                <!-- TABLA INICIA orden compra-->

                <table border="2" width="1" cellpadding="5" id="tabla" class="table table-striped ">
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
                                        + "<td>" + mane_fa.getFactura().get(i).getCod_factura() + "</td>"
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
