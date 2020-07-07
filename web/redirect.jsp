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
        <META HTTP-EQUIV="Refresh" CONTENT="1;URL=<%=pag%>">
       <% rs.removeAttribute("redirect"); %>
        <title>Redireccionando...</title>


    </head>
    <body >
          <h1 class="letras">Cargando...</h1>
        <img src="https://static.wixstatic.com/media/81cab9_ce4a29f9ba69499fbdea5bf8ec9e75f7~mv2.gif" width="20%"  height="20%">
      
        
    </body>
</html>
