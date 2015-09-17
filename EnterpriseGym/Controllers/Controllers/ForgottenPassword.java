package Controllers;

import Models.ResetPasswordModel;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.io.EOFException;
import java.sql.*;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;


    /* 
    username: davidkenny
    password: root1
    Hostname:160.153.16.42
    */

/**
 *
 * @author Kim
 */

@WebServlet(name = "ForgottenPassword", urlPatterns = {"/ForgottenPassword"})
@MultipartConfig
public class ForgottenPassword extends HttpServlet {
    
    public String user = "davidkenny";
    public String pass = "root1"; 


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        /* Get email address */
        String e = request.getParameter("email_address");
        
        ResetPasswordModel reset = new ResetPasswordModel();
        
        if(reset.checkDB(e)){
            response.sendRedirect(request.getContextPath()+"/LogIn.jsp");
        } else {
            /* Sorry, not in database */
        }


                      
    }   
}



























