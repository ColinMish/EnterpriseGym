<%-- 
    Document   : header
    Created on : 15-Sep-2015, 12:44:38
    Author     : Dave
--%>
<html>


    <%@page import="Entities.Account"%>
    <head>

        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />

        <title>Enterprise Gym</title>

        <!-- Bootstrap Core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
   
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">

        <!--ICON-->
        <link rel="icon" href="${pageContext.request.contextPath}/Pictures/favicon.ico" type="image/x-icon" />

        <!-- Country Drop-down CSS -->
        <link href="${pageContext.request.contextPath}/css/flags.css" rel="stylesheet">

        <script src="${pageContext.request.contextPath}/js/jquery.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src='https://www.google.com/recaptcha/api.js'></script>
        <script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
        <script src="${pageContext.request.contextPath}/js/Moment.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.js"></script>


        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <%
        Boolean loggedIn = false;
        Account account = (Account) session.getAttribute("account");;
        if (account != null) {
            loggedIn = true;
        }
    %>

    <body>

        <!-- Navigation -->
        <div class="navigation-bar">
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">

                <div class="container">              
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">

                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">                       
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand visible-xs" href="${pageContext.request.contextPath}/Home"><img src="${pageContext.request.contextPath}/Pictures/logo-eg.png"></a>
                    </div>


                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            
                            <li class="visible-sm homeButton${pageContext.request.getServletPath() eq '/index.jsp' ? ' active' : ''}">
                                <a id="head" href="${pageContext.request.contextPath}/Home"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a>
                            </li>

                            <li class="hidden-xs hidden-sm homeButton${pageContext.request.getServletPath() eq '/index.jsp' ? ' active' : ''}">
                                <a id="imagehead" href="${pageContext.request.contextPath}/Home"><img src="${pageContext.request.contextPath}/Pictures/logo-eg.png"></a>
                            </li>
                            <li class="aboutButton${pageContext.request.getServletPath() eq '/about.jsp' ? ' active' : ''}">
                                <a id="head" href="${pageContext.request.contextPath}/About">About</a>
                            </li>
                            <li class="eventsButton${pageContext.request.getServletPath() eq '/events.jsp' ? ' active' : ''}">
                                <a id="head" href="${pageContext.request.contextPath}/Events">Events</a>
                            </li>
                            <li class="newsButton${pageContext.request.getServletPath() eq '/news.jsp' ? ' active' : ''}">
                                <a id="head" href="${pageContext.request.contextPath}/News">News</a>
                            </li>       
                            <li class="activitesButton${pageContext.request.getServletPath()eq '/activities.jsp' ? ' active' : ''}">
                                <a id="head" href="${pageContext.request.contextPath}/Activities">Activities</a>
                            </li>
                            <%if (loggedIn) {%>
                            <li class="dropdown">
                                <a href="" id="head" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">My eGym <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="${pageContext.request.contextPath}/Profile">Profile</a></li>
                                    <li><a href="${pageContext.request.contextPath}/Profile/Points">Points</a></li>
                                    <li><a href="${pageContext.request.contextPath}/Quizes">Online Tests</a></li>
                                    <li><a href="${pageContext.request.contextPath}/EditProfile/<%=account.getUsername()%>">Edit Profile</a></li>
                                    <li><a href="${pageContext.request.contextPath}/Profile/Events">My Events</a></li>
                                </ul>

                            </li>
                            <% if (account.hasAccessLevel(1)) { %>
                            <li><a id="head" href="${pageContext.request.contextPath}/Admin">Admin</a></li>
                                <%}%>


                        </ul>

                        <ul class="nav navbar-nav navbar-right">        
                            <li id="head" class="logintext hidden-sm"> Logged in as: <%=account.getUsername()%></li>
                            <li>
                                <a id="head" href="${pageContext.request.contextPath}/LogOut">Log Out</a></li>                  

                        </ul>

                        <%} else {%>
                        </ul>

                        <ul class="nav navbar-nav navbar-right">         
                            <li><a id="head" href="${pageContext.request.contextPath}/LogIn">Log In</a></li>
                            <li><a id="head" href="${pageContext.request.contextPath}/SignUp">Sign Up</a></li>

                        </ul>
                        <%}%>
                    </div>

                    <!-- /.navbar-collapse -->
                </div>

                <!-- /.container -->
            </nav>
        </div>
        


        <!-- Half Page Image Background Carousel Header -->

        

                        
         <div id="headerContent"><img src="${pageContext.request.contextPath}/Pictures/teglogo.png" style="max-height: 70px; max-width: 120px;" class="img-responsive center-block" alt="News Image"></div>  

<!--            <header class="hidden-lg hidden-md hidden-sm"> 
                <div style="height:60px"></div>
            </header>-->


         
        
    </body>
</html>

