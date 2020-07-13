<%-- 
    Document   : VisitasTabla
    Created on : 13-07-2020, 17:45:24
    Author     : Franco
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Entidades.Visitas_aux"%>
<%@page import="Modelo.Manejadoras.Manejadora_visitas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Informes y est.</title>
        <link rel="icon" type="image/vnd.microsoft.icon" href="favicon-cdlibre-16.ico" sizes="16x16">

        <script src="../js/configExcel/xlsx.full.min.js"></script>
        <script src="../js/configExcel/FileSaver.min.js"></script>
        <script src="../js/configExcel/tableexport.min.js"></script>
    </head>
    <body>
        <a>Informes y estadisticas</a>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script>

        <button onclick="aPDF();"> Exportar a pdf </button>
        <button type="button" onclick="javascript:window.print()">Imprimir</button>
        <button onclick="Export2Doc('exportContent');">Export as .doc</button>
        <button id="btnExportar">Exportar a excel</button>



        <div class="row">
            <div class="col-xs-12  d-flex justify-content-center"  id="exportContent">
                <h1 class="page-header">
                    Visitas
                </h1>


                <%
                    Manejadora_visitas mane_vi = new Manejadora_visitas();
                    ArrayList<Visitas_aux> arrayVi = mane_vi.ObtenerVisitaPorMes();
                    out.print(arrayVi.get(0).getMes());
                %>

                <!-- TABLA INICIA orden compra-->


                <table border="2" width="1" cellpadding="5" id="tabla" class="table table-striped ">
                    <thead>
                        <tr>
                            <td colspan="4">
                                <input id="buscar" type="text" class="form-control" placeholder="Escriba algo para filtrar" />
                            </td>
                        </tr>
                        <tr>
                            <th>cantidad</th>
                            <th>Mes</th>
                        </tr>

                    </thead>
                    <tbody>

                        <%
                            for (int i = 0; i < arrayVi.size(); i++) {
                                Visitas_aux vi_a = arrayVi.get(i);
                                int meta = 100;
                                int por = Math.round((vi_a.getCantidad() * meta) / 100);
                                out.print(""
                                        + "<tr>"
                                        + "<td>" + vi_a.getCantidad() + "</td>"
                                        + "<td>" + vi_a.getMes() + " </td>"
                                        + "</tr>");
                            }
                        %>
                    </tbody>
                </table>
                <!-- TABLA FINALIZA -->
                <a href="../visitas.jsp" class="btn btn-success">Ver grafico de barras<i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
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
