<%-- 
    Document   : LogIn
    Created on : Sep 15, 2015, 9:51:07 PM
    Author     : davidkenny
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


    <%@include file="header.jsp" %>
    <div class="mobile">
        <%@include file="sidebar.jsp"%>   
    </div>
        <script src="${pageContext.request.contextPath}/js/login.js"></script>
    <% Boolean registered = (Boolean) request.getAttribute("registered"); %>  
    
    <div id="myModal" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" id="modalHeader"></h4>
                    </div>
                    <div class="modal-body">
                        <p id="modalText"></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
                    </div>
                </div>
            </div>
        </div>
    

    <!-- Page Content -->
    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <h1><% if (registered != null) {%>Registration Successful - Please <% }%>Log In</h1>
                <p></p>
                <!--<h2 class="loginfailed" id="fail">Log In failed please try again</h2>-->
                <!--<h2 class="loginfailed" id="invalid">The username or password entered is invalid.</h2>-->
            </div>
        </div>

        <form  id="logInForm" action="LogIn" role="form" method="post" >
            <div class="form-group">
                <label for="username">Username:</label>
                <input name="username" type="text" class="form-control" id="un" maxlength="45" required/>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input name="password" type="password" class="form-control" id="pw" maxlength="45" required/>
            </div>
            <div class="forgotPassword"><a href="#">Have you forgotten your password?</a></div>
            <input type="submit" value="SignIn" class="btn btn-default"/>
        </form>                        
    </div>

    <%@include file ="footer.jsp" %>
</body>
</html>
