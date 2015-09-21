/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;


import Entities.UserEntity;
import java.sql.*;
import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 *
 * @author davidkenny
 */
public class UserModel {
    	 public String user = "davidkenny";
        public String pass = "root1";
        
         public static java.sql.Date getCurrentDate() {
            java.util.Date today = new java.util.Date();
                return new java.sql.Date(today.getTime());
            }
    
    public boolean register(String username,String password,String email,String first,String last,String gender, String country, String university, String school, String subject, int year,int matriculation)
    {
    
		//System.out.println("The email is:" + email);
		//response.sendRedirect("FaultInsert.jsp");
		
		//System.out.println("method called");
		//HttpSession session = request.getSession();
	
        
		Connection con = null;
		try{
       
	
	    Class.forName("com.mysql.jdbc.Driver").newInstance();
	    con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym",user,pass);
            
       
           
	    
	    PreparedStatement ps = null;
            PreparedStatement ps2 = null;
            
            String sqlOption2= "INSERT INTO account (username,password,date_joined,accessToken_idaccessToken) VALUES (?,?,?,?)";
            ps2 = con.prepareStatement(sqlOption2);
            ps2.setString(1, username);
            ps2.setString(2, password);
            ps2.setDate(3, getCurrentDate());
            ps2.setInt(4,1);
            ps2.executeUpdate();
            
            //Find out the id of the new account to insert into user. 
	    		PreparedStatement ps1 = null;
			    String sqlOption1= "SELECT * FROM account WHERE username=?";

			    ps1 = con.prepareStatement(sqlOption1);
		    	ps1.setString(1, username);
		    	
		    	ResultSet rs1 = ps1.executeQuery();
		    	rs1.next();
                        int id = rs1.getInt("idaccount");
                        System.out.println("The id is:"+id);
	    
	    
	    String sqlOption= "INSERT INTO user (email,first_name,last_name,gender,country,university,school,subject,year,matriculation,account_idaccount) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
    	                    
            ps = con.prepareStatement(sqlOption);
 
            ps.setString(1, email);
            ps.setString(2, first);
            ps.setString(3, last);
            ps.setString(4, gender);
            ps.setString(5, country);
            ps.setString(6, university);
            ps.setString(7, school);
            ps.setString(8, subject);
            //Default values
            ps.setInt(9, year);
            ps.setInt(10,matriculation);
            ps.setInt(11,id);
            ps.executeUpdate();
        
        
        
        con.close();
    	
    	return true;
    	//}
    	//else
    	//{
    	//	System.out.println("Error");
    	//}
	    
	   // String email= request.getParameter("Susername");
	   // String pass= request.getParameter("passwrd");
	    
	    
	    
		}
		
		catch(Exception e)
    	{
		System.out.println("connection to db failed");
    		e.printStackTrace();
            return false;
    	
    	}
	    
    }
    
    public boolean login (String username,String password) throws SQLException
    {		
		Connection con = null;
		try{
		
	    Class.forName("com.mysql.jdbc.Driver").newInstance();
	    con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym",user,pass);
	    
	    ResultSet rsdoLogin = null;
	    PreparedStatement psdoLogin = null;
            PreparedStatement ps2 = null;

	    	    
	    	String sqlOption= "SELECT * FROM account where username=? and password=?";
	    	
	    	psdoLogin = con.prepareStatement(sqlOption);
	    	psdoLogin.setString(1, username);
	    	psdoLogin.setString(2, password);
	    	
	    	rsdoLogin=psdoLogin.executeQuery();
	    	
	    	
	    	if(rsdoLogin.next())
	    	{
                    String sqlOption2 ="UPDATE account SET date_active=? WHERE username=?";
	   // String sqlOption ="UPDATE fault set summary=? WHERE idfault=?";
	    
	    //is NULL
	    
	    
	   // System.out.println("Statementprepd");
	    
	    ps2 = con.prepareStatement(sqlOption2); 
	   
	    	//use the result set to get the old values
                ps2.setDate(1,getCurrentDate());
	    	ps2.setString(2,username);
	
            ps2.executeUpdate();
    	//ps.executeUpdate();

	    
                    
                    
                   
	    	return true;	    	  	    	  	    		    	  
	    	}
	    	  else
	    	  {
                         
	    		  return false;
	    	  }
	    	  
	    	}
	    	catch(Exception e)
	    	{
                   
	    		e.printStackTrace();
                         return false;
	    	}
	    	
    }
    
