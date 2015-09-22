<!DOCTYPE html>
<html lang="en">

    <%@include file="header.jsp" %>
    <script src="${pageContext.request.contextPath}/js/stats.js"></script>
    <script src="http://code.highcharts.com/highcharts.js"></script>
    <script src="http://code.highcharts.com/modules/exporting.js"></script> <!--    make local-->
    <script src="js/charts/userchart.js" type="text/javascript"></script>
    <div class="hidden-xs">
        <%@include file="sidebar.jsp"%>
    </div>

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
                        <h4><i class="fa fa-fw fa-check"></i>Chart 0</h4>
                    </div>
                    <div class="panel-body">
                        <p>Chart</p></div>
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
                    </div>
                    <div class="panel-body">
                        <p>Chart</p></div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i>Users vs Events</h4>
                    </div>
                    <div class="panel-body">
                        <p>Chart</p></div>
                </div>
            </div>
            <hr>
        </div>
    </div>

    <%@include file ="footer.jsp" %>

</body>

</html>
