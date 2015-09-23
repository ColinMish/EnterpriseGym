<%-- 
    Document   : eventStory
    Created on : Sep 22, 2015, 4:29:59 PM
    Author     : colin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Entities.EventEntity" %>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp" %>
    <div class="hidden-xs">
        <%@include file="sidebar.jsp"%>
    </div>
   
    <% EventEntity event = (EventEntity) request.getAttribute("Events"); %>
    <!-- Page Content -->
    <div class="container">
    
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4><i class="fa fa-fw fa-gift"></i><%=event.getName()%></h4>
                    <h6><i class="fa fa-fw fa-gift"></i><%=event.getDate()%></h6>
                    <h6><i class="fa fa-fw fa-gift"></i><%=event.getLocation()%></h6>
                </div>
                <div class="panel-body">
                    <p><%=event.getDescription()%></p>
                    <a href="../Events" class="btn btn-default">Back</a>
                    <a href="${pageContext.request.contextPath}/editEvent.jsp?eventID=<%=event.getID()%>"<button type="button" method="GET" class="btn btn-default">Edit Event</button></a>
                    
                </div>
            </div>
        </div>
                    
    </div>
    
    <%@include file ="footer.jsp" %>
    </body>
</html>
