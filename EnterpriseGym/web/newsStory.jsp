<%-- 
    Document   : newsStory
    Created on : 15-Sep-2015, 17:50:05
    Author     : Dave 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Entities.NewsEntity" %>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp" %>
    <div class ="mobile">
    <%@include file="sidebar.jsp"%>
    </div>
   
    <% NewsEntity story = (NewsEntity) request.getAttribute("Story"); %>
    <!-- Page Content -->
    
    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4><i class="fa fa-fw fa-gift"></i>Title</h4>
            </div>
            <div class="panel-body">
                <p>Content</p>
                <a href="../News" class="btn btn-default">Back</a>
            </div>
        </div>
    </div>
    
    <%@include file ="footer.jsp" %>
    </body>
</html>