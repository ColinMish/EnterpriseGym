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

    </head>
<body>
     <%@include file="header.jsp" %>
    <div class="mobile">
    <%@include file="sidebar.jsp"%>
    </div>
    <div class="banner"></div>
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
            if (news.size() ==0)  {
        %>
        <p>No News found.</p>
        <%
        } else {   
                  Iterator<NewsEntity> iterator;
            iterator = news.iterator();
            while (iterator.hasNext()) {
                NewsEntity p = (NewsEntity) iterator.next();
         %>
        <div class="col-sm-4" id="AboutText">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i><%=p.getTitle()%></h4>
                    </div>
                    <div class="panel-body" class="panel-height">
                        <p>
                        <p><%=p.getContent()%></p>
                        
                             <% if (p.getLength()!=0){ %>                    
                            <img src="${pageContext.request.contextPath}/News/Picture/<%=p.getId()%>" style="max-height: 175px; max-width: 175px;" class="img-responsive" alt="News Image">
                            <%} %>
                       
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
