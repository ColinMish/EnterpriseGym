<%-- 
    Document   : eventItems
    Created on : Sep 22, 2015, 12:11:05 PM
    Author     : colin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Entities.EventEntity" %>
<!DOCTYPE html>
<html>
    <head>
        <link href='css/carousel.css' rel='stylesheet' type='text/css'>
    </head>
    <%@include file="header.jsp" %>
    <div class ="mobile">
    <%@include file="sidebar.jsp"%>
    </div>
   
    <% EventEntity eventItem = (EventEntity) request.getAttribute("eventItem"); %>
    <!-- Page Content -->
    
    <div class="col-md-4">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4><i class="fa fa-fw fa-gift"></i><%=eventItem.getName()%></h4>
            </div>
            <div class="panel-body">
                <p><%=eventItem.getDescription()%></p>
                <a href="../Events" class="btn btn-default">Back</a>
            </div>
        </div>
    </div>
    
    <%@include file ="footer.jsp" %>
    </body>
</html>