<%-- 
    Document   : eventsTest
    Created on : 2015-sep-15, 13:42:57
    Author     : Kim
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Entities.EventEntity"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Entities.NewsEntity" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <link href='${pageContext.request.contextPath}/css/profile.css' rel='stylesheet' type='text/css'>
        <link href='${pageContext.request.contextPath}/css/media.css' rel='stylesheet' type='text/css'>
    </head>
<body>
     <%@include file="header.jsp" %>
    <div class="mobile">
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
             
             <%
            java.util.LinkedList<EventEntity> events = (java.util.LinkedList<EventEntity>) request.getAttribute("events");
            if (events.size() ==0)  {
        %>
        <p>No Events found.</p>
        <%
        } else {   
                  Iterator<EventEntity> iterator;
            iterator = events.iterator();
            while (iterator.hasNext()) {
                EventEntity p = (EventEntity) iterator.next();
         %>
        <div class="col-md-4" id="AboutText">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i><%=p.getName()%></h4>
                    </div>
                    <div class="panel-body">
                        <p>
                        <p><%=p.getDescription()%></p>
                        
                             <% if (p.getLength()!=0){ %>                    
                            <img src="${pageContext.request.contextPath}/Events/Picture/<%=p.getID()%>" style="max-height: 100px; max-width: 100px;" class="img-responsive" alt="News Image">
                            <%} %>
                        </p>
                        <a href="${pageContext.request.contextPath}/Events/Event/<%=p.getID()%>" class="btn btn-default">Read More</a>
                    </div>
                </div>
            </div>
        <%}%>
                <%}%>
    </div>
    <%@include file ="footer.jsp" %>
    </body>
</html>

