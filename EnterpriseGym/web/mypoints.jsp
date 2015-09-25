<%-- 
    Document   : mypoints
    Created on : Sep 17, 2015, 8:57:18 PM
    Author     : davidkenny
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Entities.UserEntity"%>
<html>
    
    <link href='${pageContext.request.contextPath}/css/carousel.css' rel='stylesheet' type='text/css'>
    <link href='${pageContext.request.contextPath}/css/media.css' rel='stylesheet' type='text/css'>
    
    
    <%@include file="header.jsp" %>
 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="http://code.jquery.com/jquery-1.9.1.js" type="text/javascript"></script>
    <script src="http://code.highcharts.com/highcharts.js" type="text/javascript"></script>
    <script src="http://code.highcharts.com/modules/data.js"></script>
    <script src="http://code.highcharts.com/modules/exporting.js" type="text/javascript"></script>
    
    <script type="text/javascript">
      $(function () {
    $('#container').highcharts({
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
                    <%
                            java.util.LinkedList<UserEntity> points = (java.util.LinkedList<UserEntity>) request.getAttribute("points");
                            Iterator<UserEntity> iterator;
           iterator = points.iterator();
            while (iterator.hasNext()) {
                UserEntity p = (UserEntity) iterator.next();         
                      %>    
                
            name: "Points",
            colorByPoint: true,
            data: [{
                name: "Action",
                y: <%=p.getActionPoints()%>
            }, {
                name: "Project",
                y: <%=p.getProjectPoints()%>,
                sliced: true,
                selected: true
            }, {
                name: "Virtual",
                y: <%=p.getVirtualPoints()%>
            }, {
                name: "Practice",
                y: <%=p.getPracticePoints()%>
            }, {
                name: "Theory",
                y: <%=p.getTheoryPoints()%>
            }]
            <%}%>
        }]
    });
});

    </script>
  </head>
  <body>
      <div class="banner"></div>
    <div id="container" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
    
       

    <div class="col-md-4" id="ConnectText">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i><strong>Points Table</strong></h4><br>
                    </div>
                    <div class="panel-body">
                        <table class="table table-hover" id="datatable2">
                            <%
                            java.util.LinkedList<UserEntity> points2 = (java.util.LinkedList<UserEntity>) request.getAttribute("points");
                            Iterator<UserEntity> iterator2;
           iterator2 = points2.iterator();
            while (iterator2.hasNext()) {
               UserEntity p2 = (UserEntity) iterator2.next();         
                      %>       
                        <thead>
                            
                            <tr>
                                <th></th>
                                <th>Points</th>
                            </tr>
                            </thead>
                            <tbody>
                           <tr>
                            <th>Virtual Points:</th>
                            <td><%=p2.getVirtualPoints()%></td>
                           </tr>
                           <tr>
                            <th>Project Points:</th>
                            <td><%=p2.getProjectPoints()%></td>
                           </tr>
                           <tr>
                            <th>Practice Points:</th>
                            <td><%=p2.getPracticePoints()%></td>
                           </tr>
                           <tr>
                            <th>Theory Points:</th>
                            <td><%=p2.getTheoryPoints()%></td>
                           </tr>
                           <tr>
                            <th>Action Points:</th>
                            <td><%=p2.getActionPoints()%></td>
                           </tr>                      
                            </tbody>
                        <%}%>
                        </table>
                        </div>

       
                    </div>
                </div>
        
        <div class="col-md-8" id="ConnectText2">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i><strong>Progress Tracker</strong></h4><br>
                    </div>
                    <div class="panel-body">
                        <table class="table table-hover" id="datatable2">
                            <%
                            java.util.LinkedList<UserEntity> points3 = (java.util.LinkedList<UserEntity>) request.getAttribute("points");
                            Iterator<UserEntity> iterator3;
           iterator3 = points3.iterator();
            while (iterator3.hasNext()) {
               UserEntity p3 = (UserEntity) iterator3.next();         
                      %>       
                        <thead>
                            
                            <tr>
                                <th></th>
                                <th>Silver Progress</th>
                            </tr>
                            </thead>
                            <tbody>
                           <tr>
                            <th>Virtual Points:</th>
                            <td class="col-md-8"><div class="progress">
                                <div class="progress-bar" role="progressbar" aria-valuenow="<%=p3.getVirtualPercentage()%>"
                                aria-valuemin="0" aria-valuemax="100" style="width:<%=p3.getVirtualPercentage()%>%">
                                 <%=p3.getVirtualPercentage()%>%
                                </div>
                            </div></td>
                           </tr>
                           <tr>
                            <th>Project Points:</th>
                            <td class="col-md-8"><div class="progress">
                                <div class="progress-bar" role="progressbar" aria-valuenow="<%=p3.getProjectPercentage()%>"
                                aria-valuemin="0" aria-valuemax="100" style="width:<%=p3.getProjectPercentage()%>%">
                                 <%=p3.getProjectPercentage()%>%
                                </div>
                            </div></td>
                           </tr>
                           <tr>
                            <th>Practice Points:</th>
                            <td class="col-md-8"><div class="progress">
                                <div class="progress-bar" role="progressbar" aria-valuenow="<%=p3.getPracticePercentage()%>"
                                aria-valuemin="0" aria-valuemax="100" style="width:<%=p3.getPracticePercentage()%>%">
                                 <%=p3.getPracticePercentage()%>%
                                </div>
                            </div></td>
                           </tr>
                           <tr>
                            <th>Theory Points:</th>
                            <td class="col-md-8"><div class="progress">
                                <div class="progress-bar" role="progressbar" aria-valuenow="<%=p3.getTheoryPercentage()%>"
                                aria-valuemin="0" aria-valuemax="100" style="width:<%=p3.getTheoryPercentage()%>%">
                                 <%=p3.getTheoryPercentage()%>%
                                </div>
                            </div></td>
                           </tr>
                           <tr>
                            <th>Action Points:</th>
                            <td class="col-md-8"><div class="progress">
                                <div class="progress-bar" role="progressbar" aria-valuenow="<%=p3.getActionPercentage()%>"
                                aria-valuemin="0" aria-valuemax="100" style="width:<%=p3.getActionPercentage()%>%">
                                 <%=p3.getActionPercentage()%>%
                                </div>
                            </div></td>
                           </tr>                      
                            </tbody>
                        <%}%>
                        </table>
                        </div>

       
                    </div>
                </div>
        </div>
  
    
    
    <%@include file ="footer.jsp" %>
  </body>
</html>