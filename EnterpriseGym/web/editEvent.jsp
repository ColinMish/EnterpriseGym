<%-- 
    Document   : newsEdit
    Created on : Sep 23, 2015, 7:47:19 PM
    Author     : davidkenny
--%>

<%@page import="Entities.EventEntity"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Entities.NewsEntity" %>
<!DOCTYPE html>
<html>

    <%@include file="header.jsp" %>
   <div class="banner"></div>
      <div class="container">

       <div class="row">
            <div class="col-lg-12">
                <h1></h1>
                <p></p>
            </div>
        </div>
   
           <%
            java.util.LinkedList<EventEntity> event = (java.util.LinkedList<EventEntity>) request.getAttribute("event");
            if (event.size()==0) {
        %>
        <p>No Events found.</p>
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
                        <h4><i class="fa fa-fw fa-check"></i>Edit Event</h4>
                    </div>
                    <div class="panel-body">
                          <form action="${pageContext.request.contextPath}/EditEvent" method="POST" enctype="multipart/form-data">
                                     <div class="form-group">
                    <label for="eventTitle">Event Title:</label>
                    <input name="eventTitle" value="<%=p.getName()%>" type="text" class="form-control" id="title1" maxlength="45"/>
                    <input name="id" type="text" class="form-control hidden" id="title" maxlength="45" value="<%=p.getID()%>" required/>
                </div>
                
     <label for="datetimepicker1">Start date / Time:</label>           
    <div class="row">
        <div class='col-sm-5'>
            <div class="form-group">
                <div class='input-group date' id='datetimepicker1'>
                    <input name="startdate" type='text' class="form-control" value="<%=p.getStartdate()%>" required/>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            $(function () {
                $('#datetimepicker1').datetimepicker();
            });
        </script>
    </div>     
     
      <label for="datetimepicker2">End date / Time: </label>           
    <div class="row">
        <div class='col-sm-5'>
            <div class="form-group">
                <div class='input-group date' id='datetimepicker2'>
                    <input name="enddate" type='text' class="form-control" value="<%=p.getEnddate()%>" required />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            $(function () {
                $('#datetimepicker2').datetimepicker();
            });
        </script>
    </div>
      <div class="row">
      <div class="col-xs-12">
                    <div class="form-group">
                        <label for="eventLocation">Location:</label>
                    <input name="eventLocation" id="eventLocation" type="text" value="<%=p.getLocation()%>" class="form-control" id="location" maxlength="45"/>
                    </div>
                </div>
      </div>
 
   
                
                <label for="eventDescription">Description:</label>
                <textarea name="eventDescription" id="editor1" rows="10" cols="80"><%=p.getDescription()%></textarea>
                        <script>
                            CKEDITOR.replace('eventDescription');
                        </script>
                        <br/>
                        <% if (p.getLength()!=0){ %>  
                              <label for="picture">Current Picture:</label>
                            <img id="picture" src="${pageContext.request.contextPath}/Events/Picture/<%=p.getID()%>" style="max-height: 500px; max-width: 500px;" class="img-responsive" alt="Event Image">
                            <%} %>
                            <br/>
                            <label for="newimage">New Image:</label>    
                        <span class="btn btn-default btn-file">
                        <input id ="newimage" name="image" multiple accept='image/*' type="file">
                        </span>
                        <br/>
                        <br/>
                <div class="form-group">
                    <label for="sel1">Theme:</label>
                    <select name="eventTheme" class="form-control" id="eventTheme">
                               <%
                            int eventType = p.getEvent_type();
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
                 
                 <div class="row">
      <div class="col-xs-12">
                    <div class="form-group">
                        <label for="points">Points:</label>
                    <input name="points" id="eventLocation" type="number" value="<%=p.getPoints_given()%>"class="form-control" id="location" maxlength="45" required/>
                    </div>
                </div>
      </div>       
                        
                <br>
  
                <button class="btn btn-info pull-right" type="submit">Update Event <span class="glyphicon glyphicon-upload" aria-hidden="true"></span></button>
                <br/>  
                   
                        
                       
                             
                          </form>
                    </div>
                </div>
            </div>
        <%}%>
                <%}%>
                
      </div>
    
  
    
    <%@include file ="footer.jsp" %>
    </body>
</html>
