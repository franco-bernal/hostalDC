<%-- 
    Document   : redirect
    Created on : 04-07-2020, 20:25:54
    Author     : Franco
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/Util.css" rel="stylesheet" type="text/css"/>
        <%
            HttpSession rs = request.getSession();
            String pag = rs.getAttribute("redirect").toString();
        %>
        <META HTTP-EQUIV="Refresh" CONTENT="3;URL=<%=pag%>">
       <% rs.removeAttribute("redirect"); %>
        <title>Redirect</title>


    </head>
    <body >
          <h1 class="letras">Cargando...</h1>
        <img src="https://steamuserimages-a.akamaihd.net/ugc/394426147786758208/A797F77D6693AE7ACBF0FE2D1244795217A18A58/" width="100px"  height="120px">
      
        
    </body>
</html>
