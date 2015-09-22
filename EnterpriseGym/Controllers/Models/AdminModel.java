/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.sql.*;
import lib.Tuple;
import java.util.LinkedList;
/**
 *
 * @author Andy
 */
public class AdminModel {

    public String user = "davidkenny";
    public String pass = "root1";

    public boolean addNewsStory(String newsContent) {
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

    public boolean resetPoints() {
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

    public LinkedList getColumnNames(String tableName) {
        Connection con = null;
        LinkedList tableColumns = new LinkedList();
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", user, pass);

            PreparedStatement ps = null;
            PreparedStatement resetPoints = null;

            String getColumnNames = "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA =? AND TABLE_NAME =?";

            resetPoints = con.prepareStatement(getColumnNames);
            resetPoints.setString(1, "Enterprise_Gym");
            resetPoints.setString(2, tableName);
            ResultSet rs = resetPoints.executeQuery();
            while (rs.next()) {
                tableColumns.add(rs.getString("COLUMN_NAME"));
            }
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
            System.out.println("expection thrown");
            System.out.println("false, exception");
        }
        return tableColumns;
    }

    public LinkedList getDatabyFieldAsPercent(String field, String table) {
        Connection con = null;
        LinkedList results = new LinkedList();
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", user, pass);

            PreparedStatement ps = null;
            PreparedStatement resetPoints = null;

            String getColumnNames = "SELECT ?, count(*) as 'Count' FROM ? GROUP BY ?";

            resetPoints = con.prepareStatement(getColumnNames);
            resetPoints.setString(1, field);
            resetPoints.setString(2, table);
            resetPoints.setString(2, field);
            ResultSet rs = resetPoints.executeQuery();
            while (rs.next()) {
                Tuple item = new Tuple(rs.getString(field), rs.getInt("Count"));
                results.add(item);
            }
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
            System.out.println("expection thrown");
            System.out.println("false, exception");
        }
        return results;
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
}
