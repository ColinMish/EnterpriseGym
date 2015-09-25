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
import java.util.ArrayList;
import javax.servlet.http.Part;
import lib.JsonHighChartConvertor;

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

    public boolean addNewsStory(Part filepart, String newsContent, String title) throws IOException {

        InputStream inputStream = null;
        int length = 0;
        String type = null;

        if (filepart != null) {
            // prints out some information for debugging
            System.out.println(filepart.getName());
            System.out.println(filepart.getSize());
            System.out.println(filepart.getContentType());
            length = (int) filepart.getSize();
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
                addNewsStory.setInt(5, length);
                addNewsStory.setString(6, type);
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
                if (!rs.getString("COLUMN_NAME").contains("image")) {
                    tableColumns.add(rs.getString("COLUMN_NAME"));
                }
            }
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
            System.out.println("expection thrown");
            System.out.println("false, exception");
        }
        return tableColumns;
    }

    public ArrayList getDatabyFieldAsPercent(String field, String table) {
        Connection con = null;
        ArrayList data = new ArrayList();
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", user, pass);

            PreparedStatement ps = null;

            String getCount = "select " + field + ", count(*) as 'Count' FROM " + table + " GROUP BY " + field;

            ps = con.prepareStatement(getCount);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                data.add(new JsonHighChartConvertor(rs.getString(field), rs.getInt("Count")));
            }
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
            System.out.println("expection thrown");
            System.out.println("false, exception");
        }
        return data;
    }

    public boolean deleteUser(String username) {
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

    public ArrayList getAllEventsWithAttendance() {
        Connection con = null;
        ArrayList data = new ArrayList();

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", user, pass);

            PreparedStatement ps = null;

            String getEvents = "SELECT DISTINCT `idevent`, `title` FROM event";
            ps = con.prepareStatement(getEvents);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int idevent = rs.getInt("idevent");
                String getAttendance = "select attended, count(*) as 'Count' FROM event_has_user WHERE event_idevent=? GROUP BY attended";
                PreparedStatement getAttendanceStatement = con.prepareStatement(getAttendance);
                getAttendanceStatement.setInt(1, idevent);
                ResultSet attendanceResults = getAttendanceStatement.executeQuery();
                int[] attendance = new int[2];
                int i = 0;
                while (attendanceResults.next()) {
                    attendance[i] = attendanceResults.getInt("Count");
                    i++;
                }
                data.add(new JsonHighChartConvertor(rs.getString("title"), attendance[0], attendance[1]));
            }
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
            System.out.println("expection thrown");
            System.out.println("false, exception");
        }
        return data;
    }

    public ArrayList getAttendanceWithFilters(String field, String value) {
        Connection con = null;
        ArrayList data = new ArrayList();

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", user, pass);

            PreparedStatement ps = null;

            String getEvents = "SELECT DISTINCT `idevent`, `title` FROM event";
            ps = con.prepareStatement(getEvents);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int idevent = rs.getInt("idevent");
                String getAttendance = "select `attended`, count(*) as `Count` FROM event_has_user INNER JOIN user ON event_has_user.user_iduser= user.iduser WHERE " + field + "=? AND event_idevent=? group by `attended`";
                PreparedStatement getAttendanceStatement = con.prepareStatement(getAttendance);
                getAttendanceStatement.setString(1, value);
                getAttendanceStatement.setInt(2, idevent);
                ResultSet attendanceResults = getAttendanceStatement.executeQuery();
                int[] attendance = new int[]{0, 0};
                int i = 0;
                while (attendanceResults.next()) {
                    attendance[i] = attendanceResults.getInt("Count");
                    i++;
                }
                data.add(new JsonHighChartConvertor(rs.getString("title"), attendance[0], attendance[1]));
            }
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
            System.out.println("expection thrown");
            System.out.println("false, exception");
        }
        return data;
    }

    public LinkedList getUniqueValuesFromUser(String field) {
        Connection con = null;
        LinkedList results = new LinkedList();

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", user, pass);

            PreparedStatement ps = null;

            //String getEvents = "SELECT DISTINCT CONVERT(?, CHAR(100)) AS `result` FROM user";
            String getValues = "SELECT DISTINCT " + field + " AS `result` FROM `user`";
            ps = con.prepareStatement(getValues);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String uniqueValue = rs.getString("result");
                results.add(uniqueValue);
            }
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
            System.out.print(e.getMessage());
        }
        return results;
    }

    public LinkedList getSearchResults(String table) {
        LinkedList<String> columns = getColumnNames(table);
        Connection con = null;
        String getValues = null;
        LinkedList results = new LinkedList();
        results.add(columns);
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", user, pass);

            PreparedStatement ps = null;

            getValues = "SELECT * FROM " + table;
            ps = con.prepareStatement(getValues);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                LinkedList row = new LinkedList();
                for (String column : columns) {
                    row.add(rs.getString(column));
                }
                results.add(row);
            }
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
            System.out.print(e.getMessage());
        }
        return results;
    }
}
