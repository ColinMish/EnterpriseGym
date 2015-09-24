<%-- 
    Document   : editEvent
    Created on : Sep 22, 2015, 4:12:14 PM
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
     
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script><!--do we need this?-->
    <script src="${pageContext.request.contextPath}/js/jquery.flagstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/register.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.flagstrap.js"></script>
    
    <% EventEntity event = (EventEntity) request.getAttribute("Events"); %>
    
    <!-- Page Content -->
    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <h1>Edit Event</h1>
                <p></p>
            </div>
        </div>

        <div class="container">  
            
            <div id="myModal" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" id="modalHeader"></h4>
                    </div>
                    <div class="modal-body">
                        <p id="modalText"></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
                    </div>
                </div>
            </div>
        </div>  
            
            <form action="EditEvent" role="form" id="EditEvent" method="POST">
                <div class="form-group">
                    <label for="eventTitle">Event Title:</label>
                    <input name="eventTitle" type="text" class="form-control" id="title1" value="<%=event.getName()%>" maxlength="45"/>
                    <span id="err"></span>
                </div>
                <div class="col-xs-12">
                    <div class="form-group">
                        <label for="eventDate">Date:</label>
                    <input name="eventDate" type="date" class="form-control" id="date1" value="<%=event.getDate()%>" maxlength="45"/>
                    </div>
                </div>
                <div class="col-xs-12">
                    <div class="form-group">
                        <label for="eventDescription">Description:</label>
                        <textarea name="eventDescription" cols="50" rows="8"><%=event.getDescription()%></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label for="eventTheme">Theme:</label>
                    <select name="eventTheme" class="form-control" action="SubmitEdit" method ="POST" id="eventTheme">
                        <%
                            int eventType = event.getEvent_type();
                            if (eventType == 1 ) {
                        %>
                            <option value="1" selected>Action</option>
                            <option value="2">Practice</option>
                            <option value="3">Theory</option>
                            <option value="4">Virtual</option>
                            <option value="5">Project</option>
                        <%}
                            else if (eventType == 2 ) {
                        %>
                            <option value="1">Action</option>
                            <option value="2" selected>Practice</option>
                            <option value="3">Theory</option>
                            <option value="4">Virtual</option>
                            <option value="5">Project</option>
                        <%}
                            else if (eventType == 3 ) {
                        %>
                            <option value="1">Action</option>
                            <option value="2">Practice</option>
                            <option value="3" selected>Theory</option>
                            <option value="4">Virtual</option>
                            <option value="5">Project</option>
                        <%}
                            else if (eventType == 4 ) {
                        %>
                            <option value="1">Action</option>
                            <option value="2">Practice</option>
                            <option value="3">Theory</option>
                            <option value="4" selected>Virtual</option>
                            <option value="5">Project</option>
                        <%}
                            else {
                        %>
                            <option value="1">Action</option>
                            <option value="2">Practice</option>
                            <option value="3">Theory</option>
                            <option value="4">Virtual</option>
                            <option value="5" selected>Project</option>
                        <%}%>
                    </select>
                </div>
                <br>
                <input type="hidden" name="eventID" type="number" value="<%=event.getID()%>"
                <input class="btn btn-default" type="submit" value="Save changes">
                <br/>
            </form> 

        </div>

        <%@include file ="footer.jsp" %>
    </body>
</html>
