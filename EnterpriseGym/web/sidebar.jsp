<%-- 
    Document   : sidebar
    Created on : Sep 15, 2015, 2:05:35 PM
    Author     : colin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<link href='${pageContext.request.contextPath}/css/social-sidebar.css' rel='stylesheet' type='text/css'>
        <title>JSP Page</title>
    </head>
    <body>
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav">
                    <li>
                        <a href="https://www.facebook.com/EnterpriseGym"><img src='${pageContext.request.contextPath}/Pictures/icon_fb_small.png'></a>
                    </li>
                    <li>
                        <a href="http://www.twitter.com/Enterprise_Gym"><img src='${pageContext.request.contextPath}/Pictures/TwitterIcon.png'></a>
                    </li>
                    <li>
                        <a href="http://www.linkedin.com/groups?mostPopular&gid=3278209"><img src='${pageContext.request.contextPath}/Pictures/linkedin-icon-small.png'></a>
                    </li>
                    <li>
                        <a href="http://www.youtube.com/EnterpriseGym"><img src='${pageContext.request.contextPath}/Pictures/youtube-icon-small.png'></a>
                    </li>
                </ul>
            </div>
    </body>
</html>
