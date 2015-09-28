<%-- 
    Document   : newEvent
    Created on : Sep 21, 2015, 12:14:34 PM
    Author     : colin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

    </head>
    <%@include file="header.jsp" %>
    <div class ="mobile">
    <%@include file="sidebar.jsp"%>
    </div>

     
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script><!--do we need this?-->
    <script src="${pageContext.request.contextPath}/js/jquery.flagstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/register.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.flagstrap.js"></script>
    <div class="banner"></div>
    <!-- Page Content -->
    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <h1>New Event</h1>
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

            <form action="NewEvent" role="form" id="NewEvent" method="POST">
                <div class="form-group">
                    <label for="eventTitle">Event Title:</label>
                    <input name="eventTitle" type="text" class="form-control" id="title1" maxlength="45"/>
                    <span id="err"></span>
                </div>
                <div class="col-xs-12">
                    <div class="form-group">
                        <label for="eventDescription">Date:</label>
                    <input name="eventDate" type="date" class="form-control" id="date1" maxlength="45"/>
                    </div>
                </div>
                <div class="col-xs-12">
                    <div class="form-group">
                        <label for="eventDescription">Location:</label>
                    <input name="eventLocation" type="text" class="form-control" id="location" maxlength="45"/>
                    </div>
                </div>
                <div class="col-xs-12">
                    <div class="form-group">
                        <label for="eventDescription">Description:</label>
                        <textarea name="eventDescription" cols="50" rows="8"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label for="sel1">Theme:</label>
                    <select name="eventTheme" class="form-control" id="eventTheme">
                        <option value="1">Action</option>
                        <option value="2">Practice</option>
                        <option value="3">Theory</option>
                        <option value="4">Virtual</option>
                        <option value="5">Project</option>
                    </select>
                </div>
                <br>
                <input class="btn btn-default" type="submit" value="Create Event">
                <br/>
            </form> 

        </div>

        <%@include file ="footer.jsp" %>
    </body>
</html>
