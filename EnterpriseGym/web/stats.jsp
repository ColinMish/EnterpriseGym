<%@page import="java.util.LinkedList"%>
<%@page import="java.util.LinkedList"%>
<!DOCTYPE html>
<html lang="en">
    
    <%@include file="header.jsp" %>
    <script src="${pageContext.request.contextPath}/js/stats.js"></script>
    <script src="http://code.highcharts.com/highcharts.js"></script>
    <script src="http://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://cdn.datatables.net/1.10.9/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/charts/userchart.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/charts/eventchart.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/charts/eventuserchart.js" type="text/javascript"></script>
    <link href="https://cdn.datatables.net/1.10.9/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href='css/carousel.css' rel='stylesheet' type='text/css'>
    
    <div class="hidden-xs">
        <%@include file="sidebar.jsp"%>
    </div>

    <%
        LinkedList<LinkedList<String>> searchTable = new LinkedList();
        String current = "user";
        if (request.getAttribute("tableData") != null) {
            searchTable = (LinkedList) request.getAttribute("tableData");
        }
        if (request.getAttribute("current") != null)
        {
            current = (String) request.getAttribute("current");
        }
    %>

    <!-- Page Content -->
    <div class="content">
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <h1>Stats & Search</h1>
                    <p></p>
                </div>
            </div>
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i>Search</h4>
                        <form id="searchFor" action="Search" role="form" method="POST">
                            <input type="radio" id="userRadio" name="option" value="user" <%if(current.equals("user")){%>checked="checked"<%}%>>  Users
                            <input style="margin-left: 20px;" id="eventRadio" type="radio" name="option" value="event" <%if(current.equals("event")){%>checked="checked"<%}%>>  Events  
                            <input id="postData" type="text" name="searchTable" value="user">
                            <input style="margin-left: 10px;" type="submit" value="Search" class="btn btn-default">
                        </form>
                    </div>
                    <div id="tableBody" class="panel-body">
                        <% if (!searchTable.isEmpty()) {
                                LinkedList<String> titles = searchTable.removeFirst();
                        %>
                        <table id="dataTable" class="display" cellspacing="5" width="100%">
                            <thead>
                                <tr id="tableHeader">
                                    <% for (String item : titles) {%>
                                    <th><%=item%></th>
                                        <%}%>
                                </tr>
                            </thead>

                            <tfoot id="tableFooter">
                                <tr>
                                    <% for (String item : titles) {%>
                                    <th><%=item%></th>
                                        <%}%>
                                </tr>
                            </tfoot>

                            <tbody>
                                <% for (LinkedList<String> row : searchTable) {%>
                                <tr>
                                    <% for (String item : row) {%>
                                    <td><%=item%></td>
                                    <%}%>
                                </tr>
                                <%}%> 
                        </table>
                        <%}%>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4><i class="fa fa-fw fa-check"></i>Users</h4>
                            <label>Property</label>
                            <select id="userproperty">
                                <option selected="selected"></option>
                            </select>
                        </div>
                        <div class="panel-body">
                            <div id="userchart" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4><i class="fa fa-fw fa-check"></i>Events</h4>
                            <label>Property</label>
                            <select id="eventproperty">
                                <option selected="selected"></option>
                            </select>
                        </div>
                        <div class="panel-body">
                            <div id="eventchart" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4><i class="fa fa-fw fa-check"></i>Users vs Events</h4>
                            <label>Filter by user:</label>
                            <select id="userbarproperty">
                                <option selected="selected"></option>
                            </select>
                            <label style="margin-left:30px;">Value:</label>
                            <select id="valuebarproperty">
                                <option selected="selected"></option>
                            </select>
                        </div>
                        <div class="panel-body">
                            <div id="eventuserchart" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
                        </div>
                    </div>
                    <hr>
                </div>
            </div>

            <%@include file ="footer.jsp" %>

            </body>

            </html>
