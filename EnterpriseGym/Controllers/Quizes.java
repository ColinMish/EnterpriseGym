/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Entities.QuizEntity;
import Entities.QuizQuestionEntity;
import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kristiyangeorgiev
 */
@WebServlet(name = "Quizes", urlPatterns = {"/Quizes/*"})
@MultipartConfig
public class Quizes extends HttpServlet {

    private HashMap quizzes;

    /**
     * Constructor
     */
    public Quizes() {
        this.quizzes = new HashMap();
        for (int quiz = 1; quiz < 12; quiz++)//create some news stories, will be from the database eventually
        {
            LinkedList questions = new LinkedList();
            for (int question = 1; question < 11; question++) {
                String[] answers = new String[4];
                for (int i = 0; i < 4; i++) {
                    String answer = "answer " + (i + 1);
                    answers[i] = answer;
                }
                QuizQuestionEntity myQuestion = new QuizQuestionEntity("question " + question, question, answers, 1);
                questions.add(myQuestion);
            }
            QuizEntity myQuiz = new QuizEntity("Online Theory - Quiz " + quiz, questions, 10);
            quizzes.put(myQuiz.getQuizTitle(), myQuiz);
        }
    }

    /**
     *
     * @param config
     * @throws ServletException
     */
    @Override
    public void init(ServletConfig config) throws ServletException {
    }

    /**
     * Method to get the account details for display
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String a = request.getRequestURI();
        if (a == null) {
            throw new IOException();
        }
        String[] parts = a.split("/");
        if (parts.length < 4) {
            request.setAttribute("quizzes", quizzes);
            RequestDispatcher dispatcher = request.getRequestDispatcher("quizes.jsp");
            dispatcher.forward(request, response);
        } else {
            String key = parts[3].replace("%20", " ");
            QuizEntity quiz = (QuizEntity) quizzes.get(key);
            request.setAttribute("quiz", quiz);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/quiz.jsp");
            dispatcher.forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String a = null;
        String[] myJsonData = request.getParameterValues("answers");
        for (int i = 0; i < myJsonData.length; ++i) {
            System.out.println(myJsonData[i] + " --<br>");
        }
    }
}
