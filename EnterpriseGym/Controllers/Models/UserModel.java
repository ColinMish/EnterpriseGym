/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;


import java.sql.*;

/**
 *
 * @author davidkenny
 */
public class UserModel {
    	 public String user = "davidkenny";
        public String pass = "root1";
    
    public boolean register(String username,String password,String email,String first,String last,String gender, String country, String university, String school, String subject, int year)
    {
    
		//System.out.println("The email is:" + email);
		//response.sendRedirect("FaultInsert.jsp");
		
		//System.out.println("method called");
		//HttpSession session = request.getSession();
	
        
		Connection con = null;
		try{
		
	    Class.forName("com.mysql.jdbc.Driver").newInstance();
	    con = DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/enterprise_gym",user,pass);
	    
	    PreparedStatement ps = null;
	    
	    
	    String sqlOption= "INSERT INTO user_profile (username, password,email,first,last,gender,country,university,school,subject,year) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
    	
	ps = con.prepareStatement(sqlOption);
    	ps.setString(1, username);
    	ps.setString(2, password);
    	ps.setString(3, email);
        ps.setString(4, first);
        ps.setString(5, last);
        ps.setString(6, gender);
        ps.setString(7, country);
        ps.setString(8, university);
        ps.setString(9, school);
        ps.setString(10, subject);
        ps.setInt(11, year);
    	ps.executeUpdate();
    	
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
    	
                //Closing the connection. 
//    	try{
//    		
//    		if(con!=null)
//    		{
//    			con.close();
//    		}
//    	}
//    	catch(Exception e)
//    	{
//    		System.out.println("oh dear");
//    		e.printStackTrace();
//               
//    	}
	    
	

    }
    
    
}
