<%-- 
    Document   : mypoints
    Created on : Sep 17, 2015, 8:57:18 PM
    Author     : davidkenny
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Entities.UserEntity"%>
<html>

        <% if (session.getAttribute("username") == null){ %>
         <%@include file="header.jsp" %>
   <% }else{ %>
     <%@include file="headerloggedin.jsp" %> <%}%>
    <%--<%@include file="sidebar.jsp" %>--%>
    
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
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
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
                y: <%=p.getVitrualPoints()%>
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

$(function () {
    $('#container2').highcharts({
        data: {
            table: 'datatable2'
        },
        chart: {
            type: 'column'
        },
        title: {
            text: 'Points Bar Chart'
        },
        yAxis: {
            allowDecimals: false,
            title: {
                text: 'Units'
            }
        },
        tooltip: {
            formatter: function () {
                return '<b>' + this.series.name + '</b><br/>' +
                    this.point.y + ' ' + this.point.name.toLowerCase();
            }
        }
    });
});
    </script>
  </head>
  <body>
    <div id="container" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
    
       
    
    <div class="col-md-8" id="ConnectText">
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
                            <td><%=p2.getVitrualPoints()%></td>
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
        </div>
        
     <div id="container2" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
    
    
    
    <%@include file ="footer.jsp" %>
  </body>
</html>