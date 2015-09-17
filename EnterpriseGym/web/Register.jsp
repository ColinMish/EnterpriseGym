<%-- 
    Document   : about
    Created on : 15-Sep-2015, 13:04:49
    Author     : davidkenny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     
    <%@include file="header.jsp" %>
    <%@include file="registerscripts.jsp" %>
    
    <!-- Page Content -->
    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <h1>Sign Up</h1>
                <p></p>
            </div>
        </div>
        
            <div class="container">   
                
            <form action="SignUp" role="form" id="SignUp" method="POST">
                <div class="form-group">
                <label for="username">Username:</label>
                <input name="username" type="text" class="form-control" id="username1" maxlength="45" required/>
                </div>
           <div class="form-group">
                <label for="password">Password:</label>
                <input name="password" type="text" class="form-control" id="password" maxlength="45" required/>
           </div>
           <div class="form-group">
                <label for="passwordCheck">Confirm Password:</label>
                <input name="passwordCheck" type="text" class="form-control" id="confirmPassword" maxlength="45" required/>
           </div>
           <div class="form-group">
                <label for="firstName">First Name:</label>
                <input name="firstName" type="text" class="form-control" id="firstName" maxlength="45" required/>
           </div>
           <div class="form-group">
                <label for="lastName">Last Name:</label>
                <input name="lastName" type="text" class="form-control" id="lastName" maxlength="45" required/>
           </div>
           <div class="form-group">
                <label for="email">E-mail Address:</label>
                <input name="email" type="text" class="form-control" id="email" maxlength="45" required/>
           </div>
           <div class="form-group">
                <label for="confirmEmail">Confirm E-mail Address:</label>
                <input name="confirmEmail" type="text" class="form-control" id="confirmEmail" maxlength="45" required/>
           </div>
           <div class="form-group">
                <label for="gender">Gender:</label>
                <select class="form-control" id="gender">
                    <option>-</option>
                    <option value="female">Female</option>
                    <option value="male">Male</option>
                    <option value="other">Other</option>
                </select>
           </div>
           <div class="form-group">
                <label for="country">Country:</label>
                <select class="form-control" id="country">
                    <option>-</option>
                </select>
           </div>
           <div class="form-group">
            <label for="university">University, H.E or F.E Institution:</label>
            <select class="form-control" id="university">
             <option>-</option>
             <option value="dundee">University of Dundee</option>
             <option value="abertay">University of Abertay</option>
             <option value="dundeeCol">Dundee College</option>
             <option value="other">Other</option>
             <option value="none">None</option>
            </select>
           </div>
           <div class="form-group">
            <label for="school">School:</label>
            <select class="form-control" id="school">
             <option>-</option>
            </select>
           </div>
           <div class="form-group">
            <label for="subject">Subject:</label>
            <select class="form-control" id="subject">
             <option>-</option>
            </select>
           </div>
           <div class="form-group">
            <label for="sel1">Current year of study:</label>
            <select class="form-control" id="sel1">
             <option>1</option>
             <option>2</option>
             <option>3</option>
             <option>4</option>
             <option>>4</option>
            </select>
           </div>
           <div class="form-group">
                <label for="matric">Matriculation Number:</label>
                <input name="matric" type="text" class="form-control" id="matric" maxlength="45" required/>
           </div>
           <br>
           <input type="submit" value="Sign Up">
           <br><br><br><br>
          </form> 
                
            </div>
    
    <%@include file ="footer.jsp" %>
    </body>
    
</html>

