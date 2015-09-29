<%-- 
    Document   : eventStory
    Created on : Sep 22, 2015, 4:29:59 PM
    Author     : colin
--%>

<%@page import="Entities.EventEntity"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Entities.NewsEntity" %>
<!DOCTYPE html>
<html>

    <%@include file="header.jsp" %>
    
   
    
         <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <script src="http://code.jquery.com/jquery-1.9.1.js" type="text/javascript"></script>
        <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
        <script src="${pageContext.request.contextPath}/js/event.js" type="text/javascript"></script>  
        <script>var ctx = "${pageContext.request.contextPath}"</script>
    
    
    
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 id="modaltitle" class="modal-title">Delete</h4>
                </div>
                <div class="modal-body">
                    <p id="modalmessage">Are you sure you want to delete this event?</p>
                </div>
                <div class="modal-footer">
                    <button id="yes" type="button" onclick="leaveEvent()" class="btn btn-danger" data-dismiss="modal">Yes</button>  
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
                    <p id="modalmessage2">Message deleted.</p>

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
                    <h4 id="modaltitle3" class="modal-title">Failure</h4>
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
                <h1>Event</h1>
                <p></p>
            </div>
        </div>
   
           <%
            Boolean attending =(Boolean) request.getAttribute("attending");
            java.util.LinkedList<EventEntity> event = (java.util.LinkedList<EventEntity>) request.getAttribute("event");
            if (event.size()==0) {
        %>
        <p>No News found.</p>
        <%
        } else {   
                  Iterator<EventEntity> iterator;
            iterator = event.iterator();
            while (iterator.hasNext()) {
                EventEntity p = (EventEntity) iterator.next();
         %>
        <div class="col-md-12" id="AboutText">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i><%=p.getName()%></h4>
                    </div>
                    <div class="panel-body">
                        <p>
                        <p><%=p.getDescription()%></p>
                        
                             <% if (p.getLength()!=0){ %>   
                             <div class ="hidden-xs" >
                            <img src="${pageContext.request.contextPath}/Events/Picture/<%=p.getID()%>" style="max-height: 600px; max-width: 600px;" class="img-responsive" alt="News Image">
                             </div>
                             <div class="visible-xs">
                               <img src="${pageContext.request.contextPath}/Events/Picture/<%=p.getID()%>" style="max-height: 300px; max-width: 300px;" class="img-responsive" alt="News Image">  
                             </div>
                            <%} %>
                            
                            <%if (attending!=null){
                                if(attending==true)
                                { %>
                                <button class="btn btn-danger pull-right" onclick="checkDelete(<%=account.getId()%>,<%=p.getID()%>)" type="submit">Leave Event. <span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                                  
                               <% }else {%>
                            
                            <button class="btn btn-success pull-right" onclick="signUp(<%=account.getId()%>,<%=p.getID()%>)" type="submit">Sign Up. <span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>
                            
                            <%} }%>
                            
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
