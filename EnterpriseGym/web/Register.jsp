<%-- 
    Document   : about
    Created on : 15-Sep-2015, 13:04:49
    Author     : davidkenny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <%@include file="header.jsp" %>
    
    <!-- Page Content -->
    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <h1>Register</h1>
                <p></p>
            </div>
        </div>
    
            <form  action="SignUp" method="post" >
  <div><label>Username:</label></div>
    <input name="username" type="text" id="userBox" maxlength="50" /></br>
    <div><label>Password:</label></div>
    <input name="password" type="text" id="userBox" maxlength="50" /></br>
    <div><label>Password Check:</label></div>
    <input name="passwordcheck" type="text" id="userBox" maxlength="50" /></br>
    
    <div><label>Email:</label></div>
    <input name="email" type="text" id="userBox" maxlength="50" /></br>
    
    <p></p>
    <input type="submit" id="signButton" value="Add User"  />
</form>
        
        
        
    </div>
    
    <%@include file ="footer.jsp" %>
    </body>
</html>

