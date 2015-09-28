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

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="http://code.jquery.com/jquery-1.9.1.js" type="text/javascript"></script>
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script>var ctx = "${pageContext.request.contextPath}"</script>
</head>
<body>


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
                    <h4><i class="fa fa-fw fa-check"></i><strong>Leaderboard</strong></h4><br>
                </div>
                <div class="panel-body">
                    <%
                        java.util.LinkedList<UserEntity> user = (java.util.LinkedList<UserEntity>) request.getAttribute("users");
                        if (user.size() == 0) {
                    %>
                    <p>No News found.</p>
                    <%
                    } else { %>
                    <table class="table table-hover" id="datatable2">
                        <thead>
                            <tr>
                                <th>Position</th>
                                <th>Last Name</th>
                                <th>Name</th>
                                <th>Total points </th>
                            </tr>
                        </thead>
                        <tbody>
                            <%

                                Iterator<UserEntity> iterator;
                                iterator = user.iterator();
                                int i=1;
                                while (iterator.hasNext()) {
                                    UserEntity p = (UserEntity) iterator.next();
                            %>       

                            <tr>
                                <td><%=i%></td>
                                <td><%=p.getLastname()%></td>
                                <td><%=p.getName()%></td>
                                <td><%=p.getTotalPoints()%></td>
                            <% i++; } %></tbody> <%}%>
                    </table>
                </div>
            </div>
        </div>  
    </div>








    <%@include file ="footer.jsp" %>
</body>
</html>
