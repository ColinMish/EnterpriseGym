package Controllers;


import Entities.Account;
import Entities.EventEntity;
import Entities.NewsEntity;
import Entities.Picture;
import Models.EventModel;
import Models.NewsModel;
import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Locale;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import lib.Convertors;

/**
 *
 * @author Dave
 */
@WebServlet(name = "Events", urlPatterns = {"/Events/*", "/EditEvent","/NewEvent","/SignUpEvent"})
@MultipartConfig (maxFileSize = 16177215)
public class Events extends HttpServlet {

    /**
     * Constructor
     */
    private HashMap eventItems;
    private EventModel eventModel;
    private java.util.LinkedList<EventEntity> eventList;
    private HashMap CommandsMap = new HashMap();
    
    
    public Events() 
    {   
        CommandsMap.put("Picture", 1);
        CommandsMap.put("Event", 2);      
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

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          String args[] = Convertors.SplitRequestPath(request);
                 
        
        if(args.length==2)
        {
            displayEvents(response,request);
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
                displayEvent(response,request,args[3]);
                break;
            default:
            	//Error message here.
        }
 
    }
    
     public void displayEvents(HttpServletResponse response,HttpServletRequest request) throws ServletException, IOException
    {
            EventModel model = new EventModel();
            java.util.LinkedList<EventEntity> eventitem = model.getAllEvents();
            request.setAttribute("events", eventitem);
            RequestDispatcher dispatcher = request.getRequestDispatcher("events.jsp");
            dispatcher.forward(request, response);
    }
     
     public void displayEvent(HttpServletResponse response,HttpServletRequest request,String id) throws ServletException, IOException
     {
          EventModel model = new EventModel();
             int eventID = Integer.parseInt(id);
              HttpSession session = request.getSession();
         //if user is logged in get a bool for if they are attending or not. 
              Account account = (Account) session.getAttribute("account");
    if (account != null) {
        Boolean attending = model.isAttending(eventID,account.getId());
        request.setAttribute("attending",attending);
    }else{
        System.out.println("No account found");
    }
             
        java.util.LinkedList<EventEntity> eventitem = model.GetEventByID(eventID);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/eventStory.jsp");
        request.setAttribute("event", eventitem);
        dispatcher.forward(request,response);
     }
     
       public void displayPicture(HttpServletResponse response,HttpServletRequest request,String id) throws ServletException, IOException
    {
        int eventID = Integer.parseInt(id);
        System.out.println(eventID);
         EventModel news = new EventModel();
 
         Picture p = news.getPic(eventID);
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
            throws ServletException, IOException 
    {
         String[] parts = Convertors.SplitRequestPath(request);
        switch (parts[1]) {
            case "NewEvent":
                CreateEvent(request, response);
                break;
            case "EditEvent":  
                changeEvent(request, response);   
                break;
            case "SignUpEvent":
                signUp(request,response);
                break;
                    
        }
    }
    
    private void signUp(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
    System.out.println("sign up called");
    }
    
    private void changeEvent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        
        int eventID = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("eventTitle");
        String startDate = request.getParameter("startdate");
        String endDate = request.getParameter("enddate");
        String description = request.getParameter("eventDescription"); 
        String location = request.getParameter("eventLocation");
        int theme = Integer.parseInt(request.getParameter("eventTheme"));
        int points = Integer.parseInt(request.getParameter("points"));
        Part filePart = request.getPart("image");
        
        EventModel model = new EventModel();
        
        if(model.updateEvent(filePart,title,description,location,startDate,endDate,points,theme,eventID)==true)
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
    
//       public java.sql.Timestamp convertJavaDateToSqlDate(java.util.Date date) {
//    return new java.sql.Timestamp(date.);
//}
    
    private void CreateEvent(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String title = request.getParameter("eventTitle");
        String startDate = request.getParameter("startdate");
        String endDate = request.getParameter("enddate");
        String description = request.getParameter("eventDescription"); 
        String location = request.getParameter("eventLocation");
        int theme = Integer.parseInt(request.getParameter("eventTheme"));
        int points = Integer.parseInt(request.getParameter("points"));
        Part filePart = request.getPart("image");

     
        EventModel event = new EventModel();

        try {

                if (event.newEvent(filePart,title, description, location, startDate,endDate,points, theme) == false) {
                    System.out.println("false");
                    response.sendRedirect(request.getContextPath() + "/FailedNewEvent.jsp");
                } else {
                    response.sendRedirect(request.getContextPath() + "/Events");
                }

        } catch (IOException | IllegalArgumentException e) {
            System.out.println("expection thrown");
            HttpSession session = request.getSession();
            session.setAttribute("error", "No event title entered.");
            System.out.println("false, exception");
            response.sendRedirect(request.getContextPath() + "/FailedNewEvent.jsp");
        }
    }
    
        @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String args[] = Convertors.SplitRequestPath(request);
        switch (args[2]) {
            case "DeleteEvent":
                deleteEvent(request, response,args[3]);
                break;
            case "NotGoing":  
                notGoing(request, response,args[3],args[4]);   
                break;
     
            }
    }
    
      private void deleteEvent(HttpServletRequest request, HttpServletResponse response,String id2) throws IOException, ServletException
                {
                       int id = Integer.parseInt(id2);
                        EventModel model = new EventModel(); 
                        if(model.deleteEvent(id)==true)
                        {
                       //The content was deleted
                        response.setContentType("text/html;charset=UTF-8");
                        response.getWriter().write("1"); 
                         }else{
                         //Nothing was deleted
                       response.setContentType("text/html;charset=UTF-8");
                      response.getWriter().write("0"); 
                         }
    
                }
      
      private void notGoing(HttpServletRequest request, HttpServletResponse response,String eventid,String userid) throws IOException, ServletException
                {
//                       int id = Integer.parseInt(id2);
//                        EventModel model = new EventModel(); 
//                        if(model.deleteEvent(id)==true)
//                        {
//                       //The content was deleted
//                        response.setContentType("text/html;charset=UTF-8");
//                        response.getWriter().write("1"); 
//                         }else{
//                         //Nothing was deleted
//                       response.setContentType("text/html;charset=UTF-8");
//                      response.getWriter().write("0"); 
//                         }
                    System.out.println("delete method called");
    
                }
    
    
}