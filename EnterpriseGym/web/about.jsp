<%-- 
    Document   : about
    Created on : 15-Sep-2015, 13:04:49
    Author     : Dave
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
    <%@include file="sidebar.jsp"%>

    
    <!-- Page Content -->
    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <h1>About</h1>
                <p></p>
            </div>
        </div>
                
 
                                         
        <div class="col-md-8" id="AboutText">
                <div class="panel panel-default panelmobile">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i>About the Enterprise Gym</h4>
                    </div>
                    <div class="panel-body">
                        <p><strong>What is The Enterprise Gym all about?</strong> Some key words and sentences for you to set the scene: <br><br>
                            Enterprise & Entrepreneurship isn't all about business. <br><br>

                            Enterprise = the application of creative ideas and innovations to practical situations.<br><br>

                            Enterprise combines creativity, ideas development and problem solving with expression, communication and practical action.<br><br>

                            An enterprising individual has a positive, flexible and adaptive disposition to change, seeing it as normal and as an opportunity rather than a problem.<br><br>

                            An enterprising individual has the capacity to initiate creative ideas and develop them into action in a determined manner.<br><br>

                            An enterprising individual is an effective communicator, negotiator, influencer, planner and organiser.<br><br>

                            An enterprising individual is active, confident and purposeful — not uncertain and dependent<br><br>

                            The above is what we strive to help you achieve and become at The Enterprise Gym.
                        </p>
                        <p><strong>The Enterprise Gym</strong>, is managed by students for students and supported by our experienced business patrons, runs free workshops 
                                    and events to develop your enterprise skills and commercial awareness. Being able to demonstrate that you have some enterprising 
                                    attributes is great whether you are applying for jobs or thinking of starting your own enterprise. Key transferable skills can 
                                    really help make you stand out.
                        </p>
                        <p>
                            <strong><a id="redlink" href="https://www.youtube.com/watch?v=bGHy1ruVLEE">Chris Calder </a></strong>Enterprise Gym <a id="redlink" href="http://www.enterprise-gym.com/activities/discovery-challenge">Enterprise Challenge</a>
                            alumni, <a id="redlink" href="https://www.youtube.com/watch?v=bGHy1ruVLEE">tells us how his experiences</a> at the Enterprise Gym helped him stand out in his quest for a graduate job. Among 3000 applicants, he landed one of the 10 jobs 
                            available!
                        </p>
                        <p>
                            Our workshops help you to improve your presentation skills, gain confidence, learn a bit about business and enterprise, and make yourself more (self) employable. Participating in our range of free workshop and entrepreneurial 
                            activities is also a lot of fun and a great way to meet new people! To top it all off we give out a range of <a id="redlink" href="http://enterprise-gym.com/activities/awards">awards</a>, and there is also £4000 of prize money (yes, actual cash) to be won!</br>

                            <br><br><strong>Find out more about our range of <a id="redlink" href="http://enterprise-gym.com/activities">activities</a> and <a id="redlink" href="http://www.enterprise-gym.com/user/register">sign-up online</a> to join in the fun!</strong></br></br>

                            Members have access to exclusive online training materials, our full range of events (including the 
                            <a id="redlink" href="#">Enterprise Challenge</a>, 
                            <a id="redlink" href="#">Learn from the Best Event</a>, 
                            <a id="redlink" href="#">Training for Success Workshops, and our annual</a>
                            <a id="redlink" href="#">DS3C Conference</a>), and the chance to attend Business Surgeries for free one-to-one business advice.
                        </p>
                        <p>
                           Our top students are honoured at our Annual Awards Ceremony – an evening of incredible food, live entertainment, and the chance to network with our business patrons. 
                        </p>
                        <p><a id="redlink" href="https://www.facebook.com/media/set/?set=a.10152060121628811.1073741902.177840983810&type=3">View photos from our previous awards ceremonies.</a>
                        </p>
                        <p>
                            <strong>The Enterprise Gym</strong> was created by the University of Dundee in 2005 in response to government concern over graduate "business readiness". Its mission is to help students from all disciplines to improve their enterprise skills, self-reliance and employability through engaging with business enterprise and developing entrepreneurial skills. Key to this is the deep involvement and support of the business community helping to deliver learning that is fun, interactive and rewarding.
                        </p>
                        <p>
                           Since it began, The Enterprise Gym has seen continued growth in student numbers, events offered and accolades received. the academic year 2010-11 saw over 300 students participating in Enterprise Gym events. 2007 saw The Enterprise Gym feature in The National Council for Graduate Entrepreneurship report on "Good Practice" and win the title of "Most Successful Enterprise Society" from the Scottish Institute for Enterprise. In 2011 it was shortlisted in the National Enterprise Educator Awards. It has won numerouse Global Entrepreneurship Week High Impact awards for a wide range of events. 
                        </p>
                        <p>
                            The 2014-15 academic year sees The Enterprise Gym looking to inspire even more students and help make them more entrepreneurial and employable, why don't you join us?
                        </p>
                    </div>
                </div>
            </div>
        
              <div class="col-md-4" id="ConnectText">
                <div class="panel panel-default panabout panelmobile">
                    
                        <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i><strong>Available Options</strong></h4><br>
                        </div>
                    
                        <div class="panel-body">
                            <div class="usermenu">
                        
                            <a class="btn btn-primary btns" href="${pageContext.request.contextPath}/Trainers">Trainers</a><br><br>
                            
                            <a class="btn btn-primary btns" href="${pageContext.request.contextPath}/Connect">Connect</a>
                            
                            </div>
                        </div>
                    
                    
                   
                </div>
        </div>
    </div>
    
    <%@include file ="footer.jsp" %>
    </body>
</html>
