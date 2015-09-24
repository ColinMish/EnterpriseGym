/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;


import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import com.sun.corba.se.spi.protocol.RequestDispatcherDefault;
import java.io.IOException;
import java.sql.*;
import java.util.LinkedList;
import java.io.InputStream;
import static java.lang.System.out;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.Part;

/**
 *
 * @author Andy
 */
public class AdminModel {
    
    public String user = "davidkenny";
    public String pass = "root1";
    
     public static java.sql.Date getCurrentDate() {
        java.util.Date today = new java.util.Date();
        return new java.sql.Date(today.getTime());
    }
    
    public boolean addNewsStory(Part filepart,String newsContent,String title) throws IOException
    {
        
        InputStream inputStream = null;
        int length=0;
        String type=null;
        
         if (filepart != null) {
            // prints out some information for debugging
            System.out.println(filepart.getName());
            System.out.println(filepart.getSize());
            System.out.println(filepart.getContentType());
            length=(int) filepart.getSize();
            type = filepart.getContentType();
            // obtains input stream of the upload file
            inputStream = filepart.getInputStream();
        }
        
        Connection con = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", user, pass);

            PreparedStatement ps = null;
            PreparedStatement addNewsStory = null;

            String InsertIntoNews = "INSERT INTO newsItem (story,image,dateAdded,title,image_length,image_type) VALUES (?,?,?,?,?,?)";
            addNewsStory = con.prepareStatement(InsertIntoNews);
            addNewsStory.setString(1, newsContent);
              if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                addNewsStory.setBlob(2, inputStream);
                addNewsStory.setInt(5,length);
                addNewsStory.setString(6,type);
            }
              addNewsStory.setDate(3, getCurrentDate());
              addNewsStory.setString(4, title);
            addNewsStory.executeUpdate();
            return true;
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
             System.out.println("expection thrown");
             System.out.println("false, exception");
             e.printStackTrace();
            return false;
        }
    }
    
    public boolean resetPoints()
    {
        Connection con = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", user, pass);

            PreparedStatement ps = null;
            PreparedStatement resetPoints = null;

            String ResetAllPoints = "UPDATE user SET action_points=0, practice_points=0, virtual_points=0, project_points=0, theory_points=0";
            resetPoints = con.prepareStatement(ResetAllPoints);
            resetPoints.executeUpdate();
            return true;
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
             System.out.println("expection thrown");
             System.out.println("false, exception");
             e.printStackTrace();
            return false;
        }
    }
    
    public boolean deleteUser(String username)
    {
        Connection con = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", user, pass);

            PreparedStatement ps = null;
            PreparedStatement disableFKCheck = null;
            PreparedStatement deleteUser = null;
            PreparedStatement enableFKCheck = null;

            String DisableFKCheck = "SET FOREIGN_KEY_CHECKS=0";
            String DeleteUser = "DELETE a.*, u.* FROM account a INNER JOIN user u ON a.idaccount = u.account_idaccount WHERE a.username='" + username + "'";
            String EnableFKCheck = "SET FOREIGN_KEY_CHECKS=1";
            disableFKCheck = con.prepareStatement(DisableFKCheck);
            disableFKCheck.executeUpdate();
            deleteUser = con.prepareStatement(DeleteUser);
            deleteUser.executeUpdate();
            enableFKCheck = con.prepareStatement(EnableFKCheck);
            enableFKCheck.executeUpdate();
            return true;
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
             System.out.println("expection thrown");
             System.out.println("false, exception");
             e.printStackTrace();
            return false;
        }
    }
    
    public boolean printEvent(String event)
    {
        
        Connection con = null;
    try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", user, pass);

            PreparedStatement ps = null;
            PreparedStatement printEvent = null;
            PreparedStatement printUsers = null;

            
            String PrintEvent = "SELECT * FROM event_has_user WHERE event_idevent='" + event + "'";
            printEvent = con.prepareStatement(PrintEvent);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(PrintEvent);
            
            while(rs.next())
            {
              rs.getString("user_iduser");
                    String PrintUsers = "SELECT * FROM account WHERE user_iduser='" + rs + "'";
                    printUsers = con.prepareStatement(PrintUsers);
                    Statement stmttwo = con.createStatement();
                    ResultSet rstwo = stmttwo.executeQuery(PrintUsers);
            
                        while(rstwo.next())
                        {
                            List usersRegistered = new ArrayList();
                            usersRegistered.add(rstwo.getString("idaccount"));
                            usersRegistered.add(rstwo.getString("username"));
                            usersRegistered.add(rstwo.getString("date_joined"));
                            
                            
                        }
            }
            
            
            
          return true;
          
          
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
             System.out.println("expection thrown");
             System.out.println("false, exception");
             e.printStackTrace();
            return false;
        }
    }
    
        
}
