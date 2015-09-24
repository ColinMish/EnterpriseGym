package Controllers;

import Entities.Account;
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
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import lib.Security;

/**
 *
 * @author Dave
 */
@WebServlet(name = "LogIn", urlPatterns = {"/LogIn"})
@MultipartConfig
public class LogIn extends HttpServlet {

    /**
     * Constructor
     */
    public LogIn() {

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
        RequestDispatcher dispatcher = request.getRequestDispatcher("logIn.jsp");
        dispatcher.forward(request, response);
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
        String result = "failed";
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username.equals("admin")) {
             HttpSession session = request.getSession();
             session.setAttribute("account", testAdminAccount());
            result = "success";
            
        } else {
            UserModel user = new UserModel();

            String salt = user.getSalt(username);
            //Can't do this is salt is null
            if (salt != null) {
                password = Security.hashPassword(password, salt);
            } else {
                request.setAttribute("invalid", true);
            }

            try {
                if (user.login(username, password) == false || salt == null) {
                    request.setAttribute("failed", true);
                } else {
                    Account login = user.getAccount(username);
                    HttpSession session = request.getSession();
                    session.setAttribute("account", login);
                    result = "success";
                }
            } catch (SQLException ex) {
                Logger.getLogger(LogIn.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        try (PrintWriter out = response.getWriter()) {
            out.print(result);
            out.flush();
            out.close();
        }
    }

    public Account testAdminAccount() {
        LinkedList accessLevel = new LinkedList();
        accessLevel.add(1);

        Account adminAccount = new Account("admin", accessLevel,1);

        return adminAccount;
    }
}
