package Controllers;

import Models.UserModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.UUID;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lib.Convertors;

/**
 *
 * @author Kim
 */
@WebServlet(name = "ResetPassword", urlPatterns = {"/ResetPassword", "/CheckPassword"})

@MultipartConfig
public class ResetPassword extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("resetPass.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String[] parts = Convertors.SplitRequestPath(request);
        switch (parts[1]) {
            case "ResetPassword":
                resetPassword(request, response);
                break;
            case "CheckPassword":
                checkPassword(request, response);
                break;
        }

    }

    private void resetPassword(HttpServletRequest request, HttpServletResponse response) {
        /* Get details */
        try {
            String email = request.getParameter("email");
            String guid = UUID.randomUUID().toString();
            guid = guid.replaceAll("-", "");
            boolean success = sendResetEmail(guid, email);
            if (success) {
                //reset password in database
            }
//        NewPassModel reset = new NewPassModel();
//
//        if (pass1.equals(pass2)) {
//
//            /* Encrypt password */
//            String pass = Security.toSHA2(pass1.getBytes("UTF-8"));
//
//            reset.resetPass(e, pass);
//
//            response.sendRedirect(request.getContextPath() + "/LogIn.jsp");
//
//        } else {
//            response.sendRedirect(request.getContextPath() + "/resetPass.jsp");
//        }
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {

        }
    }

    private boolean sendResetEmail(String newPassword, String email) {
        String subject = "Enterprise Gym Password reset";
        String emailMessage = "Your account password has been reset to " + newPassword
                + ". If this was not you please login and change your password immediately";
        boolean result;
        // Recipient's email ID needs to be mentioned.
        String to = email;

        // Sender's email ID needs to be mentioned
        String from = "dundeeenterprisegym@gmail.com";

        // Assuming you are sending email from localhost
        String host = "localhost";

        // Get system properties object
        System.setProperty("java.net.preferIPv4Stack" , "true");
        Properties properties = System.getProperties();

        // Setup mail server
        properties.setProperty("mail.smtp.host", host);

        // Get the default Session object.
        Session mailSession = Session.getDefaultInstance(properties);

        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(mailSession);
            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));
            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO,
                    new InternetAddress(to));
            // Set Subject: header field
            message.setSubject(subject);
            // Now set the actual message
            message.setText(emailMessage);
            // Send message
            Transport.send(message);
            result = true;
        } catch (MessagingException mex) {
            mex.printStackTrace();
            result = false;
        }
        return result;
    }

    private void checkPassword(HttpServletRequest request, HttpServletResponse response) {
        boolean validEmail = false;
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        UserModel userModel = new UserModel();
        String userEmail = userModel.getEmailbyUsername(username);
        if (userEmail != null && userEmail.equals(email)) {
            validEmail = true;
        }
        try (PrintWriter out = response.getWriter()) {
            out.print(validEmail);
            out.flush();
            out.close();
        } catch (Exception e) {

        }
    }
}