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
                RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("resetPass.jsp");
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {

        }
    }

    private boolean sendResetEmail(String token, String email) {

        String subject = "Enterprise Gym Password reset";
        //TODO: Change domain to actual server IP on live version
        String emailMessage = "Click the following link to reset your password: http://localhost:8080/Enterprise/confirmPasswordReset.jsp?token=" + token
                + ". If this was not you please login and change your password immediately";
        
        // <a href="..">text</a>
        boolean result;
        // Recipient's email ID needs to be mentioned.
        String to = email;

        // Sender's email ID needs to be mentioned
        String from = "dundeeenterprisegym@gmail.com";

        String host = "smtp.gmail.com";

        // Get system properties object
        System.setProperty("java.net.preferIPv4Stack", "true");
        Properties properties = System.getProperties();

        // Setup mail server
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.socketFactory.port", "587");
        properties.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.port", "587");

        // Get the default Session object.
        String pass = "mypassword1";
        String user = "dundeeenterprisegym@gmail.com";
      //  EnterpriseAuthentication a = new EnterpriseAuthentication(user, pass);

        Session mailSession = Session.getDefaultInstance(properties);

        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(mailSession);
            
            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO,
                    new InternetAddress(to));
            
            // Set Subject: header field
            message.setSubject(subject);
            
            // Now set the actual message
            message.setText(emailMessage, "UTF-8", "html");

            Transport transport = mailSession.getTransport("smtp");
            transport.connect(host, user, pass);
            
            
            // Send message
            transport.sendMessage(message, message.getAllRecipients());
            result = true;
            System.out.println("Mail sent");
            transport.close();
            UserModel updateUser = new UserModel();
            updateUser.setResetToken(email, token);

        } catch (MessagingException mex) {
            mex.printStackTrace();
            System.out.println("error: messaging exception");
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
