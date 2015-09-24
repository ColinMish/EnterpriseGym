<%-- 
    Document   : about
    Created on : 15-Sep-2015, 13:04:49
    Author     : davidkenny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
      <link href='css/media.css' rel='stylesheet' type='text/css'>
    </head>
    
         <script src="https://code.jquery.com/jquery-1.11.2.js"></script>
                <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
                <script src="http://blazeworx.com/jquery.flagstrap.min.js"></script>
    
    <%@include file="header.jsp" %>
    <div class ="mobile">
    <%@include file="sidebar.jsp"%>
    </div>
    
    <script src="${pageContext.request.contextPath}/js/jquery.flagstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.flagstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/register.js"></script>
    
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
                <h1>Sign Up</h1>
                <p></p>
            </div>
        </div>

        <div class="container">  

          

            <%
                if (request.getAttribute("registered") != null && !(boolean) request.getAttribute("registered")) {%>
            <div class="error"><strong><font color="red">Registration failed!</font></strong></br></br></div>
                    <% }%>
            <form onsubmit="return validateForm()" action="SignUp" role="form" id="SignUp" method="POST">
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input name="username" type="text" class="form-control" id="username1" maxlength="45"/>
                    <span id="err"></span>
                </div>

                <div class="col-xs-6">
                    <div class="form-group">
                        <label for="password">Password:</label>
                        <input name="password" type="password" class="form-control" id="password1" maxlength="45" required onkeyup="checkPassword();"/>
                    </div>
                </div>
                <div class="col-xs-6">
                    <div class="form-group">
                        <label for="passwordCheck">Confirm Password:</label>
                        <input name="passwordcheck" type="password" class="form-control" id="confirmPassword" maxlength="45" required onkeyup="checkPassword();"/>
                        <div id="passwordError"></div>
                    </div>
                </div>
                <div class="col-xs-6">
                    <div class="form-group">
                        <label for="firstName">First Name:</label>
                        <input name="first" type="text" class="form-control" id="firstName" maxlength="45" required/>
                    </div>
                </div>
                <div class="col-xs-6">
                    <div class="form-group">
                        <label for="lastName">Last Name:</label>
                        <input name="last" type="text" class="form-control" id="lastName" maxlength="45" required/>
                    </div>
                </div>
                <div class="col-xs-6">
                    <div class="form-group">
                        <label for="email">E-mail Address:</label>
                        <input name="email" type="email" class="form-control" id="email" maxlength="45" required onkeyup="checkEmail();"/>
                    </div>
                </div>
                <div class="col-xs-6">
                    <div class="form-group">
                        <label for="confirmEmail">Confirm E-mail Address:</label>
                        <input name="confirmEmail" type="email" class="form-control" id="confirmEmail" maxlength="45" required onkeyup="checkEmail();"/>
                        <div id="emailError"></div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="gender">Gender:</label>
                    <select class="form-control" name="gender" id="gender">
                        <option>-</option>
                        <option value="female">Female</option>
                        <option value="male">Male</option>
                        <option value="other">Other</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="flagstrap">Country:</label>
                    <div class="flagstrap" data-input-name="country" data-selected-country="GB" data-scrollable-height="250px"></div>
                </div>

                <script>
                    $('.flagstrap').flagStrap();
                </script> 

           

                <div class="form-group">
                    <label for="university">University, H.E or F.E Institution:</label>
                    <select class="form-control" id="university" name="university">
                        <option>-</option>
                        <option value="dundee">University of Dundee</option>
                        <option value="abertay">University of Abertay</option>
                        <option value="dundeeCol">Dundee College</option>
                        <option value="other">Other</option>
                        <option value="none">None</option>
                    </select>
                </div>
                <div id="schoolSection" class="form-group hidden">
                    <label for="school">School:</label>
                    <select class="form-control" id="school" name="school" value="-">
                        <option>-</option>
                    </select>
                </div>
                <div id="subjectSection" class="form-group hidden">
                    <label for="subject">Subject:</label>
                    <select class="form-control" id="subject" name="subject" value="-">
                        <option>-</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="sel1">Current year of study:</label>
                    <select name="year" class="form-control" id="sel1">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">>4</option>
                    </select>
                </div>
                <div id="matricSection" class="form-group hidden">
                    <label for="matric">Matriculation Number:</label>
                    <input name="matric" type="number" class="form-control" value="0" id="matric" maxlength="45" required/>
                </div>
                <div class="form-group">
                    <label for="yesociety" class="checkbox" style="padding-left: 20px;"><input name="yesociety" type="checkbox" id="yessociety"/> Check this box if you would like to become a member of the <a href="http://www.youngentrepreneursociety.org.uk/" target="_blank">Young Entrepreneurs Society</a>.</label>
                </div>
                <div class="form-group">
                    <label for="terms" class="checkbox" style="padding-left: 20px;"><input name="terms" type="checkbox" id="terms" required/> I have read and accept The Enterprise Gym <a href="${pageContext.request.contextPath}/Terms" target="_blank">Terms of Use</a></label>
                </div>
                <div class="g-recaptcha" data-sitekey="6LfgPw0TAAAAANks7kqyif1IyoDAV-JpkCtTSB5q"></div>
                <br>
                <input class="btn btn-default" type="submit" value="Sign Up">
                <br/>
            </form> 

        </div>

        <%@include file ="footer.jsp" %>
    </body>

</html>

