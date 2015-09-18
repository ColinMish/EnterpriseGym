
package Controllers;

import static Controllers.SignUp.toSHA1;
import Models.NewPassModel;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kim
 */

@WebServlet(name = "ResetPassword", urlPatterns = {"/ResetPassword"})
@MultipartConfig
public class ResetPassword extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException 
    {
        /* Get details */
        String e = request.getParameter("email_address");
        String pass1 = request.getParameter("password");
        String pass2 = request.getParameter("passwordCheck");
        
        
        NewPassModel reset = new NewPassModel();
        
        if(pass1.equals(pass2)){
            
            /* Encrypt password */           
          String pass = SignUp.toSHA1(pass1.getBytes("UTF-8"));
          
          reset.resetPass(e, pass);
           
          response.sendRedirect(request.getContextPath()+"/LogIn.jsp");
           
        } else {
            response.sendRedirect(request.getContextPath()+"/resetPass.jsp");
        }
             
    } 
}