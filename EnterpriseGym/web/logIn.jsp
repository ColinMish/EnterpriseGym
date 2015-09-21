<%-- 
    Document   : LogIn
    Created on : Sep 15, 2015, 9:51:07 PM
    Author     : davidkenny
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

     
    <%@include file="header.jsp" %>
    <div class="hidden-xs">
     <%@include file="sidebar.jsp"%>
     </div>
     <% Boolean registered = (Boolean) request.getAttribute("registered"); %>
     <% Boolean loginfailed =(Boolean) request.getAttribute("failed"); %>
     <% Boolean invalid =(Boolean) request.getAttribute("invalid");%>
    
  
    <!-- Page Content -->
    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <h1><% if(registered!=null) {%>Registration Successful - Please <% } %>Log In</h1>
                <p></p>
                <h2 class="loginfailed"><% if(loginfailed!=null) {%>Log In failed please try again <% } %> </h2>
                <h2 class="loginfailed"><% if(invalid!=null) { %> The username entered is invalid. <% } %> </h2>
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
