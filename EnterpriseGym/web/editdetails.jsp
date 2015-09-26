<%-- 
    Document   : editdetails
    Created on : 17-Sep-2015, 14:24:34
    Author     : kristiyangeorgiev
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <link href='${pageContext.request.contextPath}/css/carousel.css' rel='stylesheet' type='text/css'>
        <link href='css/profile.css' rel='stylesheet' type='text/css'>  
        <link href='css/media.css' rel='stylesheet' type='text/css'>
    </head>

    <body>
        <%@include file="header.jsp" %>
        <div class ="mobile">
            <%@include file="sidebar.jsp"%>
        </div>
        <div class="banner"></div>
        <article>

            <div class="container">

                <div class="row">
                    <div class="col-lg-12">
                        <h1>Edit Details</h1><br>
                    </div>
                </div>

                <form name="myForm" method="post" action="EditDetails">
                    <div class="col-md-8" id="ConnectText">
                        <div class="panel panel-default">

                            <div class="panel-body">

                                <div class="form-group">
                                    <label for="firstn">First Name:</label>
                                    <input type="text" name="first name" class="form-control" id="firstname">
                                </div>

                                <div class="form-group">
                                    <label for="lastn">Last Name:</label>
                                    <input type="text" name="last name" class="form-control" id="lastname">
                                </div>

                                <div class="form-group">
                                    <label for="email">Email Address:</label>
                                    <input type="text" name="email" class="form-control" id="email">
                                </div>

                                <div class="form-group">
                                    <label for="lastn">Country:</label>
                                    <input type="text" name="country" class="form-control" id="country">
                                </div>

                                <div class="form-group">
                                    <label for="year">Year of study:</label>
                                    <input type="text" name="year" class="form-control" id="year">
                                </div>

                                <input class="btn btn-primary" type="submit" value="Update"><br><br>

                            </div>
                        </div>
                    </div>
                </form>
                <form name="ChangePassword" method="POST" action="ChangePassword">

                    <div class="col-md-8" id="ConnectText">
                        <div class="panel panel-default">

                            <div class="panel-body">
                                <input type="hidden" name="username" value="<%=account.getUsername()%>">

                                <div class="form-group">
                                    <label for="usr">Old Password:</label>
                                    <input type="text" name="password" class="form-control" id="password">
                                </div>

                                <div class="form-group">
                                    <label for="usr">New Password:</label>
                                    <input type="text" name="newPassword1" class="form-control" id="newpassword">
                                </div>

                                <div class="form-group">
                                    <label for="usr">New Password Again:</label>
                                    <input type="text" name="newPassword2" class="form-control" id="newpassword">
                                </div>

                                <input class="btn btn-primary" type="submit" value="Update"><br><br>
                            </div>
                        </div>
                    </div>                
                </form>

                <%if (account.hasAccessLevel(6)) {
                        LinkedList allAccess = (LinkedList) request.getAttribute("allAccess");
                %>
                <form name="UpdateAccess" method="POST" action="UpdateAccess">
                    <div class="col-md-8" id="accessLevels">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <table class="table table-hover" id="privilages">
                                    <thead>
                                        <tr>
                                            <th>Access Level</th>
                                            <th>Description</th>
                                            <th>Add / Remove</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            for (int i = 1; i < allAccess.size(); i++) {
                                                String accesslevel = (String) allAccess.get(i - 1);
                                        %>       
                                        <tr>
                                            <td><%=i%></td>
                                            <td><%=accesslevel%></td>
                                            <td><input type="checkbox" name="accessLevel" value="<%=i%>" <%if(account.hasAccessLevel(i)){%>checked<%}%>></td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody> 
                                </table>
                            </div>
                        </div>
                    </div>
                </form>
                <%}%>
            </div>
        </article>
        <%@include file ="footer.jsp" %>
    </body>
</html>
