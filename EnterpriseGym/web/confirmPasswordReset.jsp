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
      <link href='css/media.css' rel='stylesheet' type='text/css'>
    </head> 
   
    <body>
    <%@include file="header.jsp" %>
    <div class ="mobile">
    <%@include file="sidebar.jsp"%>
    </div>
    <container>
        <script>
            function GetURLParameter(sParam)
            {
                var sPageURL = window.location.search.substring(1);
                var sURLVariables = sPageURL.split('&');
                for (var i = 0; i < sURLVariables.length; i++) 
                {
                    var sParameterName = sURLVariables[i].split('=');
                    if (sParameterName[0] == sParam) 
                    {
                        return sParameterName[1];
                    }
                }
            }​
        </script>
        <p>Your password reset token is: <script>GetURLParameter('token');</script></p>
    </container>
    
    </body>
</html>
