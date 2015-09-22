<%-- 
    Document   : LogIn
    Created on : Sep 15, 2015, 9:51:07 PM
    Author     : davidkenny
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <link href='css/media.css' rel='stylesheet' type='text/css'>
    </head>
    <%@include file="header.jsp" %>
    <div class ="mobile">
    <%@include file="sidebar.jsp"%>
    </div>
     <% Boolean registered = (Boolean) request.getAttribute("registered"); %>
     <% Boolean loginfailed =(Boolean) request.getAttribute("failed"); %>
     <% Boolean invalid =(Boolean) request.getAttribute("invalid");%>
    
  
    <!-- Page Content -->
    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <% if(registered!=null) {%> <div class='alert alert-success fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><p>Registration Successful - Please Log In</p></div><% } %>
                <br/>
                <% if(loginfailed!=null) {%><div class='alert alert-danger fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><p>Log In failed please try again</p></div><% } %>
                <% if(invalid!=null) { %> <div class='alert alert-warning fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><p>The username entered is invalid.</p></div><% } %>
            </div>
        </div>
      
           <form  action="LogIn" role="form" method="post" >
               <div class="form-group">
                    <label for="username">Username:</label>
                    <input name="username" type="text" class="form-control" id="username" maxlength="45" required/>
                </div>
           <div class="form-group">
                        <label for="password">Password:</label>
                        <input name="password" type="password" class="form-control" id="password" maxlength="45" required/>
            </div>
           <input type="submit" value="Sign In" class="btn btn-default"/>
          </form>                        
    </div>
      
    <%@include file ="footer.jsp" %>
    </body>
</html>
