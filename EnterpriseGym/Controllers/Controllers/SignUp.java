package Controllers;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Models.UserModel;
import java.io.PrintWriter;
import lib.Convertors;

/**
 *
 * @author Dave
 */
@WebServlet(name = "SignUp", urlPatterns = {"/SignUp", "/CheckUsername"})
@MultipartConfig
public class SignUp extends HttpServlet {

    /**
     * Constructor
     */
    public SignUp() {
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
    }

    /**
     * *
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("Register.jsp");
        dispatcher.forward(request, response);
    }

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        String[] parts = Convertors.SplitRequestPath(request);
        switch (parts[1]) {
            case "SignUp":
                registerNewUser(request, response);
                break;
            case "CheckUsername":
                checkUsername(request, response);
                break;
        }
    }

    private void registerNewUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String passwordcheck = request.getParameter("passwordcheck");
        String email = request.getParameter("email");
        String first = request.getParameter("first");
        String last = request.getParameter("last");
        String gender = request.getParameter("gender");
        String country = request.getParameter("country");
        String university = request.getParameter("university");
        String school = request.getParameter("school");
        String subject = request.getParameter("subject");
        //String yearofstudy = request.getParameter("year");
        int yearofstudy = Integer.parseInt(request.getParameter("year"));
        //System.out.println("The year of study"+yearofstudy);
        int matric = Integer.parseInt(request.getParameter("matric"));
        //String matric = request.getParameter("matric");

        UserModel user = new UserModel();

        try {
            if (password.equals(passwordcheck)) {
                System.out.println("passwords match");
                if (user.register(username, Convertors.toSHA1(password.getBytes("UTF-8")), email, first, last, gender, country, university, school, subject, yearofstudy, matric) == false) {
                    RequestDispatcher dispatcher = request.getRequestDispatcher("LogInFailed.jsp");
                    dispatcher.forward(request, response);
                } else {
                    //Log the new user into the system here. 
                    request.setAttribute("registered", true);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("logIn.jsp");
                    dispatcher.forward(request, response);
                }

            } else {
                throw new IllegalArgumentException("The passwords don't match");
            }
        } catch (IOException | ServletException | IllegalArgumentException e) {
            //At this point you need to tell the user that the passwords don't match
            System.out.println("expection thrown");
            //Reditect to the failed registration page.
            HttpSession session = request.getSession();
            session.setAttribute("error", "The passwords don't match.");
            System.out.println("false, exception");
            response.sendRedirect(request.getContextPath() + "/FailedSignUp.jsp");
        }
    }

    private void checkUsername(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String userName = request.getParameter("username");
        UserModel user = new UserModel();
        Boolean a = user.checkUserExists(userName);
        System.out.println("Controller " + a);
        try (PrintWriter out = response.getWriter()) {
            out.print(a);
            out.flush();
            out.close();
        }
    }
}
