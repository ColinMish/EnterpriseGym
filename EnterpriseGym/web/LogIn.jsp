<%-- 
    Document   : LogIn
    Created on : Sep 15, 2015, 9:51:07 PM
    Author     : davidkenny
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

       <% if (session.getAttribute("username") == null){ %>
         <%@include file="header.jsp" %>
   <% }else{ %>
     <%@include file="headerloggedin.jsp" %> <%}%>
    <%@include file="sidebar.jsp" %>
    
    
  
    <!-- Page Content -->
    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <h1>Log In</h1>
                <p></p>
             
            </div>
        </div>
      
           <form  action="LogIn" method="post" >
               <br>Username: <br>
           <input name="username" type="text" id="userBox" maxlength="50" />
           <br> Password: <br>
           <input name="password" type="password" id="userBox" maxlength="50" />
           <br>
           <input type="submit" value="Sign In"  />
          </form>                        
    </div>
      
    <%@include file ="footer.jsp" %>
    </body>
</html>

