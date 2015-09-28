<%-- 
    Document   : contact
    Created on : 15-Sep-2015, 16:39:15
    Author     : kristiyangeorgiev
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

      <link href='css/style.css' rel='stylesheet' type='text/css'>

    </head>
    
    <body>
    <%@include file="header.jsp" %>
    <div class ="mobile">
    <%@include file="sidebar.jsp"%>
    </div>
    <div class="banner"></div>
            <!-- Page Content -->
    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <h1>Contact</h1>
                <p></p>
            </div>
        </div>
    
        <div class="col-md-12" id="ConnectText">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i>Contact the Enterprise Gym</h4>
                    </div>
                    <div class="panel-body">
                        <p>
                            <span class="red">The Enterprise Gym</span> is located on the ground floor at 2 Airlie Place within the main
                           university campus, just off the Perth Road at the <span class="red">University of Dundee</span>. If you’re
                           passing feel free to drop in to find out more.<br><br>
                           
                           You can contact the team using the form below, or you can contact individual team
                           members by email – contact details on the <span class="red">Management Team page</span>. <br><br>
                           
                           You can stay in touch with us using <span>facebook</span>, <span class="red">twitter</span>, <span class="red">youtube</span>, <span class="red">linkedin</span> or <span class="red">email</span>.
                           You can also find us skype, our username is "enterprise.gym". <br><br> 
                           
                           If you want to speak to someone with an enquiry, please ring us on: 01382 384017.<br><br>
                           
                           Our postal address is:<br>
                           The Enterprise Gym<br>
                           2 Airlie Place<br>
                           University of Dundee<br>
                           Dundee<br>
                           DD1 4HN<br><br>
                            
                        </p>
                        <div class="form-group">
                            <label for="name">Full Name:</label>
                            <input name="name" type="text" class="form-control" id="name" maxlength="100" required/>
                        </div>
                        <div class="form-group">
                            <label for="email">E-mail Address:</label>
                            <input name="email" type="email" class="form-control" id="email" maxlength="100" required/>
                        </div>
                        <div class="form-group">
                            <label for="number">Contact Number:</label>
                            <input name="number" type="text" class="form-control" id="number" maxlength="20" required/>
                        </div>
                        <div class="form-group">
                            <label for="message">Message:</label>
                            <textarea name="message" class="form-control" id="message" rows="5" required/></textarea>
                        </div>
                        <!--<p>Full name: *</p>
                        <input type="text" maxlength="128" name="submitted[first_name]" id="edit-submitted-first-name" size="60" value="" class="form-text required"><br>
                        
                        <p>Email address: *</p>
                        <input type="text" maxlength="128" name="submitted[email_address]" id="edit-submitted-email-address" size="60" value="" class="form-text required"><br>
                        
                        <p>Contact number:</p>
                        <input type="text" maxlength="128" name="submitted[contact_number]" id="edit-submitted-contact-number" size="60" value="" class="form-text"><br>
                        
                        <p>Message: *</p>
                        <textarea cols="60" rows="5" name="submitted[message]" id="edit-submitted-message" class="form-textarea resizable required textarea-processed"></textarea>
                        <br><br>
                        
                        <br>-->
                        <div class="g-recaptcha" data-sitekey="6Ld5GQ0TAAAAAJbwITxGPXJfEyfkB2p2b6JjxazP"></div>
                        <br/>
                        <input type="submit" name="op" id="edit-submit" value="Submit" class="btn btn-default">
                </div>
            </div>
    </div>
    
    <%@include file ="footer.jsp" %>
    </body>
</html>
