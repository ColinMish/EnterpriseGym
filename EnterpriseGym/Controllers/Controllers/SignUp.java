package Controllers;


import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Models.UserModel;

/**
 *
 * @author Dave
 */

@WebServlet(name = "SignUp", urlPatterns = {"/SignUp"})
@MultipartConfig
public class SignUp extends HttpServlet {

    /**
     * Constructor
     */
    public SignUp() {

    }

    @Override
    public void init(ServletConfig config) throws ServletException {
    }

    public static String toSHA1(byte[] convertme) {
	    MessageDigest md = null;
	    try {
	        md = MessageDigest.getInstance("SHA1");
	    }
	    catch(NoSuchAlgorithmException e) {
	        e.printStackTrace();
	    } 
	    return byteArrayToHexString(md.digest(convertme));
	}
	
	public static String byteArrayToHexString(byte[] b) {
		  String result = "";
		  for (int i=0; i < b.length; i++) {
		    result +=
		          Integer.toString( ( b[i] & 0xff ) + 0x100, 16).substring( 1 );
		  }
		  return result;
		}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String passwordcheck = request.getParameter("passwordcheck");
		String email = request.getParameter("email");
                String first = request.getParameter("first");
                String last = request.getParameter("last");
                String gender = request.getParameter("gender");
                String country = request.getParameter("country");
                String university = request.getParameter("university");
                String school = request.getParameter("school");
                String subject = request.getParameter("subject");
                String yearofstudy = request.getParameter("year");
                
               System.out.println("Testing.");

		UserModel user = new UserModel();
		
		
		try
		{
			if (password.equals(passwordcheck))
			{
				System.out.println("passwords match");
                                
					if(user.register(username,toSHA1(password.getBytes("UTF-8")),email,first,last,gender,country,university,school,subject,yearofstudy) ==false)
					{
                                            System.out.println("false");
						HttpSession session = request.getSession();
						session.setAttribute("error", "The username is already taken.");
						response.sendRedirect(request.getContextPath()+"/FailedSignUp.jsp");
					}
					else{
						System.out.println("true");	
						response.sendRedirect(request.getContextPath()+"/LogIn.jsp");
					}
		
		
			}else{							
				throw new IllegalArgumentException("The passwords don't match");
				}
		}
		catch(Exception e)
		{
			//At this point you need to tell the user that the passwords don't match
			System.out.println("expection thrown");
			e.printStackTrace();
			//Reditect to the failed registration page.
			HttpSession session = request.getSession();
			session.setAttribute("error", "The passwords don't match.");
                        System.out.println("false, exception");
			response.sendRedirect(request.getContextPath()+"/FailedSignUp.jsp");
		}
	}
   
}



	