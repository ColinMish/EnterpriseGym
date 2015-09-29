package Controllers;

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
import Models.AdminModel;
import Models.NewsModel;
import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Iterator;
import javax.servlet.http.Part;
import lib.Convertors;

/**
 *
 * @author Dave
 */
@WebServlet(name = "News", urlPatterns = {"/News/*","/NewsUpdate"})
@MultipartConfig (maxFileSize = 16177215)
public class News extends HttpServlet {

    private HashMap CommandsMap = new HashMap();
    /**
     * Constructor
     */
   
    public News() 
    {
    super();
    CommandsMap.put("Picture", 1);
    CommandsMap.put("Article", 2);
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
            case 2:
                displayArticle(response,request,args[3]);
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
        
        //Testing code.
//                 Iterator<NewsEntity> iterator;
//            iterator = newsitems.iterator();
//            while (iterator.hasNext()) {
//                NewsEntity p = (NewsEntity) iterator.next();
//                System.out.println("record returned");
//            }
//            
//            if(newsitems !=null)
//            {
//            } else {
//                System.out.println("news items are null");
//        }
//        
//            System.out.println(newsitems);
 
        RequestDispatcher dispatcher = request.getRequestDispatcher("/news.jsp");
        request.setAttribute("news", newsitems);
        dispatcher.forward(request,response);
    }
    
    public void displayArticle(HttpServletResponse response,HttpServletRequest request,String id) throws ServletException, IOException
    {
             NewsModel model = new NewsModel();
             int NewsID = Integer.parseInt(id);
        //Need to pass the profile attributes accross here.
        java.util.LinkedList<NewsEntity> newsitems = model.getNewsArticle(NewsID);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/newsStory.jsp");
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
         String[] parts = Convertors.SplitRequestPath(request);
          switch (parts[1]) {
            case "NewsUpdate":
                updateNews(request, response);
                break;
          }
    }
    
     private void updateNews(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
         String content = request.getParameter("editor1");
        String title = request.getParameter("title");
        String idstring = request.getParameter("id");
        int id = Integer.parseInt(idstring);
        NewsModel model = new NewsModel();
        
        Part filePart = request.getPart("image");
        
        
        if(model.updateNewsStory(filePart,content,title,id)==true)
        {
            request.setAttribute("newsUpdated", true);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin.jsp");
            dispatcher.forward(request, response);
            System.out.println("News Story Updated.");
        }else{
            request.setAttribute("newsUpdated", false);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin.jsp");
            dispatcher.forward(request, response);
            System.out.println("News Story Failed To Update");
        }
    }
    
    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String args[] = Convertors.SplitRequestPath(request);
        if (args[2]!=null)
        {
            int id = Integer.parseInt(args[2]);
            NewsModel model = new NewsModel(); 
            if(model.deleteNews(id)==true)
            {
                //The content was deleted
                     response.setContentType("text/html;charset=UTF-8");
                     response.getWriter().write("1"); 
            }else{
                //Nothing was deleted
                     response.setContentType("text/html;charset=UTF-8");
                     response.getWriter().write("0"); 
            }
            
            //Let the ajax know if the data is deleted. 
        
            
        }else{
            //No id was passed.
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().write("0"); 
        }
        
        
    }
}
