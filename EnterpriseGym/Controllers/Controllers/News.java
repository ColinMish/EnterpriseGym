
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
import Entities.Picture;
import Entities.UserEntity;
import Models.UserModel;
import Models.NewsModel;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Iterator;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import lib.Convertors;

/**
 *
 * @author Dave
 */
@WebServlet(name = "News", urlPatterns = {"/News/*"})
@MultipartConfig
public class News extends HttpServlet {

    private HashMap CommandsMap = new HashMap();
    /**
     * Constructor
     */
   
    public News() 
    {
    super();
    CommandsMap.put("Picture", 1);
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
        
         String args[] = Convertors.SplitRequestPath(request);
        
        if(args.length==2)
        {
            // RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
             //   dispatcher.forward(request, response);
            displayNews(response,request);
        }
        
        int command;
         try {
            command = (Integer) CommandsMap.get(args[2]);
        } catch (Exception et) {           
            return;
        }
        switch (command) {
            case 1:
                displayPicture(response,request,args[3]);            
                break;               
            default:
            	//Error message here.
        }
       
        //Get the 6 most recent stories then show them to the user on the news page. 
       
    }
    
    public void displayNews(HttpServletResponse response,HttpServletRequest request) throws ServletException, IOException
    {
              NewsModel model = new NewsModel();
        //Need to pass the profile attributes accross here.
        java.util.LinkedList<NewsEntity> newsitems = model.getNewsHome();
 
        RequestDispatcher dispatcher = request.getRequestDispatcher("/news.jsp");
        request.setAttribute("news", newsitems);
        dispatcher.forward(request,response);
    }
    
    public void displayPicture(HttpServletResponse response,HttpServletRequest request,String id) throws ServletException, IOException
    {
        int newsID = Integer.parseInt(id);
        System.out.println(newsID);
         NewsModel news = new NewsModel();
 
         Picture p = news.getPic(newsID);
         OutputStream out = response.getOutputStream();

         response.setContentType(p.getType());
         response.setContentLength(p.getLength());

         InputStream is = new ByteArrayInputStream(p.getBytes());
         BufferedInputStream input = new BufferedInputStream(is);
         byte[] buffer = new byte[8192];
         for (int length = 0; (length = input.read(buffer)) > 0;) {
             out.write(buffer, 0, length);
         }
         out.close();
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
