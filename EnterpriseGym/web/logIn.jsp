<%-- 
    Document   : LogIn
    Created on : Sep 15, 2015, 9:51:07 PM
    Author     : davidkenny
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <%@include file="header.jsp" %>
    <%@include file="sidebar.jsp" %>
    <script src="${pageContext.request.contextPath}/js/login.js"></script>
    
  
    <!-- Page Content -->
    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <h1 id="logInTitle">Log In</h1>
                <p id="logInMessage">Please Log In</p>
             
            </div>
        </div>
      
           <form id="logInForm" action="LogIn" method="post" >
               <br>Username: <br>
           <input id="un" name="Username" type="text" maxlength="50" />
           <br> Password: <br>
           <input id="pw" name="Password" type="password" maxlength="50" />
           <br>
           <div class="forgotPassword">
               <p><a href="ResetPassword">Forgotten password?</a></p>
           </div>
           <input type="submit" value="Sign In"  />
          </form> 
        <br>
    </div>
      
    <%@include file ="footer.jsp" %>
    </body>
</html>

