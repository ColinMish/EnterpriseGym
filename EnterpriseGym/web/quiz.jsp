<%-- 
    Document   : quiz
    Created on : 17-Sep-2015, 11:50:51
    Author     : Dave
--%>
<%@page import="java.util.LinkedList"%>
<%@page import="Entities.QuizQuestionEntity"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Entities.QuizEntity" %>
<!DOCTYPE html>
<html>
    <head>

    </head>
       <%@include file="header.jsp" %>
    
    
    <script src="${pageContext.request.contextPath}/js/quiz.js"></script>
    <% QuizEntity quiz = (QuizEntity) request.getAttribute("quiz");%>
    <!--Content-->
    <div class="banner"></div>
    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <h1 id="MainTitle">Theory</h1>
                <p></p>
            </div>
        </div>

        <!--Modal -->
        <div id="myModal" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" id="modalHeader"></h4>
                    </div>
                    <div class="modal-body">
                        <p id="modalText"></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-8" id="ConnectText">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h4 id="quizTitle"><i class="fa fa-fw fa-check"></i><strong><%=quiz.getQuizTitle()%></strong></h4><br>
                </div>
                <div class="panel-body">
                    <%LinkedList<QuizQuestionEntity> questions = (LinkedList) quiz.getQuestions();%>
                    <%="<form id=\"quizForm\">"%>
                    <%for (int i = 0; i < questions.size(); i++) {%>
                    <%="<div class=\"question" + (i + 1) + "\">"%>
                    <%="<h3>" + questions.get(i).getQuestion() + "</h3>"%>
                    <%for (int j = 0; j < 4; j++) {%>
                    <%="<input type=\"radio\" class=\"q" + (i + 1) + "\" id=\"" + (j + 1) + "\" name=\"Q" + (i + 1) + "\"/>"%>
                    <%="<label id=\"A" + (j + 1) + "\">" + questions.get(i).getAnswer(j) + "</label><br>"%>
                    <%}%>
                    <%="</div>"%>
                    <%}%>
                    <br>
                    <input id="submitButton" type="submit" value="Check answers" class="btn-style">
                    </form>
                </div>
            </div>
        </div>
    </div>

    <%@include file ="footer.jsp" %>
</body>
</html>