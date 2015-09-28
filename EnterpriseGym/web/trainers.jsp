<%-- 
    Document   : trainers
    Created on : 15-Sep-2015, 13:40:17
    Author     : kristiyangeorgiev
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
      <link href='css/carousel.css' rel='stylesheet' type='text/css'>
      <link href='css/style.css' rel='stylesheet' type='text/css'>
      <link href='css/media.css' rel='stylesheet' type='text/css'>
    </head>
    
    <body>
     <%@include file="header.jsp"%>
    <div class ="mobile">
    <%@include file="sidebar.jsp"%>
    </div>
    <div class="banner"></div>
            <!-- Page Content -->
    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <h1>Trainers</h1>
                <p></p>
            </div>
        </div>
    
        <div class="col-md-12" id="ConnectText">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i>Patrons</h4>
                    </div>
                    <div class="panel-body">
                        <p>
                            The Enterprise Gym could not exist without the kind and generous support of our
                            business patrons. Our achievements and growing engagement with the student
                            population of the University of Dundee is a testament to the calibre of support we
                            receive from our patrons; all of whom have a wealth of business experience and
                            hold senior positions in their organisations.<br><br>
                            
                            Alongside our trainers, mentors, and coaches, we are also extremely grateful to the
                            very generous support of our financial sponsors who allow us to develop the
                            Enterprise Gym programmes and events.<br><br>
                            
                            <strong><a href="https://www.enterprise-gym.com/patrons/entrepreneur-residence">Entrepreneur in Residence</a></strong><br>
                            The University of Dundee's first entrepreneur-in-residence has now stood down
                            with a replacement to be announced soon. They will be appointed to advise 
                            students and graduates with ambitions of commercialising their talents and ideas.<br><br>
                            
                            <strong><a href="https://www.enterprise-gym.com/patrons/supercoaches">Learn from the Best Trainers</a></strong><br>
                            Industry leading professionals and award-winning entrepreneurs.<br><br>
                            
                            <strong><a href="https://www.enterprise-gym.com/patrons/trainers">Training for Success Mentors</a></strong><br>
                            Senior business Executives and Directors who lead our Enterprise Challenge and<br>
                            Training Workshops.<br><br>
                            
                            <strong><a href="https://www.enterprise-gym.com/patrons/coaches">Coaches</a></strong><br>
                            Experienced business advisors who lead our Business Surgeries.<br>
                            Our generous financial supporters.<br><br>
                            
                            <strong><a href="https://www.enterprise-gym.com/patrons/sponsors">Sponsors</a></strong><br>
                            Our generous financial supporters.<br>
                            
                        </p>
                        
                        
                    </div>
                </div>
            </div>
    </div>
    
    <%@include file ="footer.jsp" %>
    </body>
</html>
