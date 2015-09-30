<%-- 
    Document   : eventsTest
    Created on : 2015-sep-15, 13:42:57
    Author     : Kim
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Entities.EventEntity"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Entities.NewsEntity" %>
<%@page import="java.text.DateFormatSymbols" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <link href='${pageContext.request.contextPath}/css/profile.css' rel='stylesheet' type='text/css'>     
    </head>
<body>
     <%@include file="header.jsp" %>
  
    <div class="banner"></div>
    <!-- Page Content -->
         <div class="container">

       <div class="row event">
            <div class="col-lg-12">
                <h1>Events</h1>
                <p></p>
            </div>
        </div>
             
             <%
            java.util.LinkedList<EventEntity> events = (java.util.LinkedList<EventEntity>) request.getAttribute("events");
            if (events.size() ==0)  {
        %>
        <p>No Events found.</p>
        <%
        } else {   
                  Iterator<EventEntity> iterator;
            iterator = events.iterator();
            
            int i = 0;
            while (iterator.hasNext()) {
                EventEntity p = (EventEntity) iterator.next();
                String dateString = p.getStartdate();
                String [] dateParts = new String [3];
                String  [] splitString = dateString.split("/");
                String month = splitString[0];
                String day = splitString[1];
                String rest = splitString[2];
                String [] restOfString = rest.split(" ");
                String year = restOfString[0];
                String time = restOfString[1];
                String AMPM = restOfString[2];

                //String dayName = getDay(day);
                int monthNo = Integer.parseInt(month);
                String monthName = new DateFormatSymbols().getMonths()[monthNo]; 

                String returnDate = monthName + " " + day + " " + year + " at " + time + " " + AMPM;
         %>
        <div class="col-sm-6" id="AboutText">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i><%=p.getName()%></h4>
                    </div>
                    <div class="panel-body" class="fixed-panel">
                        <p><%=p.getEvent_type_name()%> Points Available:<%=p.getPoints_given()%></p>
                        <p>Date: <%=returnDate%></p>
                        
                             <% if (p.getLength()!=0){ %>                    
                            <img src="${pageContext.request.contextPath}/Events/Picture/<%=p.getID()%>" style="max-height: 300px; max-width: 300px;" class="img-responsive" alt="News Image">
                            <%} %>
                        </p>
                        <a href="${pageContext.request.contextPath}/Events/Event/<%=p.getID()%>" class="btn btn-default">Read More</a>
                    </div>
                </div>
         
         </div>
        <% i++; 
           if(i == 2 || i == 4)
           { %>
              <div class="clr"></div> 
          <% }
    }%>
                <%}%>
    </div>
    <%@include file ="footer.jsp" %>
    </body>
</html>

