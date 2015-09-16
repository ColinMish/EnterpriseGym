<%-- 
    Document   : contact
    Created on : 15-Sep-2015, 16:39:15
    Author     : kristiyangeorgiev
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <%@include file="header.jsp" %>
    
            <!-- Page Content -->
    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <h1>Contact</h1>
                <p></p>
            </div>
        </div>
    
        <div class="col-md-7" id="ConnectText">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i>Contact the Enterprise Gym</h4>
                    </div>
                    <div class="panel-body">
                        <p>
                            <span class="red">The Enterprise Gym</span> is located on the ground floor at 2 Airlie Place within the main<br>
                           university campus, just off the Perth Road at the <span class="red">University of Dundee</span>. If you’re <br>
                           passing feel free to drop in to find out more.<br><br>
                           
                           You can contact the team using the form below, or you can contact individual team <br>
                           members by email – contact details on the <span class="red">Management Team page</span>. <br><br>
                           
                           You can stay in touch with us using <span>facebook</span>, <span class="red">twitter</span>, <span class="red">youtube</span>, <span class="red">linkedin</span> or <span class="red">email</span>. <br>
                           You can also find us skype, our username is "enterprise.gym". <br><br> 
                           
                           If you want to speak to someone with an enquiry, please ring us on: 01382 384017.<br><br>
                           
                           Our postal address is:<br>
                           The Enterprise Gym<br>
                           2 Airlie Place<br>
                           University of Dundee<br>
                           Dundee<br>
                           DD1 4HN<br><br>
                            
                        </p>
                        <p>Full name: *</p>
                        <input type="text" maxlength="128" name="submitted[first_name]" id="edit-submitted-first-name" size="60" value="" class="form-text required"><br>
                        
                        <p>Email address: *</p>
                        <input type="text" maxlength="128" name="submitted[email_address]" id="edit-submitted-email-address" size="60" value="" class="form-text required"><br>
                        
                        <p>Contact number:</p>
                        <input type="text" maxlength="128" name="submitted[contact_number]" id="edit-submitted-contact-number" size="60" value="" class="form-text"><br>
                        
                        <p>Message: *</p>
                        <textarea cols="60" rows="5" name="submitted[message]" id="edit-submitted-message" class="form-textarea resizable required textarea-processed"></textarea>
                        <br><br>
                        <p><span class="red">CAPTCHA</span></p><br>
                        <p>This question is for testing whether you are a human visitor and to prevent automated spam<br>
                            submissions.</p><br>
                        
                        <input type="submit" name="op" id="edit-submit" value="Submit" class="form-submit">
                    </div>
                </div>
            </div>
    </div>
    
    <%@include file ="footer.jsp" %>
    </body>
</html>
