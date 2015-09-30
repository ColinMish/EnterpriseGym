<%-- 
    Document   : newsadmin
    Created on : Sep 23, 2015, 1:01:40 PM
    Author     : davidkenny
--%>

<%@page import="Entities.EventUserEntity"%>
<%@page import="Entities.EventEntity"%>
<%@page import="java.util.Iterator"%>
<%@page import="Entities.UserEntity"%>
<html>

    <%@include file="header.jsp" %>

    <script src="${pageContext.request.contextPath}/js/eventAttend.js" type="text/javascript"></script>
    <script>var ctx = "${pageContext.request.contextPath}"</script>

    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 id="modaltitle" class="modal-title">Delete</h4>
                </div>
                <div class="modal-body">
                    <p id="modalmessage">Are you sure you want to delete this event?</p>
                </div>
                <div class="modal-footer">
                    <button id="yes" type="button" onclick="deleteEvent()" class="btn btn-Danger" data-dismiss="modal">Yes</button>  
                    <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                </div>
            </div>

        </div>
    </div>

    <div class="modal fade" id="myModal2" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 id="modaltitle2" class="modal-title">Success</h4>
                </div>
                <div class="modal-body">
                    <p id="modalmessage2">Message deleted.</p>

                </div>
                <div class="modal-footer">
                    <button type="button" onclick="reload()" class="btn btn-default" data-dismiss="modal">Ok</button>
                </div>
            </div>

        </div>
    </div>

    <div class="modal fade" id="myModal3" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 id="modaltitle3" class="modal-title">Error</h4>
                </div>
                <div class="modal-body">
                    <p id="modalmessage3">Message deleted.</p>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
                </div>
            </div>

        </div>
    </div>

    <div class="container">



        <div class="row">
            <div class="col-lg-12">
                <h1></h1>
                <p></p>
            </div>
        </div>

        <div class="col-md-12" id="ConnectText2">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h4><i class="fa fa-fw fa-check"></i><strong>Event Admin Pannel</strong></h4><br>
                </div>
                <div class="panel-body">
                    <%

                        int eventID = 0;
                        String eventString = (String) request.getAttribute("eventid").toString();
                        if (eventString != null && !eventString.isEmpty()) {
                            eventID = Integer.parseInt(eventString);
                        }
                        java.util.LinkedList<EventUserEntity> eventuser = (java.util.LinkedList<EventUserEntity>) request.getAttribute("eventuser");
                        if (eventuser != null && eventuser.size() == 0) {
                    %>
                    <p>No News found.</p>
                    <%
                    } else if (eventuser != null) { %>
                    <table class="table table-hover" id="datatable2">
                        <thead>
                            <tr>
                                <th>Last Name</th>
                                <th>Name</th>
                                <th>Username</th>
                                <th>Email</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%

                                Iterator<EventUserEntity> iterator;
                                iterator = eventuser.iterator();
                                while (iterator.hasNext()) {
                                    EventUserEntity myEvent = (EventUserEntity) iterator.next();
                            %>       

                            <tr>
                                <td><%=myEvent.getLastname()%></td>
                                <td><%=myEvent.getFirstname()%></td>
                                <td><%=myEvent.getUsername()%></td>
                                <td><%=myEvent.getEmail()%></td>
                                <td><% if (myEvent.isAttended()) {%>
                                    <a role="button" id="attending<%=myEvent.getUserid()%>" onclick="Leave(<%=myEvent.getUserid()%>,<%=eventID%>)" class="btn btn-danger">Mark Absent</a> <a role="button" id="notattending<%=myEvent.getUserid()%>" onclick="Attend(<%=myEvent.getUserid()%>,<%=eventID%>)" class="btn btn-success hidden">Mark as Attended </a>   
                                    <%} else {%> 
                                    <a role="button" id="notattending<%=myEvent.getUserid()%>" onclick="Attend(<%=myEvent.getUserid()%>,<%=eventID%>)" class="btn btn-success">Mark as Attended </a>       <a role="button" id="attending<%=myEvent.getUserid()%>" onclick="Leave(<%=myEvent.getUserid()%>,<%=eventID%>)" class="btn btn-danger hidden">Mark Absent</a> 
                                    <%}%>
                                </td>
                            </tr>
                            <%} %></tbody> <%}%>
                    </table>
                    <a href="javascript:history.back()" class="btn btn-danger">Back</a>
                </div>
            </div>
        </div>  
    </div>
    <%@include file ="footer.jsp" %>
</body>
</html>
