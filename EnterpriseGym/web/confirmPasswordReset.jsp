<%-- 
    Document   : confirmPasswordReset
    Created on : Sep 25, 2015, 2:39:59 PM
    Author     : colin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <link href='${pageContext.request.contextPath}/css/style.css' rel='stylesheet' type='text/css'>
      <link href='${pageContext.request.contextPath}/css/media.css' rel='stylesheet' type='text/css'>
    </head> 
   
    <body>
    <%@include file="header.jsp" %>
    <div class ="mobile">
    <%@include file="sidebar.jsp"%>
    </div>
    <div class="container">

        <p>Your password reset token is: <%=request.getParameter("token")%></p>
    </container>
    
    </body>
</html>
