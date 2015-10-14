package Models;

import java.sql.SQLException;
import java.io.EOFException;
import java.sql.*;

import java.util.*;
//import javax.mail.*;
//import javax.mail.internet.*;
import javax.activation.*;

/**
 *
 * @author Kim
 */
public class SendEmailModel {

     public String user = "root";
    public String pass = "davidkenny1";
    public String database ="jdbc:mysql://46.101.22.191:3306/Enterprise_Gym";

    public SendEmailModel() {

    }

    public boolean checkDB(String email) {

        boolean is_in_db = false;
        
        /* Connect to database */
        Connection con = null;

        try {
            /* Check if in database */
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection(database, user, pass);
            
            ResultSet r = null;
            PreparedStatement s = null;
            String q = "SELECT * FROM user WHERE email=?";            
            s = con.prepareCall(q);
            s.setString(1, email);
            s.executeUpdate();

           
            r = s.executeQuery();

            if (r.next()) {
                is_in_db = true;

              //  sendEmail(email);
            }

        } catch (Exception e) {
        }

        return is_in_db;
    }

    
    
    
//    public void sendEmail(String email) {
//
//
//        /* Send email */
//        String send_to = email;
//        String from = "test";
//        String host = "EnterpriseGym";
//
//        Properties prop = System.getProperties();
//        prop.setProperty("mail.smtp.host", host);
//
//        Session session = Session.getDefaultInstance(prop);
//
//        try {
//            /* Setting up the mail */
//            MimeMessage m = new MimeMessage(session);
//            m.setFrom(new InternetAddress(from));
//            m.addRecipient(Message.RecipientType.TO, new InternetAddress(send_to));
//            m.setSubject("Password reset requet");
//
//            m.setText("NEW TEMP PASSWORD");
//
//            /* Send the email */
//            Transport.send(m);
//        } catch (Exception e) {
//
//        }
//    }

}
