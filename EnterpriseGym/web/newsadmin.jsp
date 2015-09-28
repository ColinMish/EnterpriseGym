<%-- 
    Document   : newsadmin
    Created on : Sep 23, 2015, 1:01:40 PM
    Author     : davidkenny
--%>

<%@page import="Entities.NewsEntity"%>
<%@page import="java.util.Iterator"%>
<%@page import="Entities.UserEntity"%>
<html>

    <%@include file="header.jsp" %>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="http://code.jquery.com/jquery-1.9.1.js" type="text/javascript"></script>
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/admin.js" type="text/javascript"></script>


</head>
<body>

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
                    <p id="modalmessage">Are you sure you want to delete this story?</p>

                </div>
                <div class="modal-footer">
                    <button id="yes" type="button" onclick="deleteNews()" class="btn btn-Danger" data-dismiss="modal">Yes</button>  
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
                    <p id="modalmessage">Message deleted.</p>

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
                    <h4 id="modaltitle3" class="modal-title">Success</h4>
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
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4><i class="fa fa-fw fa-check"></i><strong>News Admin Panel</strong></h4><br>
                </div>
                <div class="panel-body">
                    <table class="table table-hover" id="datatable2">
                        <%
                            java.util.LinkedList<NewsEntity> news = (java.util.LinkedList<NewsEntity>) request.getAttribute("news");
                            if (news.size() == 0) {
                        %>
                        <p>No News found.</p>
                        <%
                        } else { %>
                        <thead>
                            <tr>
                                <th>Article</th>
                                <th>View Article</th>
                                <th>Edit Article</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%

                                Iterator<NewsEntity> iterator;
                                iterator = news.iterator();
                                while (iterator.hasNext()) {
                                    NewsEntity p = (NewsEntity) iterator.next();
                            %>       
                            <tr>
                                <td><%=p.getTitle()%></td>
                                <td><% if(p.getDate() != null) {p.getDate();} %></td>
                                <td><a role="button" href="${pageContext.request.contextPath}/News/Article/<%=p.getId()%>" class="btn btn-primary">View <span class="glyphicon glyphicon-search" aria-hidden="true"></span></button></td>
                                <td><a role="button" href="${pageContext.request.contextPath}/Admin/News/<%=p.getId()%>" class="btn btn-Warning">Edit <span class="glyphicon glyphicon-cog" aria-hidden="true"></span></button></td>
                                <%if (account.hasAccessLevel(7)) {%>
                                <td><a role="button" onclick="checkDelete(<%=p.getId()%>, '<%=p.getTitle()%>')" class="btn btn-Danger">Delete <span class="glyphicon glyphicon-trash" aria-hidden="true"></span></button></td>              
                                <%
                                    }
                                    }
                                %></tbody> 
                            <%
                            }
                            %>
                    </table>
                    <a href="javascript:history.back()" class="btn btn-danger">Back</a>
                </div>
            </div>
        </div>  
    </div>
    <%@include file ="footer.jsp" %>
</body>
</html>