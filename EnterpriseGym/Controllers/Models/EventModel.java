/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import Entities.EventEntity;
import Entities.Picture;
import static Models.UserModel.getCurrentDate;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.http.Part;
import lib.Convertors;

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
        
    public boolean newEvent(Part filepart,String title, String description, String location, String startdate, String enddate, int points,int theme) throws IOException {


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

        PreparedStatement ps2 = null;

        String sqlOption = "INSERT INTO event (title,description,location,date,end_date,theme_idtheme,points,image,image_length,image_type) VALUES (?,?,?,?,?,?,?,?,?,?)";
        ps2 = con.prepareStatement(sqlOption);
        ps2.setString(1, title);
        ps2.setString(2, description);
        ps2.setString(3, location);
        ps2.setString(4, startdate);
        ps2.setString(5, enddate);
        ps2.setInt(6, theme);
        ps2.setInt(7, points);
          if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                ps2.setBlob(8, inputStream);
                ps2.setInt(9,length);
                ps2.setString(10,type);
            }
        ps2.executeUpdate();

        //Find out the id of the new account to insert into user. 

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
                event.setID(rs.getInt("idevent"));
                event.setName(rs.getString("title"));
                System.out.println("Event name: " + event.getName());
                event.setEvent_type(rs.getInt("theme_idtheme"));
                event.setDescription(rs.getString("description"));
                event.setLength(rs.getInt("image_length"));
                //TODO get points value from theme table
                //event.setPoints_given(rs.getInt("points_given"));
                event.setStartdate(rs.getString("date"));
                event.setEnddate(rs.getString("end_date"));
                event.setLocation(rs.getString("location"));
                event.setPoints_given(rs.getInt("points"));
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
    
    
     public boolean updateEvent(Part filepart,String title, String description, String location, String startdate, String enddate, int points,int theme,int id) throws IOException
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
              if (inputStream != null && length !=0) {
            PreparedStatement ps = null;
             String sqlOption2 = "UPDATE event SET title=?,description=?,date=?,end_date=?,location=?,points=?,theme_idtheme=?,image=?,image_length=?,image_type=? WHERE idevent=?";
                ps = con.prepareStatement(sqlOption2);

                ps.setString(1,title);
                ps.setString(2, description);
                  
                // fetches input stream of the upload file for the blob column
                    ps.setString(3, startdate);
                    ps.setString(4,enddate);
                    ps.setString(5,location);
                    ps.setInt(6,points);
                    ps.setInt(7,theme);
                     ps.setBlob(8, inputStream);
                    ps.setInt(9,length);
                    ps.setString(10,type);
                    
                    
                ps.setInt(11,id);
                ps.executeUpdate();
  
            return true;
              }else{
                      PreparedStatement ps = null;
             String sqlOption2 = "UPDATE event SET title=?,description=?,date=?,end_date=?,location=?,points=?,theme_idtheme=? WHERE idevent=?";
                ps = con.prepareStatement(sqlOption2);

                 ps.setString(1,title);
                ps.setString(2, description);
                  
                // fetches input stream of the upload file for the blob column
                    ps.setString(3, startdate);
                    ps.setString(4,enddate);
                    ps.setString(5,location);
                    ps.setInt(6,points);
                    ps.setInt(7,theme);
                    ps.setInt(8, id);
                ps.executeUpdate();
                return true;
              }
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
             System.out.println("expection thrown");
             System.out.println("false, exception");
             e.printStackTrace();
            return false;
        }
    }
    
    //public EventEntity GetEventByName(String name)
    //{
     //   EventEntity event = new EventEntity(name, 1, null, 1, null, null);
     //   return event;
    //}
    
    public java.util.LinkedList<EventEntity> GetEventByID(int ID)
    {
        java.util.LinkedList<EventEntity> eventdetails = new java.util.LinkedList<>();

        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", user, pass);

            PreparedStatement ps1 = null;
            String sqlOption1 = "SELECT * FROM event WHERE idevent = " + ID + ";";

            ps1 = con.prepareStatement(sqlOption1);

            ResultSet rs1 = ps1.executeQuery();
                if(rs1.wasNull())
    	{
    		System.out.println("null result");
                return null;
    	}else
    	{
    		while(rs1.next())
    		{
             EventEntity event = new EventEntity();
                event.setID(rs1.getInt("idevent"));
                event.setName(rs1.getString("title"));
                System.out.println("Event name: " + event.getName());
                event.setEvent_type(rs1.getInt("theme_idtheme"));
                event.setDescription(rs1.getString("description"));
                event.setLength(rs1.getInt("image_length"));
                //TODO get points value from theme table
                //event.setPoints_given(rs.getInt("points_given"));
                event.setStartdate(rs1.getString("date"));
                event.setEnddate(rs1.getString("end_date"));
                event.setLocation(rs1.getString("location"));
                event.setPoints_given(rs1.getInt("points"));
                System.out.println("Event location: " + event.getLocation());
                eventdetails.add(event);
                }
                return eventdetails;
        }
          //  int id = rs1.getInt("idevent");
          //  System.out.println("The id is:" + id);


          //  ResultSet rs = ps1.executeQuery();
            
          //  return eventdetails;

        } catch (Exception e) {
            System.out.println("connection to db failed");
            e.printStackTrace();
            return null;

        }
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
    
    public boolean deleteEvent(int id)
   {
         Connection con = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", user, pass);

            PreparedStatement deleteNews = null;
            String DeleteEvent = "DELETE a.*,u.* FROM event a INNER JOIN event_has_user u ON a.idevent = u.event_idevent WHERE a.idevent=?";
            deleteNews = con.prepareStatement(DeleteEvent);
            deleteNews.setInt(1,id);
            deleteNews.executeUpdate();
            return true;
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
             System.out.println("expection thrown");
             System.out.println("false, exception");
             e.printStackTrace();
            return false;
        }
   }
    
    public Picture getPic(int id)
    {
    	 Connection con = null;
         ByteBuffer bImage = null;
         String type = null;
         int length = 0;
       
        try {
             Class.forName("com.mysql.jdbc.Driver").newInstance();
         con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", user, pass);
            Convertors convertor = new Convertors();
            ResultSet rs = null;
            PreparedStatement ps = null;  

            String sqlOption = "SELECT * FROM event where idevent=?";
            
            ps = con.prepareStatement(sqlOption);
            ps.setInt(1, id);
            rs = ps.executeQuery();  


            if (rs==null) {
                System.out.println("No Images returned");
                return null;
            } else {
                rs.next();
                 byte[] nameByteArray = rs.getBytes("image");
                 bImage = bImage.wrap(nameByteArray);
                  
                 length = rs.getInt("image_length");
                 type = rs.getString("image_type");
                    Picture p = new Picture();
                    p.setPic(bImage, length, type);
                    return p;

                }
            
        } catch (Exception et) {
            System.out.println("Can't get Pic" + et);
            return null;
        }


    } 
}
