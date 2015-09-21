<%-- 
    Document   : resetPass
    Created on : 2015-sep-18, 10:10:30
    Author     : Kim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <%@include file="header.jsp" %>
    <%@include file="sidebar.jsp" %>
    
    
  
    <!-- Page Content -->
    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <h1>Reset Password</h1>
                <p>Please enter a new password!</p>
             
            </div>
        </div>
      
           <form  action="ResetPassword" method="post" >
               <br>Email: <br>
               
           <input name="email" type="text" id="userBox" maxlength="50" />
           <br> Password: <br>
           
           <input name="password" type="password" id="userBox" maxlength="50" />
           <br>
           
            <br> Password confirmation: <br>
           <input name="passwordCheck" type="password" id="userBox" maxlength="50" />
           <br>
           <br><input type="submit" value="Reset"  />
          </form>                        
    </div>
      
    <%@include file ="footer.jsp" %>
    </body>
</html>
