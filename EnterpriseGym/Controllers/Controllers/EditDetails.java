package Controllers;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author kristiyangeorgiev
 */
@WebServlet(name = "EditDetails", urlPatterns = {"/EditDetails"})
@MultipartConfig
public class EditDetails extends HttpServlet {

    /**
     * Constructor
     */
    public EditDetails() {

    }

    /**
     *
     * @param config
     * @throws ServletException
     */
    @Override
    public void init(ServletConfig config) throws ServletException {
    }

    /**
     * Method to get the account details for display
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
                  RequestDispatcher dispatcher = request.getRequestDispatcher("editdetails.jsp");
                dispatcher.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
            response.setContentType("text/html");  
            PrintWriter out = response.getWriter(); 
            
            
            
            String firstname  = request.getParameter("firstn");
            String lastname  = request.getParameter("lastn"); 
            String email  = request.getParameter("email");
            String year  = request.getParameter("year");
            String oldpassword  = request.getParameter("oldpass");
            String newpassword  = request.getParameter("newpass");
            String newpasswordagain  = request.getParameter("newpass");
         
            try{
                
                
                Class.forName("com.mysql.jdbc.Driver");
                
                
                
                
                //Establish a connection with the database url 
                 //while attempts to select an appropriate driver from the set of available drivers.
                Connection database;
                database = DriverManager.getConnection(
                        
                        "jdbc:mysql://localhost/project",
                        "root", "");
                
                
                //Run the Sql query and returns the result set object obtained from the query
                PreparedStatement value=database.prepareStatement(
                        "UPDATE regtable SET firstn=?, lastn=?,email=?, year=?,oldpassword=?, newpassword=?, newpasswordagain=? "); 
                
                value.setString(1,firstname); 
                value.setString(2,lastname);
                value.setString(3,email);
                value.setString(4,year);
                value.setString(5,oldpassword);
                value.setString(6,newpassword);
                value.setString(7,newpasswordagain);
                
                
                int i=value.executeUpdate();
                if(i>0)
                    
                    
                    
                    out.print("You successfully updated your details " + ""
                            + "<a href='profile.jsp'>Go to your Profile</a>");
                
                
            }catch (ClassNotFoundException error) {System.out.println(error);} catch (SQLException error) {
                System.out.println(error);
                
            }  
            
            out.close();
            
    }
}
