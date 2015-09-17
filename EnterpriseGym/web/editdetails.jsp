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
        
        <article>
            
            <form name="myForm" method="post" action="EditDetails">
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
                            <label for="firstn">First Name:</label>
                            <input type="text" name="firstn" class="form-control" id="firstn">
                        </div>
            
                        <div class="form-group">
                            <label for="lastn">Last Name:</label>
                            <input type="text" name="lastn" class="form-control" id="lastn">
                        </div>
            
                        <div class="form-group">
                            <label for="email">Email Address:</label>
                            <input type="text" name="email" class="form-control" id="email">
                        </div>
            
                        <div class="form-group">
                            <label for="year">Year of study:</label>
                            <input type="text" name="year" class="form-control" id="year">
                        </div>
            
                        <input class="btn btn-primary" type="submit" value="Update"><br><br>
            
                    </div>
                </div>
            </div>
            
            <div class="col-md-8" id="ConnectText">
                <div class="panel panel-default">
                    
                   <div class="panel-body">
                       
                       <div class="form-group">
                            <label for="usr">Old Password:</label>
                            <input type="text" name="oldpass" class="form-control" id="usr">
                        </div>
                       
                       <div class="form-group">
                            <label for="usr">New Password:</label>
                            <input type="text" name="newpass" class="form-control" id="usr">
                        </div>
            
                        <div class="form-group">
                            <label for="usr">New Password Again:</label>
                            <input type="text" name="newpass" class="form-control" id="usr">
                        </div>
                       
                       <input class="btn btn-primary" type="submit" value="Update"><br><br>
                   </div>
                </div>
            </div>
        </div>
                
            </form>

        </article>
        <%@include file ="footer.jsp" %>
    </body>
</html>
