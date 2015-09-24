<%-- 
    Document   : admin
    Created on : 21-Sep-2015, 16:44:50
    Author     : Andy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <link href='css/style.css' rel='stylesheet' type='text/css'>
        <link href='css/media.css' rel='stylesheet' type='text/css'>
        <script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
    </head> 
   
    <body>
    <%@include file="header.jsp" %>
    <div class ="mobile">
    <%@include file="sidebar.jsp"%>
    </div>
    
    <% Boolean storyAdded = (Boolean) request.getAttribute("storyAdded"); %>
    <% Boolean storyNotAdded = (Boolean) request.getAttribute("storyNotAdded"); %>
    
    <% Boolean pointsReset = (Boolean) request.getAttribute("pointsReset"); %>
    <% Boolean pointsNotReset = (Boolean) request.getAttribute("pointsNotReset"); %>
    
    <% Boolean accountDeleted = (Boolean) request.getAttribute("accountDeleted"); %>
    <% Boolean accountNotDeleted = (Boolean) request.getAttribute("accountNotDeleted"); %>
    
    <%Boolean newsUpdated = (Boolean) request.getAttribute("newsUpdated"); %>
    
    
    <!-- Page Content -->
    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <h1>Admin Panel</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <% if(storyAdded != null) { %> <div class='alert alert-success fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><p>News Story Posted Successfully.</p></div> <% } %>
                <% if(storyNotAdded != null) { %> <div class='alert alert-danger fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><p>Error Posting News Story.</p></div> <% } %>
                
                <% if(pointsReset != null) { %> <div class='alert alert-success fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><p>Points Successfully Reset.</p></div> <% } %>
                <% if(pointsNotReset != null) { %> <div class='alert alert-danger fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><p>Error Resetting Points.</p></div> <% } %>
                
                <% if(accountDeleted != null) { %> <div class='alert alert-success fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><p>Account Successfully Deleted.</p></div> <% } %>
                <% if(accountNotDeleted != null) { %> <div class='alert alert-danger fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><p>Error Deleting Account.</p></div> <% } %>
                
                <% if(newsUpdated != null) { if(newsUpdated==true){ %> <div class='alert alert-success fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><p>News Story Updated Successfully.</p></div>
                <% }else{ %>  <div class='alert alert-success fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><p>Update failed please try again.</p></div> <%} }%>
                
            </div>
        </div>
        
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading" id="newsPanel">
                    <h4><i class="fa fa-fw fa-check"></i>News Editor</h4>
                </div>
                <div id="newsEditor" class="panel-body" hidden>
                    <form action="AddNews" method="POST" enctype="multipart/form-data">
                        
                              <div class="form-group">
                        <label for="title">Title:</label>
                        <input name="title" type="text" class="form-control" id="title" maxlength="45" required/>
                        </div>
                        
                        <textarea name="editor1" id="editor1" rows="10" cols="80"></textarea>
                        <script>
                            CKEDITOR.replace('editor1');
                        </script>
                        <br/>
                        <span class="btn btn-default btn-file">
                        <input name="image" multiple accept='image/*' type="file">
                        </span>
                        <br/>
                      
                        <input class="btn btn-default" type="submit" value="Create Post">
                    </form>
                </div>
            </div>
        </div>
        <script>
            $("#newsPanel").click(function() {
                $("#newsEditor").toggle( "fast", function() {
                });
            });
        </script>
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading" id="userPanel">
                    <h4><i class="fa fa-fw fa-check"></i>User Management</h4>
                </div>
                <div id="userEditor" class="panel-body" hidden>
                    <div class='alert alert-danger'>Warning: The button below will reset the points of all users in the database. This action cannot be reversed.</div>
                    <form action="ResetPoints" method="POST">
                        <input class="btn btn-danger" type="submit" value="Reset ALL Points">
                    </form>
                    <br/>
                    <div class='alert alert-danger'>Warning: The form below will completely remove the specified account from the database. This action cannot be reversed.</div>
                    <form action="DeleteUser" method="POST">
                        <label for="usernameField">Username:</label>
                        <input name="usernameField" type="text" class="form-control" id="usernameField" maxlength="45" required/>
                        <br/>
                        <input class="btn btn-danger" type="submit" value="Delete Account">
                    </form>
                </div>
            </div>
        </div>
        <script>
            $("#userPanel").click(function() {
                $("#userEditor").toggle( "fast", function() {
                });
            });
        </script>
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading" id="eventsPanel">
                    <h4><i class="fa fa-fw fa-check"></i>Events Management</h4>
                </div>
                <div id="eventsEditor" class="panel-body" hidden>

                </div>
            </div>
        </div>
        <script>
            $("#eventsPanel").click(function() {
                $("#eventsEditor").toggle( "fast", function() {
                });
            });
        </script>
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading" id="quizPanel">
                    <h4><i class="fa fa-fw fa-check"></i>Quiz Management</h4>
                </div>
                <div id="quizEditor" class="panel-body" hidden>

                </div>
            </div>
        </div>
        <script>
            $("#quizPanel").click(function() {
                $("#quizEditor").toggle( "fast", function() {
                });
            });
        </script>
    </div>
    
    <%@include file ="footer.jsp" %>
    </body>
</html>

