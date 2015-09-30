/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import Entities.NewsEntity;
import Entities.Picture;
import Entities.UserEntity;
import static Models.AdminModel.getCurrentDate;
import static Models.UserModel.getCurrentDate;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Locale;
import javax.imageio.ImageIO;
import javax.imageio.stream.MemoryCacheImageInputStream;
import javax.servlet.http.Part;
import lib.Convertors;
import lib.Bytes;

/**
 *
 * @author davidkenny
 */
public class NewsModel {
    
    public String user = "davidkenny";
    public String pass = "root1";
    
     public java.util.Date convertSqlDateToUtilDate(java.sql.Date date) {
    return new java.util.Date(date.getTime());
}
    
    public java.util.LinkedList<NewsEntity> getNewsHome() {
        
        java.util.LinkedList<NewsEntity> newsitem = new java.util.LinkedList<>();

        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", user, pass);

            PreparedStatement ps1 = null;
            String sqlOption1 = "SELECT * FROM newsItem order by dateAdded DESC limit 6";
            ps1 = con.prepareStatement(sqlOption1);

            ResultSet rs1 = ps1.executeQuery();
           
            if(rs1.wasNull())
    	{
    		System.out.println("null result");
                return null;
    	}
    	else
    	{
    		while(rs1.next())
    		{
                NewsEntity news = new NewsEntity(); 
    	    	news.setId(rs1.getInt("idnewsItem"));
    	    	news.setTitle(rs1.getString("title"));
    	    	news.setContent(rs1.getString("story"));
                news.setLength(rs1.getInt("image_length"));
                
//                System.out.println(rs1.getDate("dateAdded"));
//                String mDate = (rs1.getDate("dateAdded")).toString();            
//                DateFormat format = new SimpleDateFormat("yyyy-mm-dd", Locale.ENGLISH);
//                java.sql.Date sqlDate;
//                java.util.Date utilDate;
//                utilDate = format.parse(mDate);
//                news.setDate(utilDate);               
    	    	newsitem.add(news);   	  	
    		}
                return newsitem;
    	}
           // return newsitem;
        } catch (Exception e) {
            System.out.println("connection to db failed");
            e.printStackTrace();
            return null;
        }

    }
    
     public java.util.LinkedList<NewsEntity> getNewsIndex() {
        
        java.util.LinkedList<NewsEntity> newsitem = new java.util.LinkedList<>();

        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", user, pass);

            PreparedStatement ps1 = null;
            String sqlOption1 = "SELECT * FROM newsItem order by dateAdded DESC limit 2";
            ps1 = con.prepareStatement(sqlOption1);

            ResultSet rs1 = ps1.executeQuery();
           
            if(rs1.wasNull())
    	{
    		System.out.println("null result");
                return null;
    	}
    	else
    	{
    		while(rs1.next())
    		{
                NewsEntity news = new NewsEntity(); 
    	    	news.setId(rs1.getInt("idnewsItem"));
    	    	news.setTitle(rs1.getString("title"));
    	    	news.setContent(rs1.getString("story"));
                news.setLength(rs1.getInt("image_length"));              
    	    	newsitem.add(news);   	  	
    		}
                return newsitem;
    	}
           // return newsitem;
        } catch (Exception e) {
            System.out.println("connection to db failed");
            e.printStackTrace();
            return null;
        }

    }
    
     public boolean updateNewsStory(Part filepart,String newsContent,String title,int id) throws IOException
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
             String sqlOption2 = "UPDATE newsItem SET story=?,title=?,image=?,image_length=?,image_type=? WHERE idnewsItem=?";
                ps = con.prepareStatement(sqlOption2);

                ps.setString(1,newsContent);
                ps.setString(2, title);
                  
                // fetches input stream of the upload file for the blob column
                    ps.setBlob(3, inputStream);
                    ps.setInt(4,length);
                    ps.setString(5,type);
                    
                ps.setInt(6,id);
                ps.executeUpdate();
  
            return true;
              }else{
                      PreparedStatement ps = null;
             String sqlOption2 = "UPDATE newsItem SET story=?,title=? WHERE idnewsItem=?";
                ps = con.prepareStatement(sqlOption2);

                ps.setString(1,newsContent);
                ps.setString(2, title);    
                ps.setInt(3,id);
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
    
    public java.util.LinkedList<NewsEntity> getAllNews() {
        
        java.util.LinkedList<NewsEntity> newsitem = new java.util.LinkedList<>();

        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", user, pass);

            PreparedStatement ps1 = null;
            String sqlOption1 = "SELECT * FROM newsItem order by dateAdded DESC";
            ps1 = con.prepareStatement(sqlOption1);

            ResultSet rs1 = ps1.executeQuery();
           
            if(rs1.wasNull())
    	{
    		System.out.println("null result");
                return null;
    	}
    	else
    	{
    		while(rs1.next())
    		{
                NewsEntity news = new NewsEntity(); 
    	    	news.setId(rs1.getInt("idnewsItem"));
    	    	news.setTitle(rs1.getString("title"));
    	    	news.setContent(rs1.getString("story"));
                news.setLength(rs1.getInt("image_length"));
                
//                System.out.println(rs1.getDate("dateAdded"));
//                String mDate = (rs1.getDate("dateAdded")).toString();            
//                DateFormat format = new SimpleDateFormat("yyyy-mm-dd", Locale.ENGLISH);
//                java.sql.Date sqlDate;
//                java.util.Date utilDate;
//                utilDate = format.parse(mDate);
//                news.setDate(utilDate);               
    	    	newsitem.add(news);   	  	
    		}
                return newsitem;
    	}
           // return newsitem;
        } catch (Exception e) {
            System.out.println("connection to db failed");
            e.printStackTrace();
            return null;
        }

    }
    
    public java.util.LinkedList<NewsEntity> getNewsArticle(int id) {
        
        java.util.LinkedList<NewsEntity> newsitem = new java.util.LinkedList<>();

        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", user, pass);

            PreparedStatement ps1 = null;
            String sqlOption1 = "SELECT * FROM newsItem where idnewsItem=?";
            ps1 = con.prepareStatement(sqlOption1);
             ps1.setInt(1, id);

            ResultSet rs1 = ps1.executeQuery();
           
            if(rs1.wasNull())
    	{
    		System.out.println("null result");
                return null;
    	}
    	else
    	{
    		while(rs1.next())
    		{
                NewsEntity news = new NewsEntity(); 
    	    	news.setId(rs1.getInt("idnewsItem"));
    	    	news.setTitle(rs1.getString("title"));
    	    	news.setContent(rs1.getString("story"));
                news.setLength(rs1.getInt("image_length"));
                
//                System.out.println(rs1.getDate("dateAdded"));
//                String mDate = (rs1.getDate("dateAdded")).toString();            
//                DateFormat format = new SimpleDateFormat("yyyy-mm-dd", Locale.ENGLISH);
//                java.sql.Date sqlDate;
//                java.util.Date utilDate;
//                utilDate = format.parse(mDate);
//                news.setDate(utilDate);               
    	    	newsitem.add(news);   	  	
    		}
                return newsitem;
    	}
           // return newsitem;
        } catch (Exception e) {
            System.out.println("connection to db failed");
            e.printStackTrace();
            return null;
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

            String sqlOption = "SELECT * FROM newsItem where idnewsItem=?";
            
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
   
   
   public boolean deleteNews(int id)
   {
         Connection con = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym", user, pass);

            PreparedStatement deleteNews = null;
            String DeleteNews = "DELETE FROM newsItem WHERE idnewsItem=?";
            deleteNews = con.prepareStatement(DeleteNews);
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
    
    
}
