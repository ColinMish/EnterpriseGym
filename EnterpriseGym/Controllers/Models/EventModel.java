/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import Entities.EventEntity;
import static Models.UserModel.getCurrentDate;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author Dave, Colin
 */
public class EventModel {
    
    public String user = "davidkenny";
    public String pass = "root1";
    
    public static java.sql.Date getEventDate() {
        java.util.Date today = new java.util.Date();
        return new java.sql.Date(today.getTime());
    }
        
    public boolean newEvent(String title, String description, String location, Date date, int theme) {

    //System.out.println("The email is:" + email);
    //response.sendRedirect("FaultInsert.jsp");
    //System.out.println("method called");
    //HttpSession session = request.getSession();
    Connection con = null;
    try {

        Class.forName("com.mysql.jdbc.Driver").newInstance();
        con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", user, pass);

        PreparedStatement ps2 = null;

        String sqlOption = "INSERT INTO event (title,description,location,date,theme_idtheme) VALUES (?,?,?,?,?)";
        ps2 = con.prepareStatement(sqlOption);
        ps2.setString(1, title);
        ps2.setString(2, description);
        System.out.println(location);
        ps2.setString(3, location);
        ps2.setDate(4, date);
        ps2.setInt(5, theme);
        ps2.executeUpdate();

        //Find out the id of the new account to insert into user. 
        PreparedStatement ps1 = null;
        String sqlOption1 = "SELECT * FROM event WHERE title=?";

        ps1 = con.prepareStatement(sqlOption1);
        ps1.setString(1, title);

        ResultSet rs1 = ps1.executeQuery();
        rs1.next();
        int id = rs1.getInt("idevent");
        System.out.println("The id is:" + id);

        con.close();

        return true;
        
    } catch (Exception e) {
            System.out.println("connection to db failed");
            e.printStackTrace();
            return false;

        }

    }
    
    public java.util.LinkedList<EventEntity> getAllEvents() {
        java.util.LinkedList<EventEntity> eventdetails = new java.util.LinkedList<>();

        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", user, pass);

            PreparedStatement ps1 = null;
            String sqlOption1 = "SELECT * FROM event";

            ps1 = con.prepareStatement(sqlOption1);

            ResultSet rs1 = ps1.executeQuery();
            rs1.next();
            int id = rs1.getInt("idevent");
            System.out.println("The id is:" + id);


            ResultSet rs = ps1.executeQuery();
            
            
            while (rs.next()) {
                EventEntity event = new EventEntity();
                event.setName(rs.getString("title"));
                System.out.println("Event name: " + event.getName());
                event.setEvent_type(rs.getInt("theme_idtheme"));
                event.setDescription(rs.getString("description"));
                //TODO get points value from theme table
                //event.setPoints_given(rs.getInt("points_given"));
                event.setDateTime(rs.getDate("date"));
                event.setLocation(rs.getString("location"));
                System.out.println("Event location: " + event.getLocation());
                eventdetails.add(event);
            }

            return eventdetails;

        } catch (Exception e) {
            System.out.println("connection to db failed");
            e.printStackTrace();
            return null;

        }
    }
    
    public EventEntity GetEventByName(String name)
    {
        EventEntity event = new EventEntity(name, 1, null, 1, null, null);
        return event;
    }
    
    public Boolean SetNewEvent(String name, int eventType, String desciption, int points, Date date, String location)
    {
        return false;
    }
    
    public List<EventEntity>GetEventsByDate(Date dateTime)
    {
        List<EventEntity> eventList = new LinkedList();
        return eventList;
    }
    
    public List<EventEntity>GetEventsByType(String eventType)
    {
        List<EventEntity> eventList = new LinkedList();
        return eventList;
    }
    
    public List<EventEntity>GetEventsByLocation(String location)
    {
        List<EventEntity> eventList = new LinkedList();
        return eventList;
    }
}
