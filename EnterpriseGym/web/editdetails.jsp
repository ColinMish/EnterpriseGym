<%-- 
    Document   : editdetails
    Created on : 17-Sep-2015, 14:24:34
    Author     : kristiyangeorgiev
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
   <head>
      <link href='css/profile.css' rel='stylesheet' type='text/css'>  
   </head>
    
    <body>
        <%@include file="header.jsp" %>
        <%@include file="sidebar.jsp" %>
        
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <h1>Edit Details</h1><br>
                </div>
            </div>
            
            <div class="col-md-8" id="ConnectText">
                <div class="panel panel-default">
                    
                   <div class="panel-body">
                            
                        <div class="form-group">
                            <label for="usr">First Name:</label>
                            <input type="text" class="form-control" id="usr">
                        </div>
            
                        <div class="form-group">
                            <label for="usr">Last Name:</label>
                            <input type="text" class="form-control" id="usr">
                        </div>
            
                        <div class="form-group">
                            <label for="usr">Email Address:</label>
                            <input type="text" class="form-control" id="usr">
                        </div>
            
                        <div class="form-group">
                            <label for="usr">Year of study:</label>
                            <input type="text" class="form-control" id="usr">
                        </div>
            
                        <a class="btn btn-primary" href="profile.jsp">Update</a><br><br>
            
                    </div>
                </div>
            </div>
            
            <div class="col-md-8" id="ConnectText">
                <div class="panel panel-default">
                    
                   <div class="panel-body">
                       
                       <div class="form-group">
                            <label for="usr">Old Password:</label>
                            <input type="text" class="form-control" id="usr">
                        </div>
                       
                       <div class="form-group">
                            <label for="usr">New Password:</label>
                            <input type="text" class="form-control" id="usr">
                        </div>
            
                        <div class="form-group">
                            <label for="usr">New Password Again:</label>
                            <input type="text" class="form-control" id="usr">
                        </div>
                       
                        <a class="btn btn-primary" href="profile.jsp">Update</a><br><br>
                   </div>
                </div>
            </div>
        </div>
        <%@include file ="footer.jsp" %>
    </body>
</html>
