
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
import java.util.HashMap;
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
    private HashMap newsStories;
    
    public News() 
    {
        this.newsStories = new HashMap();
        for (int i = 1; i < 6; i++)//create some news stories, will be from the database eventually
        {
            NewsEntity myStory = new NewsEntity("News Story " + i, "");
            newsStories.put(myStory.getTitle(), myStory);
        }
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
        String a = request.getRequestURI();
        if(a == null)
        {
            throw new IOException();
        }
        String [] parts = a.split("/");
        if(parts.length < 4)
        {
            request.setAttribute("Storys", newsStories);
            RequestDispatcher dispatcher = request.getRequestDispatcher("news.jsp");
            dispatcher.forward(request, response);
        }
        else
        {
            String key = parts[3].replace("%20", " ");
            NewsEntity story = (NewsEntity)newsStories.get(key);
            request.setAttribute("Story", story);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/newsStory.jsp");
            dispatcher.forward(request, response);
        }
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
