package Controllers;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.io.EOFException;
import java.sql.*;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;


    /* 
    username: davidkenny
    password: root1
    Hostname:160.153.16.42
    */

/**
 *
 * @author Kim
 */

@WebServlet(name = "ForgottenPassword", urlPatterns = {"/ForgottenPassword"})
@MultipartConfig
public class ForgottenPassword extends HttpServlet {
    
    public String user = "davidkenny";
    public String pass = "root1"; 

    public ForgottenPassword(){
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        /* Get email address */
        String email = request.getParameter("email_address");
        
        /* Connect to database */
        Connection con = null;
        
        try{
        
        /* Check if in database */
            Class.forName("com.mysql.jdbc.Driver").newInstance();
	    con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", user, pass);
	    
            
            String q = "SELECT user FROM Enterprise_Gym WHERE email=?";
            
            PreparedStatement s = null;
            s = con.prepareCall(q);
            s.setString(1, email);
            
            ResultSet r = null;
            r = s.executeQuery();
            
            if(r.next()){
                /* Get link to reset password */
               
                
                /* Send email */   
                String send_to = email;
                String from = "test";
                String host = "EnterpriseGym";
                
                Properties prop = System.getProperties();
                prop.setProperty("mail.smtp.host", host);
                
                Session session = Session.getDefaultInstance(prop);
                
                try{
                    /* Setting up the mail */
                    MimeMessage m = new MimeMessage(session);
                    m.setFrom(new InternetAddress(from));
                    m.addRecipient(Message.RecipientType.TO, new InternetAddress(send_to));
                    m.setSubject("Password reset requet");
                    
                    m.setText("NEW TEMP PASSWORD");
                    
                    /* Send the email */
                    Transport.send(m);                    
                    
                } catch (Exception e) {}
                
            }
            
            /* Go back to login page */
            con.close();
            response.sendRedirect(request.getContextPath()+"/LogIn.jsp");

                    
        } catch (Exception e){}
        

        
    }
    
    
    

    
    
    
}
