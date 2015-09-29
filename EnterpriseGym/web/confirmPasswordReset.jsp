<%-- 
    Document   : confirmPasswordReset
    Created on : Sep 25, 2015, 2:39:59 PM
    Author     : colin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <link href='css/style.css' rel='stylesheet' type='text/css'>
    </head> 
   
    <body>
    <%@include file="header.jsp" %>
  
    <div class="container">

        <p>Your password reset token is: <%=request.getParameter("token")%></p>
        
        <form name="ChangeForgottenPassword" method="POST" action="ChangeForgottenPassword">
                <div class="col-md-8" id="ConnectText">
                    <div class="panel panel-default">

                        <div class="panel-body">
                            <input type="hidden" name="token" value="<%=request.getParameter("token")%>">

                            <div class="form-group">
                                <label for="usr">New Password:</label>
                                <input type="text" name="newPassword1" class="form-control" id="newpassword">
                            </div>

                            <div class="form-group">
                                <label for="usr">New Password Again:</label>
                                <input type="text" name="newPassword2" class="form-control" id="newpassword">
                            </div>
                            <input class="btn btn-primary" type="submit" value="Update"><br><br>
                        </div>
                    </div>
                </div>                
            </form>
                            
    </container>
    
    </body>
</html>
