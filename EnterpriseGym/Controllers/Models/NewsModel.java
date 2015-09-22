/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import Entities.NewsEntity;
import Entities.UserEntity;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
                //news.setDate(convertSqlDateToUtilDate(rs1.getDate("dateAdded")));               
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
    
    
    
    
}
