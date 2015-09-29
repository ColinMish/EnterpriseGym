<%-- 
    Document   : mypoints
    Created on : Sep 17, 2015, 8:57:18 PM
    Author     : davidkenny
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Entities.UserEntity"%>
<html>




    <%@include file="header.jsp" %>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="http://code.highcharts.com/highcharts.js" type="text/javascript"></script>
    <script src="http://code.highcharts.com/modules/data.js"></script>
    <script src="http://code.highcharts.com/modules/exporting.js" type="text/javascript"></script>

    <%
        java.util.LinkedList<UserEntity> points = (java.util.LinkedList<UserEntity>) request.getAttribute("points");
        Iterator<UserEntity> iterator;
        UserEntity user = null;
        iterator = points.iterator();
        while (iterator.hasNext()) {
            user = (UserEntity) iterator.next();
    %>

    <script type="text/javascript">
        $(function () {
            $('#chart').highcharts({
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false,
                    type: 'pie'
                },
                title: {
                    text: 'Points Division'
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            format: '<b>{point.name}</b>: {point.y:.0f}',
                            style: {
                                color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                            }
                        }
                    }
                },
                series: [{
                        name: "Points",
                        colorByPoint: true,
                        data: [{
                                name: "Action",
                                y: <%=user.getPercentageOfTotal(user.getActionPoints())%>
                            }, {
                                name: "Project",
                                y: <%=user.getPercentageOfTotal(user.getProjectPoints())%>,
                                sliced: true,
                                selected: true
                            }, {
                                name: "Virtual",
                                y: <%=user.getPercentageOfTotal(user.getVirtualPoints())%>
                            }, {
                                name: "Practice",
                                y: <%=user.getPercentageOfTotal(user.getPracticePoints())%>
                            }, {
                                name: "Theory",
                                y: <%=user.getPercentageOfTotal(user.getTheoryPoints())%>
                            }]
                    }]
            });
        });

    </script>
    <body>
        <div class="banner"></div>
        <br>
        <div class="container">

            <div class="row">
                <div class="row-height">
                    <div class="col-md-6" id="ConnectText2">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h4><i class="fa fa-fw fa-check"></i><strong>Points</strong></h4>
                            </div>
                            <div id="chart" class="panel-body"></div>
                        </div>
                    </div>

                    <div class="col-md-6" id="ConnectText">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h4><i class="fa fa-fw fa-check"></i><strong>Points Table</strong></h4>
                            </div>
                            <div class="panel-body">
                                <table class="table table-hover" id="datatable2">
                                    <thead>                           
                                        <tr>
                                            <th></th>
                                            <th>Points</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th>Virtual Points:</th>
                                            <td><%=user.getVirtualPoints()%></td>
                                        </tr>
                                        <tr>
                                            <th>Project Points:</th>
                                            <td><%=user.getProjectPoints()%></td>
                                        </tr>
                                        <tr>
                                            <th>Practice Points:</th>
                                            <td><%=user.getPracticePoints()%></td>
                                        </tr>
                                        <tr>
                                            <th>Theory Points:</th>
                                            <td><%=user.getTheoryPoints()%></td>
                                        </tr>
                                        <tr>
                                            <th>Action Points:</th>
                                            <td><%=user.getActionPoints()%></td>
                                        </tr>                      
                                    </tbody>
                                    <tfoot>                           
                                        <tr>
                                            <th>Total</th>
                                            <th><%=user.getTotalPoints()%></th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="row-height">
                    <div class="col-md-10" id="ConnectText2">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h4><i class="fa fa-fw fa-check"></i><strong>Progress Tracker</strong></h4>
                            </div>
                            <div class="panel-body">
                                <table class="table table-hover" id="datatable2">
                                    <thead>

                                        <tr>
                                            <th></th>
                                            <th>Silver Progress</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th>Virtual Points: <% if (user.getVirtualPoints() >= 70) {%><img style="margin-left: 10px;" width="20" src="${pageContext.request.contextPath}/Pictures/silver.jpg"><%}%></th>
                                            <td class="col-md-8"><div class="progress">
                                                    <div class="progress-bar" role="progressbar" aria-valuenow="<%=user.getVirtualPercentage()%>"
                                                         aria-valuemin="0" aria-valuemax="100" style="width:<%=user.getVirtualPercentage()%>%">
                                                        <%=user.getVirtualPercentage()%>%
                                                    </div>
                                                </div></td>
                                        </tr>
                                        <tr>
                                            <th>Project Points:<% if (user.getProjectPoints() >= 70) {%><img style="margin-left: 10px;" width="20" src="${pageContext.request.contextPath}/Pictures/silver.jpg"><%}%></th>
                                            <td class="col-md-8"><div class="progress">
                                                    <div class="progress-bar" role="progressbar" aria-valuenow="<%=user.getProjectPercentage()%>"
                                                         aria-valuemin="0" aria-valuemax="100" style="width:<%=user.getProjectPercentage()%>%">
                                                        <%=user.getProjectPercentage()%>%
                                                    </div>
                                                </div></td>
                                        </tr>
                                        <tr>
                                            <th>Practice Points:<% if (user.getPracticePoints() >= 70) {%><img style="margin-left: 10px;" width="20" src="${pageContext.request.contextPath}/Pictures/silver.jpg"><%}%></th>
                                            <td class="col-md-8"><div class="progress">
                                                    <div class="progress-bar" role="progressbar" aria-valuenow="<%=user.getPracticePercentage()%>"
                                                         aria-valuemin="0" aria-valuemax="100" style="width:<%=user.getPracticePercentage()%>%">
                                                        <%=user.getPracticePercentage()%>%
                                                    </div>
                                                </div></td>
                                        </tr>
                                        <tr>
                                            <th>Theory Points:<% if (user.getTheoryPoints() >= 70) {%><img style="margin-left: 10px;" width="20" src="${pageContext.request.contextPath}/Pictures/silver.jpg"><%}%></th>
                                            <td class="col-md-8"><div class="progress">
                                                    <div class="progress-bar" role="progressbar" aria-valuenow="<%=user.getTheoryPercentage()%>"
                                                         aria-valuemin="0" aria-valuemax="100" style="width:<%=user.getTheoryPercentage()%>%">
                                                        <%=user.getTheoryPercentage()%>%
                                                    </div>
                                                </div></td>
                                        </tr>
                                        <tr>
                                            <th>Action Points:<% if (user.getActionPoints() >= 70) {%><img style="margin-left: 10px;" width="20" src="${pageContext.request.contextPath}/Pictures/silver.jpg"><%}%></th>
                                            <td class="col-md-8"><div class="progress">
                                                    <div class="progress-bar" role="progressbar" aria-valuenow="<%=user.getActionPercentage()%>" 
                                                         aria-valuemin="0" aria-valuemax="100" style="width:<%=user.getActionPercentage()%>%">
                                                        <%=user.getActionPercentage()%>%
                                                    </div>
                                                </div></td>
                                        </tr>                      
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>


                    <div class="col-md-2" id="ConnectText2">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h4><i class="fa fa-fw fa-check"></i><strong>Medal Cabinet</strong></h4>
                            </div>
                            <div class="panel-body">
                                <% if (user.getSilverMedals() == 0) {
                                %><h3>No medals earned yet</h3><%
                        } else {%>
                                <%if (user.getSilverMedals() > 1) {%>
                                <img style="margin-left: 10px;" width="90" src="${pageContext.request.contextPath}/Pictures/gold.jpg">
                                <% } else if (user.getSilverMedals() == 1) {%>
                                <img style="margin-left: 10px;" width="90" src="${pageContext.request.contextPath}/Pictures/silver.jpg">
                                <% }
                            }%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%}%>
        </div>
        <%@include file = "footer.jsp" %>
    </body>
</html>