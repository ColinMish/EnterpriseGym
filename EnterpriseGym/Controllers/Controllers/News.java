
import Entities.Account;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Entities.NewsEntity;
import Entities.UserEntity;
import Models.UserModel;
import Models.NewsModel;
import java.util.HashMap;
import java.util.Iterator;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dave
 */
@WebServlet(name = "News", urlPatterns = {"/News/*"})
@MultipartConfig
public class News extends HttpServlet {

    /**
     * Constructor
     */
   
    public News() 
    {

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        //Get the 6 most recent stories then show them to the user on the news page. 
             NewsModel model = new NewsModel();
       
        //Need to pass the profile attributes accross here.
        java.util.LinkedList<NewsEntity> newsitems = model.getNewsHome();
        
//                 Iterator<NewsEntity> iterator;
//            iterator = newsitems.iterator();
//            while (iterator.hasNext()) {
//                NewsEntity p = (NewsEntity) iterator.next();
//                System.out.println(p.getId());
//            }
  
        RequestDispatcher dispatcher = request.getRequestDispatcher("/news.jsp");
        request.setAttribute("news", newsitems);
        dispatcher.forward(request,response);
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
            throws ServletException, IOException {
    }
}
