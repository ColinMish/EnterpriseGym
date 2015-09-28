<%-- 
    Document   : resetPass
    Created on : 2015-sep-18, 10:10:30
    Author     : Kim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href='${pageContext.request.contextPath}/css/carousel.css' rel='stylesheet' type='text/css'>
        <link href='${pageContext.request.contextPath}/css/media.css' rel='stylesheet' type='text/css'>
    </head>
    <%@include file="header.jsp" %>
    <script src="${pageContext.request.contextPath}/js/resetPassword.js"></script>
    <div class ="mobile">
    <%@include file="sidebar.jsp"%>
    </div>

<div class="banner"></div>
    <!-- Page Content -->
    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <h1>Reset Password</h1>
                <p></p>
            </div>
        </div>

        <div class="error"><strong><font color="red">Invalid email or username</font></strong></br></br></div>
        
        <form  id="reset" action="ResetPassword" role="form" method="POST" >
            <div class="form-group">
                <label for="username">Username</label>
                <input name="username" type="text" class="form-control" id="user" maxlength="100" required/>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input name="email" type="text" class="form-control" id="em" maxlength="100" required/>
            </div>
            <input type="submit" value="Reset Password" class="btn btn-default"/>
        </form>  
    </div>

    <%@include file ="footer.jsp" %>
</body>
</html>
