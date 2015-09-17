<%-- 
    Document   : profile
    Created on : 17-Sep-2015, 10:48:10
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
    
            <!-- Page Content -->
    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <h1>User Profile</h1>
                <p></p>
            </div>
        </div>
        
        
        <div class="col-md-4" id="ConnectText">
                <div class="panel panel-default">
                    
                        <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i><strong>Available Options</strong></h4><br>
                        </div>
                    
                        <div class="panel-body">
                            <div class="usermenu">
                        
                            <a class="btn btn-default one" href="points.jsp">My Points</a><br><br>
                            
                            <a class="btn btn-default two" href="editdetails.jsp">Edit Details</a>
                            
                            </div>
                        </div>
                    
                    
                   
                </div>
        </div>
        
        <div class="col-md-8" id="ConnectText">
                <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4><i class="fa fa-fw fa-check"></i><strong>Profile Picture</strong></h4><br>
                        </div>
                    
                    <div class="panel-body">
                        <div class="profpicture">
                            <table class="table table-hover">
                            <thead>
                            <tr>
                                <th><input name="photo" type="file"></th>
                            </tr>
                            </thead>
                            </table>
                            <button type="button" class="btn btn-default three">Upload an Image</button><br>
                           
                        </div>
                    </div>
                  </div>
                </div>
            
        <div class="col-md-8" id="ConnectText">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i><strong>Account Details</strong></h4><br>
                    </div>
                    <div class="panel-body">
                        <table class="table table-hover">
                        <thead>
                           <tr>
                            <th>Firstname:</th>
                            <th>Kristiyan</th>
                           </tr>
                           <tr>
                            <th>LastName:</th>
                            <th>Georgiev</th>
                           </tr>
                           <tr>
                            <th>Gender:</th>
                            <th>Male</th>
                           </tr>
                           <tr>
                            <th>Country:</th>
                            <th>Bulgaria</th>
                           </tr>
                           <tr>
                            <tr>
                            <th>Email:</th>
                            <th>test@gmail.com</th>
                           </tr>
                            <th>University:</th>
                            <th>Dundee University</th>
                           </tr>
                           <tr>
                            <th>School:</th>
                            <th>School of Computing</th>
                           </tr>
                           <tr>
                            <th>Year:</th>
                            <th>4th</th>
                           </tr>
                           <tr>
                            <th>Matriculation Number:</th>
                            <th>120013755</th>
                           </tr>
                        </thead>
                        
                        </table>
                        </div>

       
                    </div>
                </div>
        </div>
    
    
            
            
    <%@include file ="footer.jsp" %>
    </body>
</html>
