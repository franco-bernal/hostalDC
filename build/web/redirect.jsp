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
      <body background="https://i.pinimg.com/originals/9d/43/da/9d43da092565f9f5003c3aaa64292902.gif" >
       
          <h1 class="letras">Cargando...</h1>
         
       
      
      
    </body>
</html>
