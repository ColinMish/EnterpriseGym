<%-- 
    Document   : mypoints
    Created on : Sep 17, 2015, 8:57:18 PM
    Author     : davidkenny
--%>

<html>

     <%@include file="header.jsp" %>
    <%@include file="sidebar.jsp" %>
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="http://code.jquery.com/jquery-1.9.1.js" type="text/javascript"></script>
    <script src="http://code.highcharts.com/highcharts.js" type="text/javascript"></script>
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
            name: "Points",
            colorByPoint: true,
            data: [{
                name: "Action",
                y: 70
            }, {
                name: "Project",
                y: 70,
                sliced: true,
                selected: true
            }, {
                name: "Virtual",
                y: 70
            }, {
                name: "Practice",
                y: 70
            }, {
                name: "Theory",
                y: 70
            }]
        }]
    });
});
    </script>
  </head>
  <body>
    <div id="container" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
    <%@include file ="footer.jsp" %>
  </body>
</html>