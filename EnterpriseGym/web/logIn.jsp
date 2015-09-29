<%-- 
    Document   : LogIn
    Created on : Sep 15, 2015, 9:51:07 PM
    Author     : davidkenny
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


    <%@include file="header.jsp" %>
    
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

<div class="banner"></div>
    <!-- Page Content -->
    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <h1><% if (registered != null) {%>Registration Successful - Please Log In</h1><% }else { %>Log In <%}%></h1>
              
                
                <div class='alert alert-danger fade in' id='fail'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><p>Log In Failed. Please Try Again.</p></div>
                
                <div class='alert alert-danger fade in' id='invalid'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><p>Invalid Username or Password.</p></div>
            </div>
        </div>

        <form  id="logInForm" action="/LogIn" role="form" method="post" >
            <div class="form-group">
                <label for="username">Username:</label>
                <input name="username" type="text" class="form-control" id="un" maxlength="45" required/>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input name="password" type="password" class="form-control" id="pw" maxlength="45" required/>
            </div>

            <div class="forgotPassword"><a href="resetPass.jsp">Have you forgotten your password?</a></div>
            <br>

            <input type="submit" value="Sign In" class="btn btn-success"/>
            <hr>
        </form>                        
    </div>

    <%@include file ="footer.jsp" %>
</body>
</html>
