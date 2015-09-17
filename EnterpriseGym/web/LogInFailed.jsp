<%-- 
    Document   : LogInFailed
    Created on : 2015-sep-17, 11:45:14
    Author     : Kim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp" %>
    
    <!-- Page Content -->
    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <h1>Have you forgotten your password?</h1>
                <p></p>
            </div>
        </div>
        
            <div class="container">   
                
            <form action="ForgottenPassword" method="POST" >

            <br> Email: <br>
           <input name="email" type="text" id="userBox" maxlength="45" />

           <br>
           <input type="submit" value="Send">
           <br><br><br><br>
          </form> 
                
            </div>
    
    <%@include file ="footer.jsp" %>
    
</html>
