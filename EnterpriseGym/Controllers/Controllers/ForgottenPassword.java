package Controllers;

import Models.SendEmailModel;
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
//import javax.mail.*;
//import javax.mail.internet.*;
import javax.activation.*;


/**
 *
 * @author Kim
 */

@WebServlet(name = "ForgottenPassword", urlPatterns = {"/ForgottenPassword"})
@MultipartConfig
public class ForgottenPassword extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        /* Get email address */
        String e = request.getParameter("email");
        
        SendEmailModel reset = new SendEmailModel();
        
        if(reset.checkDB(e)){
            response.sendRedirect(request.getContextPath()+"/resetPass.jsp");
        } else {
            /* Sorry, not in database */
           //  response.sendRedirect(request.getContextPath()+"/notRegistered.jsp");
             response.sendRedirect(request.getContextPath()+"/resetPass.jsp");
        }               
    }   
}



























