<%-- 
    Document   : 404
    Created on : Sep 22, 2015, 9:59:57 PM
    Author     : davidkenny
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      
    <body>
    <%@include file="header.jsp" %>

    
    <!-- Page Content -->
    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <h1>404</h1>
                <p></p>
            </div>
        </div>
                
 
                                         
        <div class="col-md-12" id="AboutText">
                <div class="panel panel-default panelmobile">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i>Page Not Found</h4>
                    </div>
                    <div class="panel-body">
                     The requested page cannot be found. It may have been moved. 
                    </div>
                     <p><b>Error code:</b> ${pageContext.errorData.statusCode}</p>
    <p><b>Request URI:</b> ${pageContext.request.scheme}://${header.host}${pageContext.errorData.requestURI}</p>
                </div>
            </div>
        
    </div>
    
    <%@include file ="footer.jsp" %>
    </body>
</html>