    public java.util.LinkedList<UserEntity> getDetails(String username)
    {
        java.util.LinkedList<UserEntity> userdetails = new java.util.LinkedList<>();
        
        	Connection con = null;
		try{		
	    Class.forName("com.mysql.jdbc.Driver").newInstance();
	    con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym",user,pass);
            
            PreparedStatement ps1 = null;
			    String sqlOption1= "SELECT * FROM account WHERE username=?";

			    ps1 = con.prepareStatement(sqlOption1);
		    	ps1.setString(1, username);
		    	
		    	ResultSet rs1 = ps1.executeQuery();
		    	rs1.next();
                        int id = rs1.getInt("idaccount");
                        System.out.println("The id is:"+id);
            
            PreparedStatement ps = null;
             String sqlOption= "SELECT * FROM user WHERE account_idaccount=?";

			    ps = con.prepareStatement(sqlOption);
		    	ps.setInt(1, id);
		    	
		    	ResultSet rs = ps.executeQuery(); 
                        UserEntity user = new UserEntity(); 
		    	rs.next();
                        user.setName(rs.getString("first_name"));
                        user.setLastname(rs.getString("last_name"));
                        user.setUniversity(rs.getString("university"));
                        user.setCountry(rs.getString("country"));
                        user.setEmail(rs.getString("email"));
                        user.setSchool(rs.getString("school"));
                        user.setSubject(rs.getString("subject"));
                        user.setUniversity(rs.getString("university"));
                        user.setGender(rs.getString("gender"));
                        user.setYearOfStudy(rs.getInt("year"));
                        user.setMatric(rs.getInt("matriculation"));
                        userdetails.add(user);
            
            return userdetails;
            
                }
            	catch(Exception e)
    	{
		System.out.println("connection to db failed");
    		e.printStackTrace();
            return null;
    	
    	}
    }    
                
                public java.util.LinkedList<UserEntity> getPoints(String username)
                {
                    java.util.LinkedList<UserEntity> userdetails = new java.util.LinkedList<>();
        
        	Connection con = null;
		try{		
	    Class.forName("com.mysql.jdbc.Driver").newInstance();
	    con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym",user,pass);
            
            PreparedStatement ps1 = null;
			    String sqlOption1= "SELECT * FROM account WHERE username=?";

			    ps1 = con.prepareStatement(sqlOption1);
		    	ps1.setString(1, username);
		    	
		    	ResultSet rs1 = ps1.executeQuery();
		    	rs1.next();
                        int id = rs1.getInt("idaccount");
                        System.out.println("The id is:"+id);
            
            PreparedStatement ps = null;
             String sqlOption= "SELECT * FROM user WHERE account_idaccount=?";

			    ps = con.prepareStatement(sqlOption);
		    	ps.setInt(1, id);
		    	
		    	ResultSet rs = ps.executeQuery(); 
                        UserEntity user = new UserEntity(); 
		    	rs.next();
                        user.setActionPoints(rs.getInt("action_points"));
                        user.setPractice_points(rs.getInt("practice_points"));
                        user.setVirtual_points(rs.getInt("virtual_points"));
                        user.setProject_points(rs.getInt("project_points"));
                        user.setTheory_points(rs.getInt("theory_points"));
                        userdetails.add(user);
            
            return userdetails;
            
                }
            	catch(Exception e)
    	{
		System.out.println("connection to db failed");
    		e.printStackTrace();
            return null;
                }
	    
        
    }
    
    
    
}
