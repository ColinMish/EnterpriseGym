<%-- 
    Document   : admin
    Created on : 21-Sep-2015, 16:44:50
    Author     : Andy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <%@include file="header.jsp" %>
    <div class ="mobile">
       
    </div>
    <script src="${pageContext.request.contextPath}/js/admin.js"></script>
    <%@page import="Entities.Account"%>

    <% Boolean storyAdded = (Boolean) request.getAttribute("storyAdded"); %>
    <% Boolean storyNotAdded = (Boolean) request.getAttribute("storyNotAdded"); %>

    <% Boolean pointsReset = (Boolean) request.getAttribute("pointsReset"); %>
    <% Boolean pointsNotReset = (Boolean) request.getAttribute("pointsNotReset"); %>

    <% Boolean accountDeleted = (Boolean) request.getAttribute("accountDeleted"); %>
    <% Boolean accountNotDeleted = (Boolean) request.getAttribute("accountNotDeleted"); %>

    <%Boolean newsUpdated = (Boolean) request.getAttribute("newsUpdated"); %>

    <% Boolean accountAdmin = (Boolean) request.getAttribute("accountAdmin"); %>
    <% Boolean accountNotAdmin = (Boolean) request.getAttribute("accountNotAdmin"); %>

    <div class="banner"></div>
    <!-- Page Content -->
    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <h1>Admin Panel</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <% if (storyAdded != null) { %> <div class='alert alert-success fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><p>News Story Posted Successfully.</p></div> <% } %>
                <% if (storyNotAdded != null) { %> <div class='alert alert-danger fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><p>Error Posting News Story.</p></div> <% } %>

                <% if (pointsReset != null) { %> <div class='alert alert-success fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><p>Points Successfully Reset.</p></div> <% } %>
                <% if (pointsNotReset != null) { %> <div class='alert alert-danger fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><p>Error Resetting Points.</p></div> <% } %>

                <% if (accountDeleted != null) { %> <div class='alert alert-success fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><p>Account Successfully Deleted.</p></div> <% } %>
                <% if (accountNotDeleted != null) { %> <div class='alert alert-danger fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><p>Error Deleting Account.</p></div> <% } %>

                <% if (newsUpdated != null) {
                        if (newsUpdated == true) { %> <div class='alert alert-success fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><p>News Story Updated Successfully.</p></div>
                <% } else { %>  <div class='alert alert-success fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><p>Update failed please try again.</p></div> <%}
                    }%>

                <% if (accountAdmin != null) { %> <div class='alert alert-success fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><p>Account Successfully Granted Administrator Privileges.</p></div> <% } %>
                <% if (accountNotAdmin != null) { %> <div class='alert alert-danger fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><p>Error Granting Privileges.</p></div> <% }%>
            </div>
        </div>

        <%if (account.hasAccessLevel(3)) {%>

        <div class="col-md-12">
            <div class="panel panel-default">
                <div style="cursor:pointer" class="panel-heading" id="newsPanel">
                    <h4><i class="fa fa-fw fa-check"></i>News Management</h4>
                </div>
                <div id="newsEditor" class="panel-body" hidden>
                    <%if (account.hasAccessLevel(12)) {%>
                    <button style="margin-left: 10px;" id="editNews" class="btn btn-success" type="button" > News Management <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></button>
                            <%}%>
                    <hr>
                    <h3> Add News</h3>
                    <form action="AddNews" method="POST" enctype="multipart/form-data">

                        <div class="form-group">
                            <label for="title">Title:</label>
                            <input name="title" type="text" class="form-control" id="title" maxlength="45" required/>
                        </div>

                        <textarea name="editor1" id="editor1" rows="10" cols="80"></textarea>
                        <script>
                           
                        </script>
                        <br/>
                        <span class="btn btn-default btn-file">
                            <input name="image" multiple accept='image/*' type="file">
                        </span>
                        <br/>
                        <br>

                        <div class="form-group">
                            <input class="btn btn-primary" type="submit" value="Create News">
                            
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <%
            }
            if (account.hasAccessLevel(10)) {
        %>
        <div class="col-md-12">
            <div style="cursor:pointer" class="panel panel-default">
                <div class="panel-heading" id="userPanel">
                    <h4><i class="fa fa-fw fa-check"></i>Account Management</h4>
                </div>
                <div id="userEditor" class="panel-body" hidden>
                    <%if (account.hasAccessLevel(11)) {
                    %>
                    <div class='alert alert-danger'>Warning: The button below will reset the points of all users in the database. This action cannot be reversed.</div>
                    <form action="ResetPoints" method="POST">
                        <input class="btn btn-danger" type="submit" value="Reset ALL Points">
                    </form>
                    <br/>
                    <%}%>  
                    <form>
                        <input id="editAccount" class="btn btn-info" type="button" value="Manage Accounts">
                    </form>
                </div>
            </div>
        </div>
        
        <%}
            if (account.hasAccessLevel(2)) {%>
        <div class="col-md-12">
            <div class="panel panel-default">
                <div style="cursor:pointer" class="panel-heading" id="eventsPanel">
                    <h4><i class="fa fa-fw fa-check"></i>Events Management</h4>
                </div>
                <div id="eventsEditor" class="panel-body" hidden>
                    <%if (account.hasAccessLevel(13)) {%>
                    <button style="margin-left: 10px;" id="editEvent" class="btn btn-success" type="button">Event Management <span class="glyphicon glyphicon-pencil" aria-hidden="true"></button>
                            <%}%>
                            <hr>
                            <h3>Add Event </h3>
                    <form action="NewEvent" role="form" id="NewEvent" method="POST" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="eventTitle">Event Title:</label>
                            <input name="eventTitle" type="text" class="form-control" id="title1" maxlength="45"/>
                        </div>

                        <label for="datetimepicker1">Start date / Time:</label>           
                        <div class="row">
                            <div class='col-sm-5'>
                                <div class="form-group">
                                    <div class='input-group date' id='datetimepicker1'>
                                        <input name="startdate" type='text' class="form-control" required/>
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>
                            </div>                          
                        </div>

                        <label for="datetimepicker2">End date / Time:</label>           
                        <div class="row">
                            <div class='col-sm-5'>
                                <div class="form-group">
                                    <div class='input-group date' id='datetimepicker2'>
                                        <input name="enddate" type='text' class="form-control" required />
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                           
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label for="eventLocation">Location:</label>
                                    <input name="eventLocation" id="eventLocation" type="text" class="form-control" id="location" maxlength="45"/>
                                </div>
                            </div>
                        </div>



                        <label for="eventDescription">Description:</label>
                        <textarea name="eventDescription" id="editor1" rows="10" cols="80"></textarea>
                        <br/>
                        <span class="btn btn-default btn-file">
                            <input name="image" multiple accept='image/*' type="file">
                        </span>
                        <br/>
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

                        <div class="row">
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label for="points">Points:</label>
                                    <input name="points" id="eventLocation" type="number" class="form-control" required/>
                                </div>
                            </div>
                        </div>       

                        <br>
                        <div class="form-group">
                            <input class="btn btn-primary" type="submit" value="Create Event">                          
                            <br/>  
                        </div>
                    </form> 
                </div>
            </div>
        </div>                            
        
        <%}
            if (account.hasAccessLevel(4)) {%>
        <div class="col-md-12">
            <div class="panel panel-default">
                <div style="cursor:pointer" class="panel-heading" id="quizPanel">
                    <h4><i class="fa fa-fw fa-check"></i>Quiz Management</h4>
                </div>
                <div id="quizEditor" class="panel-body" hidden>

                </div>
            </div>
        </div>
        

        <%}
            if (account.hasAccessLevel(5)) {%>
        <div class="col-md-12">
            <div class="panel panel-default">
                <div style="cursor:pointer" class="panel-heading" id="quickRegisterPanel">
                    <h4><i class="fa fa-fw fa-check"></i>Create Temporary Account</h4>
                </div>
                <div id="quickRegisterEditor" class="panel-body" hidden>
                    <form action="SignUp/Temp" role="form" id="TempSignUp" method="POST">
                        <div class="col-xs-6">
                            <div class="form-group">
                                <label for="firstName">First Name:</label>
                                <input name="first" type="text" class="form-control" id="firstName" maxlength="45" required/>
                            </div>
                        </div>
                        <div class="col-xs-6">
                            <div class="form-group">
                                <label for="lastName">Last Name:</label>
                                <input name="last" type="text" class="form-control" id="lastName" maxlength="45" required/>
                            </div>
                        </div>
                        <div class="col-xs-12">
                            <div class="form-group">
                                <label for="email">E-mail Address:</label>
                                <input name="email" type="email" class="form-control" id="email" maxlength="45" required onkeyup="checkEmail();"/>
                            </div>
                        </div>
                        <div class="col-xs-6">
                            <div class="form-group">
                                <input class="btn btn-default" type="submit" value="Create Account">
                            </div>
                            <div id="message"><h2></h2></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
       
        <%}%>
        <div class="col-md-12">
            <div class="panel panel-default">
                <div style="cursor:pointer" class="panel-heading" id="stats">
                    <h4><i class="fa fa-fw fa-check"></i>View Stats & Search Tool</h4>
                </div>          
            </div>
        </div>
        
         <div class="col-md-12">
            <div class="panel panel-default">
                <div style="cursor:pointer" class="panel-heading" id="leaderboard">
                    <h4><i class="fa fa-fw fa-check"></i>Leaderboard</h4>
                </div>          
            </div>
        </div>
       
    </div>
</body>
<%@include file ="footer.jsp" %>
</html>

