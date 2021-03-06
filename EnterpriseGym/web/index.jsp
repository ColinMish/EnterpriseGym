<%@page import="java.util.Iterator"%>
<%@page import="Entities.NewsEntity"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    </head>
    <%@include file="headerHome.jsp" %>


    <!-- Page Content -->


    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <h1></h1>
                <p></p>
            </div>
        </div>

        <div class="col-sm-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h4><i class="fa fa-fw fa-check"></i>Being Enterprising? What do we mean?</h4>
                </div>
                <div class="panel-body">
                    <p>This sums what we are trying to achieve at The Enterprise Gym:</p>
                    <p>"Enterprise is defined here as the application of creative ideas and innovations to practical situations. This is a generic concept that can be applied across all areas of education. It combines creativity, ideas development and problem solving with expression, communication and practical action." QAA 2012.</p>
                    <p>And:</p>
                    <p>"An enterprising individual has a positive, flexible and adaptive disposition to change, seeing it as normal and as an opportunity rather than a problem. To see change in this way, an enterprising individual has a security born of self-confidence, and is at ease when dealing with insecurity, risks and the unknown. An enterprising individual has the capacity to initiate creative ideas and develop them into action in a determined manner. An enterprising individual is able, even anxious to take responsibility, is an effective communicator, negotiator, influencer, planner and organiser. An enterprising individual is active, confident and purposeful ? not uncertain and dependent." OECD 1989.</p>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <%@include file ="calendar.jsp" %>
        </div>

        <%             java.util.LinkedList<NewsEntity> news = (java.util.LinkedList<NewsEntity>) request.getAttribute("news");
                if (news != null) { %>            
        <div class="clr"></div> 
        <hr>
        <h3>&nbsp;&nbsp;&nbsp;Recent Articles:</h3>
        <%
            if (news.size() == 0) {
        %>
        <p>No News found.</p>
        <%
        } else {
            Iterator<NewsEntity> iterator;
            iterator = news.iterator();
            int i = 0;
            while (iterator.hasNext()) {
                NewsEntity p = (NewsEntity) iterator.next();
        %>
        <div class="col-sm-6" id="AboutText">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h4><i class="fa fa-fw fa-check"></i><%=p.getTitle()%></h4>
                </div>
                <div class="panel-body" class="panel-height">
                    <p>
                    <p><%=p.getContent()%></p>

                    <% if (p.getLength() != 0) {%>                    
                    <img src="${pageContext.request.contextPath}/News/Picture/<%=p.getId()%>" style="max-height: 175px; max-width: 175px;" class="img-responsive" alt="News Image">
                    <%}%>

                    <a href="${pageContext.request.contextPath}/News/Article/<%=p.getId()%>" class="btn btn-default">Read More</a>
                </div>
            </div>
        </div>

        <% }
            }
                }%>
    </div>

<%@include file ="footer.jsp" %>

</body>

</html>
