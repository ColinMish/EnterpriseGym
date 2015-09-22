package Controllers;


import Models.AdminModel;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lib.Convertors;

/**
 *
 * @author Andy
 */
@WebServlet(name = "Admin", urlPatterns = {"/Admin", "/AddNews"})
@MultipartConfig
public class Admin extends HttpServlet {

    /**
     * Constructor
     */
    public Admin() {

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
                  RequestDispatcher dispatcher = request.getRequestDispatcher("admin.jsp");
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
        String[] parts = Convertors.SplitRequestPath(request);
        switch (parts[1]) {
            case "AddNews":
                addNews(request, response);
                break;
            case "ResetPoints":
                resetPoints(request, response);
                break;
            case "AddEvent":
                addEvent(request, response);
                break;
            case "editQuiz":
                editQuiz(request, response);
                break;
        }
    }
    
    private void addNews(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        String content = request.getParameter("editor1");
        AdminModel admin = new AdminModel();
        
        admin.addNewsStory(content);
        System.out.print("News Story Added.");
    }
    
    private void resetPoints(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        
    }
    
    private void addEvent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        
    }
    
    private void editQuiz(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        
    }
}