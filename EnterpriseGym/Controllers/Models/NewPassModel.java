/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Kim
 */
public class NewPassModel {
    public String user = "davidkenny";
    public String pass = "root1";

    public NewPassModel() {

    }

    public void resetPass(String email, String newPass) {
             /* Connect to database */
        Connection con = null;

        try {
            /* Check if in database */
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym",user,pass);

            String q = "SELECT user FROM Enterprise_Gym WHERE email=?";

            PreparedStatement s = null;
            s = con.prepareCall(q);
            s.setString(1, email);

            ResultSet r = null;
            r = s.executeQuery();

            /* If email found */
            if (r.next()) {                
                /* Reset password */
                String updatePass = "UPDATE account SET password=? WHERE idaccount=(select account_idaccount FROM user WHERE email=?";
                
                PreparedStatement ps = null;
                ps = con.prepareCall(updatePass);
                ps.setString(1, newPass);
                ps.setString(2, email);
                
                ps.execute();
                
                con.close();
            }

        } catch (Exception e) {  }
    }
}
