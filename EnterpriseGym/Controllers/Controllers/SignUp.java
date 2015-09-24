package Controllers;

import Entities.UserEntity;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Models.UserModel;
import java.io.PrintWriter;
import java.util.UUID;
import lib.Convertors;
import lib.Security;

/**
 *
 * @author Dave
 */
@WebServlet(name = "SignUp", urlPatterns = {"/SignUp/*", "/CheckUsername"})
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

        String[] parts = Convertors.SplitRequestPath(request);
        if (parts.length == 4 && parts[2].equals("Temp")) {
            UserModel user = new UserModel();
            UserEntity tempUser = (UserEntity) user.getUserByAccount(Integer.parseInt(parts[3]));
            request.setAttribute("tempAccount", tempUser);
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
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
                if (parts.length == 2) {
                    registerNewUser(request, response);
                } else if (parts.length == 3 && parts[2].equals("Temp")) {
                    registerTempAccount(request, response);
                }
                break;
            case "CheckUsername":
                checkUsername(request, response);
                break;
        }
    }

    private void registerNewUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        byte[] salt = Security.generateSalt();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String first = request.getParameter("first");
        String last = request.getParameter("last");
        String gender = request.getParameter("gender");
        String country = request.getParameter("country");
        String university = request.getParameter("university");
        String school = request.getParameter("school");
        String subject = request.getParameter("subject");
        int yearofstudy = Integer.parseInt(request.getParameter("year"));
        int matric = Integer.parseInt(request.getParameter("matric"));
        String saltAsString = Convertors.byteArrayToHexString(salt);
        password = Security.hashPassword(password, saltAsString);
        UserModel user = new UserModel();

        try {
            if (user.register(username, password, email, first, last, gender, country, university, school, subject, yearofstudy, matric, saltAsString) == false) {
                request.setAttribute("registered", false);
            } else {
                //Log the new user into the system here. 
                request.setAttribute("registered", true);
                RequestDispatcher dispatcher = request.getRequestDispatcher("logIn.jsp");
                dispatcher.forward(request, response);
            }
        } catch (IOException | ServletException | IllegalArgumentException e) {
            //At this point you need to tell the user that the passwords don't match
            System.out.println("expection thrown");
            request.setAttribute("registered", false);
        }
    }

    private void checkUsername(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String userName = request.getParameter("username");
        UserModel user = new UserModel();
        try (PrintWriter out = response.getWriter()) {
            out.print(user.checkUserExists(userName));
            out.flush();
            out.close();
        }
    }

    private void registerTempAccount(HttpServletRequest request, HttpServletResponse response) {
        UserModel user = new UserModel();
        boolean success = false;
        byte[] salt = Security.generateSalt();
        String saltAsString = Convertors.byteArrayToHexString(salt);
        String guid = UUID.randomUUID().toString();
        guid = guid.replaceAll("-", "");

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String username = firstName + lastName;
        try {
            String password = Security.hashPassword(guid, saltAsString);
            success = user.createTempAccount(username, password, saltAsString, firstName, lastName, email);
            emailAccountInformationToUser(email, username, password);
        } catch (Exception e) {
        }
        try (PrintWriter out = response.getWriter()) {
            out.print(success);
            out.flush();
            out.close();
        } catch (Exception ex) {

        }
    }

    private void emailAccountInformationToUser(String email, String username, String password) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
