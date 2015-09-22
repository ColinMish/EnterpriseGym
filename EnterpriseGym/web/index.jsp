<!DOCTYPE html>
<html lang="en">
    <head>
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/media.css" rel="stylesheet">
    </head>
    <%@include file="header.jsp" %>
    <div class="hidden-xs">
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
                    <div class="col-md-4">
                        <iframe src="https://www.google.com/calendar/embed?showTabs=0&amp;showCalendars=0&amp;showTz=0&amp;mode=AGENDA&amp;height=500&amp;wkst=1&amp;bgcolor=%23FFFFFF&amp;src=m9941bpd6nhji35pjjp3blv8do%40group.calendar.google.com&amp;color=%23853104&amp;ctz=Europe%2FLondon" style=" border-width:0 " width="400" height="500" frameborder="0" scrolling="no"></iframe>
                    </div>
            </div>
            </div>
            <hr>

        </div>
    

    <%@include file ="footer.jsp" %>

</body>

</html>
