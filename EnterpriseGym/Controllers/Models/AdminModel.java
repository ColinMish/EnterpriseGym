/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.sql.*;
import java.util.LinkedList;

/**
 *
 * @author Andy
 */
public class AdminModel {
    
    public String user = "davidkenny";
    public String pass = "root1";
    
    public boolean addNewsStory(String newsContent)
    {
        Connection con = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", user, pass);

            PreparedStatement ps = null;
            PreparedStatement addNewsStory = null;

            String InsertIntoNews = "INSERT INTO newsItem (story) VALUES (?)";
            addNewsStory = con.prepareStatement(InsertIntoNews);
            addNewsStory.setString(1, newsContent);
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
            //resetPoints.setString();
            resetPoints.executeUpdate();
            return true;
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
             System.out.println("expection thrown");
             System.out.println("false, exception");
             e.printStackTrace();
            return false;
        }
    }
}
