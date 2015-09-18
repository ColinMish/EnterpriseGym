<%-- 
    Document   : news
    Created on : 15-Sep-2015, 14:22:05
    Author     : Dave
--%>


<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="Entities.NewsEntity" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <% Map<String, NewsEntity> storys = (HashMap) request.getAttribute("Storys"); %>
<!DOCTYPE html>
<html>
    <head>
        <link href='css/profile.css' rel='stylesheet' type='text/css'>
    </head>
</body>
    <%@include file="header.jsp" %>
    <%@include file="sidebar.jsp" %>
    
    <!-- Page Content -->
     <div class="container">

       <div class="row">
            <div class="col-lg-12">
                <h1>News</h1>
                <p></p>
            </div>
        </div>
    
    
        <%for(NewsEntity story : storys.values())
        { %>
        <%="<div class=\"col-md-4\" id=\"AboutText\">"%>
                <%="<div class=\"panel panel-default\">"%>
                    <%="<div class=\"panel-heading\">"%>
                        <%="<h4><i class=\"fa fa-fw fa-check\"></i>" + story.getTitle() + "</h4>"%>
                    <%="</div>"%>
                    <%="<div class=\"panel-body\">"%>
                        <%="<p>"%>
                        <% String brief = story.getContent().substring(0, 500) + "...";%>
                            <%=brief + "</p>"%>
                        <%="<a href=\"News/" + story.getTitle() + "\" class=\"btn btn-default\">Read More</a>"%>
                    <%="</div>"%>
                <%="</div>"%>
            <%="</div>"%>
        <%}%>
    </div>
    <%@include file ="footer.jsp" %>
    </body>
</html>
