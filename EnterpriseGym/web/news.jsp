<%-- 
    Document   : news
    Created on : 15-Sep-2015, 14:22:05
    Author     : Dave
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
            java.util.LinkedList<NewsEntity> news = (java.util.LinkedList<NewsEntity>) request.getAttribute("news");
            if (news == null) {
        %>
        <p>No News found.</p>
        <%
        } else {   
                  Iterator<NewsEntity> iterator;
            iterator = news.iterator();
            while (iterator.hasNext()) {
                NewsEntity p = (NewsEntity) iterator.next();
         %>
        <div class="col-md-4" id="AboutText">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i><%=p.getTitle()%></h4>
                    </div>
                    <div class="panel-body">
                        <p>
                        <p><%=p.getContent()%></p>
                        
                             <% if (p.getLength()!=0){ %>                    
                            <img src="${pageContext.request.contextPath}/News/Picture/<%=p.getId()%>" style="max-height: 100px; max-width: 100px;" class="img-responsive" alt="News Image">
                            <%} %>
                        </p>
                        <a href="${pageContext.request.contextPath}/News/Article/<%=p.getId()%>" class="btn btn-default">Read More</a>
                    </div>
                </div>
            </div>
        <%}%>
                <%}%>
    </div>
    <%@include file ="footer.jsp" %>
    </body>
</html>
