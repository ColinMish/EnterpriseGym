<%-- 
    Document   : news
    Created on : 15-Sep-2015, 14:22:05
    Author     : Dave
--%>


<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="Entities.NewsEntity" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link href='css/profile.css' rel='stylesheet' type='text/css'>
    </head>
</body>
      <%@include file="header.jsp" %>
    <div class="hidden-xs">
        <%@include file="sidebar.jsp"%>
    </div>
    
    <!-- Page Content -->
     <div class="container">

       <div class="row">
            <div class="col-lg-12">
                <h1>News</h1>
                <p></p>
            </div>
        </div>

    </div>
    <%@include file ="footer.jsp" %>
    </body>
</html>
