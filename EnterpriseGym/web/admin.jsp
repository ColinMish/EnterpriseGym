<%-- 
    Document   : admin
    Created on : 21-Sep-2015, 16:44:50
    Author     : Andy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
   <head>
      <link href='css/style.css' rel='stylesheet' type='text/css'>
    </head> 
   
    <body>
    <%@include file="header.jsp" %>
    <div class="hidden-xs">
        <%@include file="sidebar.jsp"%>
    </div>
    
    <!-- Page Content -->
    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <h1>Admin Panel</h1>
                <p></p>
            </div>
        </div>
        
        <div class="col-md-12" id="AdminText">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4><i class="fa fa-fw fa-check"></i>News Editor</h4>
                </div>
                <div class="panel-body">

                </div>
            </div>
        </div>
        <div class="col-md-12" id="AdminText">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4><i class="fa fa-fw fa-check"></i>User Management</h4>
                </div>
                <div class="panel-body">

                </div>
            </div>
        </div>
        <div class="col-md-12" id="AdminText">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4><i class="fa fa-fw fa-check"></i>Events Management</h4>
                </div>
                <div class="panel-body">

                </div>
            </div>
        </div>
        <div class="col-md-12" id="AdminText">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4><i class="fa fa-fw fa-check"></i>Quiz Management</h4>
                </div>
                <div class="panel-body">

                </div>
            </div>
        </div>
    </div>
    
    <%@include file ="footer.jsp" %>
    </body>
</html>

