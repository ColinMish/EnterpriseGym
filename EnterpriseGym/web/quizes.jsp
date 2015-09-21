<%-- 
    Document   : quizes
    Created on : 16-Sep-2015, 13:14:27
    Author     : kristiyangeorgiev
--%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% LinkedList<String> quizNames = (LinkedList) request.getAttribute("quizNames"); %>
<!DOCTYPE html>
<html>
    <body>
           <% if (session.getAttribute("username") == null){ %>
         <%@include file="header.jsp" %>
   <% }else{ %>
     <%@include file="headerloggedin.jsp" %> <%}%>
        
     <div class="hidden-xs">
    <%@include file="sidebar.jsp"%>
     </div>
    
            <!-- Page Content -->
    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <h1>Online Tests</h1>
                <p></p>
            </div>
        </div>
    
        <div class="col-md-12" id="ConnectText">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i><strong>Theory</strong></h4><br>
                    </div>
                    <div class="panel-body">
                        <p>
                            Our Enterprise Theory consists of 11 fun and fast-paced online quizzes designed to<br>
                            raise your awareness of enterprise. You can complete these from any computer (on <br>
                            campus or remotely) and in your own time.<br><br>
                            
                            Points gained from the quizzes count towards the <a id="redlink" href="http://enterprise-gym.com/activities/awards">Enterprise Gym Awards</a>.<br><br>
                            
                            Each quiz has 10 questions and each question is worth 1 point. There are a total of <br>
                            110 points available if all quizzes are completed. The pass mark to qualify for awards <br>
                            is 80% per quiz. All 11 quizzes must be completed and in less than 110 minutes to <br>
                            qualify for a Marathon rating – the top rating that can be gained from any single <br>
                            activity at the <a id="redlink" href="http://enterprise-gym.com">Enterprise Gym</a>.<br><br>
                            
                            <a id="redlink" href="http://enterprise-gym.com/activities/awards"><em><strong> Find out more about our awards and how to get them! </strong></em></a><br><br>
                            
                            You’ll need to sign-up and login to access the quizzes. Please study the PowerPoint<br>
                            presentation attached to each quiz – containing the required material for the <br>
                            upcoming questions – prior to commencing the quiz. This will help you to complete <br>
                            them more quickly.<br><br>
                            
                            <strong>So what are you waiting for? Get started on your Enterprise Theory now!</strong><br><br>
                            
                            <span style="font-size: 11px;">
                                The materials and resources presented here are the property of the <em><a id="redlink" href="http://enterprise-gym.com">University of Dundee Enterprise Gym</a></em><br>
                                and are solely for the use of <em><a id="redlink" href="http://www.enterprise-gym.com">Enterprise Gym</a></em> members. They should not be distributed to others.</span><br><br>
                            
                            
                             <h4><i class="fa fa-fw fa-check"></i><strong>Quizes you have taken</strong></h4><br>
                             
                             You have not taken any quizzes yet.<br>
                             
                             <h4><i class="fa fa-fw fa-check"></i><strong>All Quizes</strong></h4><br>
                             
                             <%for(String quizName : quizNames)
                             {%>
                                <%="<a href=\"Quizes/" + quizName + "\">" + quizName + "</a><br>"%>
                             <%}%>
                        </p>
                    </div>
                </div>
            </div>
    </div>
    
    <%@include file ="footer.jsp" %>
    </body>
</html>
