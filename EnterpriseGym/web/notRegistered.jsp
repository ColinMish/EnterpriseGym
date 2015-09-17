<%-- 
    Document   : notRegistered
    Created on : 2015-sep-17, 15:29:07
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
                <h1>You are not registered!</h1>
                <p></p>
            </div>
        </div>
        
        <form  action="ToRegister" method="get" >
              
           <input type="submit" value="Register now!"  />
          </form>  
        
    <%@include file ="footer.jsp" %>
   
    
</html>
