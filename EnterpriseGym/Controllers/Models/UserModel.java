/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;


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
    
    public boolean register(String username,String password,String email,String first,String last,String gender, String country, String university, String school, String subject, String year,String matriculation)
    {
    
		//System.out.println("The email is:" + email);
		//response.sendRedirect("FaultInsert.jsp");
		
		//System.out.println("method called");
		//HttpSession session = request.getSession();
	
        
		Connection con = null;
		try{
		
	    Class.forName("com.mysql.jdbc.Driver").newInstance();
	    con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym",user,pass);
            
            Date date = new Date();
	    
	    PreparedStatement ps = null;
            PreparedStatement ps2 = null;
            
            String sqlOption2= "INSERT INTO account (username,password,date_joined) VALUES (?,?,?)";
            ps2 = con.prepareStatement(sqlOption2);
            ps2.setString(1, username);
            ps2.setString(2, password);
            ps2.setDate(3, date);
            ps2.executeUpdate();
	    
	    
	    String sqlOption= "INSERT INTO user (email,first_name,last_name,gender,country,university,school,subject,year,matriculation) VALUES (?,?,?,?,?,?,?,?,?,?)";
    	
            ps = con.prepareStatement(sqlOption);
 
            ps.setString(1, email);
            ps.setString(2, first);
            ps.setString(3, last);
            ps.setString(4, gender);
            ps.setString(5, country);
            ps.setString(6, university);
            ps.setString(7, school);
            ps.setString(8, subject);
            ps.setString(9, year);
            ps.setString(10,matriculation);
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
	    con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/enterprise_gym",user,pass);
	    
	    ResultSet rsdoLogin = null;
	    PreparedStatement psdoLogin = null;

	    	    
	    	String sqlOption= "SELECT * FROM account where username=? and password=?";
	    	
	    	psdoLogin = con.prepareStatement(sqlOption);
	    	psdoLogin.setString(1, username);
	    	psdoLogin.setString(2, password);
	    	
	    	rsdoLogin=psdoLogin.executeQuery();
	    	
	    	
	    	if(rsdoLogin.next())
	    	{
                   
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
	    	
//	    	try{
//	    		
//	    		if(con!=null)
//	    		{
//	    			con.close();
//	    		}
//	    	}
//	    	catch(Exception e)
//	    	{
//	    		e.printStackTrace();
//	    	}

    }
    
}
