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
import java.util.Properties;
import java.util.UUID;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
        RequestDispatcher dispatcher;
        String[] parts = Convertors.SplitRequestPath(request);
        if (parts.length == 4 && parts[2].equals("Temp")) {
            UserModel user = new UserModel();
            UserEntity tempUser = (UserEntity) user.getUserByAccount(Integer.parseInt(parts[3]));
            tempUser.setAccountNo(Integer.parseInt(parts[3]));
            request.setAttribute("tempAccount", tempUser);
        }
        dispatcher = request.getRequestDispatcher("/register.jsp");
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
        String end = parts[parts.length - 1];
        switch (end) {
            case "SignUp":
                registerNewUser(request, response);
                break;
            case "CheckUsername":
                checkUsername(request, response);
                break;
            case "Temp":
                registerTempAccount(request, response);
                break;
                    
        }
    }

    private void registerNewUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        byte[] salt = Security.generateSalt();
        String accountNumber = request.getParameter("oldAccountNo");
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
                request.setAttribute("registered", Boolean.FALSE);
            } else {
                //Log the new user into the system here. 
                request.setAttribute("registered", Boolean.TRUE);

                if (accountNumber != null && !accountNumber.equals("")) {
                    int accountNo = Integer.parseInt(accountNumber);
                    String oldUsername = user.getUsernameFromAccountId(accountNo);
                    //get points
                    UserEntity newUser = user.getPoints(oldUsername);
                    newUser.setAccountNo(accountNo);
                    //add to account
                    user.addPoints(newUser);
                }
                String redirectURL = request.getContextPath() + "/logIn.jsp";
                response.sendRedirect(redirectURL);
            }
        } catch (IOException | IllegalArgumentException e) {
            //At this point you need to tell the user that the passwords don't match
            System.out.println("expection thrown");
            request.setAttribute("registered", Boolean.FALSE);
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
        System.out.println("hello");
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
            emailAccountInformationToUser(email, username, guid);
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

        String subject = "Enterprise Gym Account Created";
        //TODO: Change domain to actual server IP on live version
        String emailMessage = "Your temporary account has been created with the following details:"
                + " Username: " + username
                + " Password: " + password
                + " Please log in to complete the registration process and reset your password.";
        
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

        } catch (MessagingException mex) {
            mex.printStackTrace();
            System.out.println("error: messaging exception");
            result = false;
        }
    }
}
