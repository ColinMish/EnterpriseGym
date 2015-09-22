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
        <script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
    </head> 
   
    <body>
    <%@include file="header.jsp" %>
    <div class="hidden-xs">
        <%@include file="sidebar.jsp"%>
    </div>
    
    <% Boolean storyAdded = (Boolean) request.getAttribute("storyAdded"); %>
    <% Boolean storyNotAdded = (Boolean) request.getAttribute("storyNotAdded"); %>
    
    <% Boolean pointsReset = (Boolean) request.getAttribute("pointsReset"); %>
    <% Boolean pointsNotReset = (Boolean) request.getAttribute("pointsNotReset"); %>
    
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
            </div>
        </div>
        
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading" id="newsPanel">
                    <h4><i class="fa fa-fw fa-check"></i>News Editor</h4>
                </div>
                <div id="newsEditor" class="panel-body" hidden>
                    <form action="AddNews" method="POST">
                        <textarea name="editor1" id="editor1" rows="10" cols="80"></textarea>
                        <script>
                            CKEDITOR.replace('editor1');
                        </script>
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
                    <div class='alert alert-danger'>Warning: The button below will reset the points of all users in the database.</div>
                    <form action="ResetPoints" method="POST">
                        <input class="btn btn-default" type="submit" value="Reset ALL Points">
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

