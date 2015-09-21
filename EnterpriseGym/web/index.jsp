<!DOCTYPE html>
<html lang="en">

    <% if (session.getAttribute("username") == null){ %>
         <%@include file="header.jsp" %>
   <% }else{ %>
     <%@include file="headerloggedin.jsp" %> <%}%>
   
     <div class="visible-lg">
    <%@include file="sidebar.jsp"%>
     </div>

    <!-- Page Content -->
    <div class="content">
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <h1></h1>
                    <p></p>
                </div>
            </div>

            <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i>Enterprise and Being Enterprising? What do we mean?</h4>
                    </div>
                    <div class="panel-body">
                        <p>This sums what we are trying to achieve at The Enterprise Gym:</p>
                        <p>"Enterprise is defined here as the application of creative ideas and innovations to practical situations. This is a generic concept that can be applied across all areas of education. It combines creativity, ideas development and problem solving with expression, communication and practical action." QAA 2012.</p>
                        <p>And:</p>
                        <p>"An enterprising individual has a positive, flexible and adaptive disposition to change, seeing it as normal and as an opportunity rather than a problem. To see change in this way, an enterprising individual has a security born of self-confidence, and is at ease when dealing with insecurity, risks and the unknown. An enterprising individual has the capacity to initiate creative ideas and develop them into action in a determined manner. An enterprising individual is able, even anxious to take responsibility, is an effective communicator, negotiator, influencer, planner and organiser. An enterprising individual is active, confident and purposeful ? not uncertain and dependent." OECD 1989.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-gift"></i>GEW High Impact Host Award</h4>
                    </div>
                    <div class="panel-body">
                        <p>The Enterprise Gym has been awarded a High Impact Host award for the activities it ran during the 2014 Global Entrepreneurship Week held in November 2014. The three events held were: TEG Talks - a series of 5 short snappy talks from entrepreneurs about their respective journey's to where they are today; a networking event bringing together enterprising students, business people, academics and support agencies and professionals; a joint event held with DUSA where current students who are starting of have started a business shared their experiences with an audience of interested students. We are already looking for to and planning for GEW 2015.</p>
                        <img alt="" class="img-responsive" src="${pageContext.request.contextPath}/Pictures/HighImpactBadge2014.png"/>
                    </div>
                </div>
            </div>
            <hr>

        </div>
    </div>

    <%@include file ="footer.jsp" %>

</body>

</html>
