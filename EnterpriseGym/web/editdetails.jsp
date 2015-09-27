<%-- 
    Document   : editdetails
    Created on : 17-Sep-2015, 14:24:34
    Author     : kristiyangeorgiev
--%>

<%@page import="Entities.UserEntity"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        UserEntity user = (UserEntity) request.getAttribute("userdetails");
    %>

    <head>
        <title></title>
        <link href=${pageContext.request.contextPath}'/css/media.css' rel='stylesheet' type='text/css'>
        <link href='${pageContext.request.contextPath}/css/carousel.css' rel='stylesheet' type='text/css'>
        <script src="https://code.jquery.com/jquery-1.11.2.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
        <script src="http://blazeworx.com/jquery.flagstrap.min.js"></script>
    </head>
    <%@include file="header.jsp" %>
    <div class ="mobile">
        <%@include file="sidebar.jsp"%>
    </div>

    <script src="${pageContext.request.contextPath}/js/jquery.flagstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/editProfile.js"></script>
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
    <article>

        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1>Edit Details</h1><br>
                </div>
            </div>

            <form name="editDetailsForm" id="editDetails" method="post" action="EditDetails">
                <div class="col-md-8" id="ConnectText">
                    <div class="panel panel-default">
                        <div class="panel-body">

                            <input name="id" type="text" class="form-control" id="userId" />
                            <div class="col-xs-6">
                                <div class="form-group">
                                    <label for="firstName">First Name:</label>
                                    <input name="first" type="text" class="form-control" id="firstNameEdit" maxlength="45" required/>
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="form-group">
                                    <label for="lastName">Last Name:</label>
                                    <input name="last" type="text" class="form-control" id="lastNameEdit" maxlength="45" required/>
                                </div>
                            </div>
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label for="email">E-mail Address:</label>
                                    <input name="email" type="email" class="form-control" id="emailEdit" maxlength="45" required onkeyup="checkEmail();"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="gender">Gender:</label>
                                <select class="form-control" name="gender" id="genderEdit">
                                    <option value="female">Female</option>
                                    <option value="male">Male</option>
                                    <option value="other">Other</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="flagstrap">Country:</label>
                                <div class="flagstrap" data-input-name="country" data-selected-country=<%if (user == null) {%>"GB"<%} else {%><%=user.getCountry()%><%}%> data-scrollable-height="250px"></div>
                            </div>

                            <script>
                                $('.flagstrap').flagStrap();
                            </script> 
                            <div class="form-group">
                                <label for="university">University, H.E or F.E Institution:</label>
                                <select class="form-control" id="universityEdit" name="university">
                                    <option>-</option>
                                    <option value="dundee">University of Dundee</option>
                                    <option value="abertay">University of Abertay</option>
                                    <option value="dundeeCol">Dundee College</option>
                                    <option value="other">Other</option>
                                    <option value="none">None</option>
                                </select>
                            </div>
                            <div id="schoolSectionEdit" class="form-group hidden">
                                <label for="school">School:</label>
                                <select class="form-control" id="schoolEdit" name="school">
                                    <option>-</option>
                                </select>
                            </div>
                            <div id="subjectSectionEdit" class="form-group hidden">
                                <label for="subject">Subject:</label>
                                <select class="form-control" id="subjectEdit" name="subject">
                                    <option>-</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="sel1">Current year of study:</label>
                                <select name="year" class="form-control" id="yosEdit">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">>4</option>
                                </select>
                            </div>
                            <div id="matricSectionEdit" class="form-group hidden">
                                <label for="matric">Matriculation Number:</label>
                                <input name="matric" type="number" class="form-control" value="0" id="matricEdit" required/>
                            </div>
                            <input class="btn btn-primary" type="submit" value="Update"><br><br>
                            <div id="successMessage" class='alert alert-success fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><p>Updates Saved Successfully.</p></div>
                            <div id="errorMessage" class='alert alert-danger fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><p>Error Posting News Story.</p></div>
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
                    Account userAccount = (Account) request.getAttribute("userAccount");
                    if (allAccess != null && userAccount != null) {
            %>
            <form id="UpdateAccess" name="UpdateAccess" method="POST" action="UpdateAccess">
                <div class="col-md-8" id="accessLevels">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <table class="table table-hover">
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
                                        <td id="checkbox"><input type="checkbox" name="accessLevel" value="<%=i%>" <%if (userAccount.hasAccessLevel(i)) {%>checked<%}%>></td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody> 
                            </table>
                            <input type="hidden" id="accountId" value="<%=userAccount.getId()%>">
                            <input class="btn btn-primary" type="submit" value="Update"><br><br>
                            <div id="tokenSuccessMessage" class='alert alert-success fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><p>Updates Saved Successfully.</p></div>
                            <div id="tokenErrorMessage" class='alert alert-danger fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><p>Error Updating access tokens.</p></div>
                        </div>
                    </div>
                </div>
            </form>
            <%}
                }%>
        </div>
    </article>
    <%
        if (user != null) {
    %><script>
        $("#userId").val("<%=user.getId()%>");
        populateFields("<%=user.getName()%>", "<%=user.getLastname()%>",
                "<%=user.getEmail()%>",
                "<%=user.getGender()%>",
                "<%=user.getUniversity()%>",
                "<%=user.getSchool()%>",
                "<%=user.getSubject()%>",
                "<%=user.getYearOfStudy()%>",
                "<%=user.getMatric()%>");</script><%
            }
        %>
        <%@include file ="footer.jsp" %>
</body>
</html>
