<%-- 
    Document   : newsStory
    Created on : 15-Sep-2015, 17:50:05
    Author     : Dave 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Entities.NewsEntity" %>
<!DOCTYPE html>
<html>
       <% if (session.getAttribute("username") == null){ %>
         <%@include file="header.jsp" %>
   <% }else{ %>
     <%@include file="headerloggedin.jsp" %> <%}%>
   
    <% NewsEntity story = (NewsEntity) request.getAttribute("Story"); %>
    <!-- Page Content -->
    
    <div class="col-md-4">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4><i class="fa fa-fw fa-gift"></i><%=story.getTitle()%></h4>
            </div>
            <div class="panel-body">
                <p><%=story.getContent()%></p>
                <a href="../News" class="btn btn-default">Back</a>
            </div>
        </div>
    </div>
    
    <%@include file ="footer.jsp" %>
    </body>
</html>