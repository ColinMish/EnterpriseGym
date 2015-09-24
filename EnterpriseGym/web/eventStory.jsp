<%-- 
    Document   : eventStory
    Created on : Sep 22, 2015, 4:29:59 PM
    Author     : colin
--%>

<%@page import="Entities.EventEntity"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Entities.NewsEntity" %>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp" %>
    <div class ="mobile">
    <%@include file="sidebar.jsp"%>
    </div>
    
      <div class="container">

       <div class="row">
            <div class="col-lg-12">
                <h1>News Article</h1>
                <p></p>
            </div>
        </div>
   
           <%
            java.util.LinkedList<EventEntity> event = (java.util.LinkedList<EventEntity>) request.getAttribute("event");
            if (event.size()==0) {
        %>
        <p>No News found.</p>
        <%
        } else {   
                  Iterator<EventEntity> iterator;
            iterator = event.iterator();
            while (iterator.hasNext()) {
                EventEntity p = (EventEntity) iterator.next();
         %>
        <div class="col-md-12" id="AboutText">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i><%=p.getName()%></h4>
                    </div>
                    <div class="panel-body">
                        <p>
                        <p><%=p.getDescription()%></p>
                        
                             <% if (p.getLength()!=0){ %>                    
                            <img src="${pageContext.request.contextPath}/Events/Picture/<%=p.getID()%>" style="max-height: 500px; max-width: 500px;" class="img-responsive" alt="News Image">
                            <%} %>
                         <a href="javascript:history.back()" class="btn btn-default">Back</a>
                    </div>
                </div>
            </div>
        <%}%>
                <%}%>
                
      </div>
    
  
    
    <%@include file ="footer.jsp" %>
    </body>
</html>
