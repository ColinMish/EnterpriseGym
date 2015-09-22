<%-- 
    Document   : profile
    Created on : 17-Sep-2015, 10:48:10
    Author     : kristiyangeorgiev
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Entities.UserEntity"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
      <link href='css/profile.css' rel='stylesheet' type='text/css'>
      <link href='css/media.css' rel='stylesheet' type='text/css'>
    </head>
    <body>
    <%@include file="header.jsp" %>
    <%@include file="sidebar.jsp"%>
    
            <!-- Page Content -->
    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <h1>User Profile</h1>
                <p></p>
            </div>
        </div>
        
        
        <div class="col-md-4" id="ConnectText">
                <div class="panel panel-default panelmobile">
                    
                        <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i><strong></strong></h4><br>
                        </div>
                    
                        <div class="panel-body">
                            <div class="usermenu">
                        
                            <a class="btn btn-default one col-lg-12" href="${pageContext.request.contextPath}/Profile/Points">My Points</a><br><br>
                            
                            <a class="btn btn-default two col-lg-12" href="${pageContext.request.contextPath}/Profile/EditProfile">Edit Details</a>
                            
                            </div>
                        </div>
                    
                    
                   
                </div>
        </div>
        
        
            
        <div class="col-md-8" id="ConnectText">
                <div class="panel panel-default panelmobile">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i><strong>Account Details</strong></h4><br>
                    </div>
                    <div class="panel-body">
                        <table class="table table-hover">
                            <%
                            java.util.LinkedList<UserEntity> user = (java.util.LinkedList<UserEntity>) request.getAttribute("userdetails");
                            Iterator<UserEntity> iterator;
           iterator = user.iterator();
            while (iterator.hasNext()) {
                UserEntity p = (UserEntity) iterator.next();         
                      %>      
                        <thead>
                           <tr>
                            <th>Firstname:</th>
                            <th><%=p.getName()%></th>
                           </tr>
                           <tr>
                            <th>LastName:</th>
                            <th><%=p.getLastname()%></th>
                           </tr>
                           <tr>
                            <th>Gender:</th>
                            <th><%=p.getGender()%></th>
                           </tr>
                           <tr>
                            <th>Country:</th>
                            <th><%=p.getCountry()%></th>
                           </tr>
                           <tr>
                            <tr>
                            <th>Email:</th>
                            <th><%=p.getEmail()%></th>
                           </tr>
                            <th>University:</th>
                            <th><%=p.getUniversity()%></th>
                           </tr>
                           <tr>
                            <th>School:</th>
                            <th><%=p.getSchool()%></th>
                           </tr>
                           <tr>
                            <th>Year:</th>
                            <th><%=p.getYearOfStudy()%></th>
                           </tr>
                           <tr>
                            <th>Matriculation Number:</th>
                            <th><%=p.getMatric()%></th>
                           </tr>
                        </thead>
                        <%}%>
                        </table>
                        </div>

       
                    </div>
                </div>
        </div>
    
    
            
            
    <%@include file ="footer.jsp" %>
    </body>
</html>
