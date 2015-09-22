/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.io.IOException;
import java.sql.*;
import java.util.LinkedList;
import java.io.InputStream;
import javax.servlet.http.Part;

/**
 *
 * @author Andy
 */
public class AdminModel {
    
    public String user = "davidkenny";
    public String pass = "root1";
    
    public boolean addNewsStory(Part filepart,String newsContent) throws IOException
    {
        
        InputStream inputStream = null;
        
         if (filepart != null) {
            // prints out some information for debugging
            System.out.println(filepart.getName());
            System.out.println(filepart.getSize());
            System.out.println(filepart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filepart.getInputStream();
        }
        
        Connection con = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", user, pass);

            PreparedStatement ps = null;
            PreparedStatement addNewsStory = null;

            String InsertIntoNews = "INSERT INTO newsItem (story,image) VALUES (?,?)";
            addNewsStory = con.prepareStatement(InsertIntoNews);
            addNewsStory.setString(1, newsContent);
              if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                addNewsStory.setBlob(2, inputStream);
            }
            addNewsStory.executeUpdate();
            return true;
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
             System.out.println("expection thrown");
             System.out.println("false, exception");
             e.printStackTrace();
            return false;
        }
    }
}
