<%-- 
    Document   : newsStory
    Created on : 15-Sep-2015, 17:50:05
    Author     : Dave 
--%>

<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Entities.NewsEntity" %>
<!DOCTYPE html>
<html>

    <%@include file="header.jsp" %>
    
    <div class="banner"></div>
      <div class="container">

       <div class="row">
            <div class="col-lg-12">
                <h1>News Article</h1>
                <p></p>
            </div>
        </div>
   
           <%
            java.util.LinkedList<NewsEntity> news = (java.util.LinkedList<NewsEntity>) request.getAttribute("news");
            if (news.size()==0) {
        %>
        <p>No News found.</p>
        <%
        } else {   
                  Iterator<NewsEntity> iterator;
            iterator = news.iterator();
            while (iterator.hasNext()) {
                NewsEntity p = (NewsEntity) iterator.next();
         %>
        <div class="col-md-12" id="AboutText">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i><%=p.getTitle()%></h4>
                    </div>
                    <div class="panel-body">
                        <p>
                        <p><%=p.getContent()%></p>
                        
                             <% if (p.getLength()!=0){ %>                    
                            <img src="${pageContext.request.contextPath}/News/Picture/<%=p.getId()%>" style="max-height: 500px; max-width: 500px;" class="img-responsive" alt="News Image">
                            <%} %>
                        <a href="javascript:history.back()" class="btn btn-default">Back</a>
                    </div>
                </div>
            </div>
        <%}%>
                <%}%>
                
      </div>
    
  
    
    <%@include file ="footer.jsp" %>
    </body>
</html>