<%-- 
    Document   : footer.jsp
    Created on : 15-Sep-2015, 12:49:29
    Author     : Dave
--%>
<html>
        <head>
            <link href='css/profile.css' rel='stylesheet' type='text/css'>
        </head>
    <body>
<div class="footer col-md-12">
    
    <!-- TODO: Decide Footer Content -->
   
            <div class="container col-md-3">
                <img src="${pageContext.request.contextPath}/Pictures/logo-eg.png" alt="The Enterprise Gym Logo"/><br/><br/>  
                 <p class="text-muted">
                    Copyright &copy; 2011 The Enterprise Gym. All rights reserved.<br/>
                    Website design, development and hosting by Team 5.<br/>
                    This website is generously sponsored by <a href="http://www.commercial-properties-scotland.co.uk/">James Keiller Estates</a>.
                </p>
        
            </div>
    
                 <div class ="col-md-2 row">
			<p><a href=""><ins>Terms & Conditions</ins></a></p>
			<p><a href=""><ins>Privacy Policy</ins></a></p>
			<p><a href=""><ins>Disclaimer</ins></a></p>
                </div>
                 
                 <div class ="col-md-2 row">
                     <p><a href="Contact"><ins>Contact Us</ins></a></p>
			<p><a href=""><ins>Trainers</ins></a></p>
			<p><a href=""><ins>Connect</ins></a></p>
                </div>
                 
                 <div class ="col-md-2 row">
                     <p><a href="Contact"><ins>About us</ins></a></p>
			<p><a href=""><ins>Our Sponsors</ins></a></p>
			<p><a href=""><ins>Site Map</ins></a></p>
                </div>
</div>
    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    <!-- Script to Activate the Carousel -->
    <script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    });
    </script>
    
    </body>
</html>