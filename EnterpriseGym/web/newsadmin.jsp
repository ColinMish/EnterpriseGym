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
     
    <script src="${pageContext.request.contextPath}/js/admin.js" type="text/javascript"></script>
    
     
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
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i><strong>News Admin Pannel</strong></h4><br>
                    </div>
                    <div class="panel-body">
                        <table class="table table-hover" id="datatable2">
                            <%
                            java.util.LinkedList<NewsEntity> news = (java.util.LinkedList<NewsEntity>) request.getAttribute("news");
                                 if (news == null) {
        %>
        <p>No News found.</p>
        <%
        } else { %>
                            <thead>
                            <tr>
                                <th>Article</th>
                                <th>Date Added</th>
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
                            <td><a role="button" href="${pageContext.request.contextPath}/News/Article/<%=p.getId()%>" class="btn btn-primary">View <span class="glyphicon glyphicon-search" aria-hidden="true"></span></button></td>
                            <td><a role="button" class="btn btn-Warning">Edit <span class="glyphicon glyphicon-cog" aria-hidden="true"></span></button></td>
                            <td><a role="button" onclick="deleteNews(<%=p.getId()%>)"class="btn btn-Danger">Delete <span class="glyphicon glyphicon-trash" aria-hidden="true"></span></button></td>              
                            
                        <%} %></tbody> <%}%>
                        </table>
                        </div>

       
                    </div>
                </div>  
         
         
         
         
     </div>
         
         
       

    
  
    
    
    <%@include file ="footer.jsp" %>
  </body>
</html>