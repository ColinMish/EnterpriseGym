<%-- 
    Document   : newsEdit
    Created on : Sep 23, 2015, 7:47:19 PM
    Author     : davidkenny
--%>

<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Entities.NewsEntity" %>
<!DOCTYPE html>
<html>
    <link href='css/carousel.css' rel='stylesheet' type='text/css'>
    <link href='css/media.css' rel='stylesheet' type='text/css'>
    <%@include file="header.jsp" %>
   <div class="banner"></div>
      <div class="container">

       <div class="row">
            <div class="col-lg-12">
                <h1></h1>
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
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i>Edit article</h4>
                    </div>
                    <div class="panel-body">
                          <form action="${pageContext.request.contextPath}/News/NewsUpdate" method="POST" enctype="multipart/form-data">
                        
                              <div class="form-group">
                        <label for="title">Title:</label>
                        <input name="title" type="text" class="form-control" id="title" maxlength="45" value="<%=p.getTitle()%>" required/>
                        </div>
                        
                        <input name="id" type="text" class="form-control hidden" id="title" maxlength="45" value="<%=p.getId()%>" required/>
                        
                        <label for="editor1">Content:</label>
                        <textarea name="editor1" id="editor1" rows="10" cols="80"><%=p.getContent()%></textarea>
                        <script>
                            CKEDITOR.replace('editor1');
                        </script>
                        <br/>
                        <% if (p.getLength()!=0){ %>  
                              <label for="picture">Current Picture:</label>
                            <img id="picture" src="${pageContext.request.contextPath}/News/Picture/<%=p.getId()%>" style="max-height: 500px; max-width: 500px;" class="img-responsive" alt="News Image">
                            <%} %>
                            <br/>
                            <label for="newimage">New Image:</label>    
                        <span class="btn btn-default btn-file">
                        <input id ="newimage" name="image" multiple accept='image/*' type="file">
                        </span>
                        <br/>
                        <br/>
                      
                        <button class="btn btn-info pull-right" type="submit">Update News <span class="glyphicon glyphicon-upload" aria-hidden="true"></span></button>
                    </form>
                        
                       
                             
                        </p>
                    </div>
                </div>
            </div>
        <%}%>
                <%}%>
                
      </div>
    
  
    
    <%@include file ="footer.jsp" %>
    </body>
</html>
