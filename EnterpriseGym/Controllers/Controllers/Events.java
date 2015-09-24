package Controllers;


import Entities.EventEntity;
import Models.EventModel;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import lib.Convertors;

/**
 *
 * @author Dave
 */
@WebServlet(name = "Events", urlPatterns = {"/Events/*", "/EditEvent","/NewEvent"})
@MultipartConfig
public class Events extends HttpServlet {

    /**
     * Constructor
     */
    private HashMap eventItems;
    private EventModel eventModel;
    private java.util.LinkedList<EventEntity> eventList;
    
    
    public Events() 
    {
        this.eventItems = new HashMap();
        this.eventModel = new EventModel();
        this.eventList = new java.util.LinkedList<>();

        eventList = eventModel.getAllEvents();
        System.out.println("EventList: " + eventList);
        
        if (!eventList.isEmpty()){
            for (int i = 0; i < eventList.size(); i++) {
                EventEntity myEventItem = new EventEntity();
                myEventItem = eventList.get(i);
                eventItems.put(myEventItem.getName(), myEventItem);
            }
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

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String a = request.getRequestURI();
        if(a == null)
        {
            throw new IOException();
        }
        String [] parts = a.split("/");
        if(parts.length < 4)
        {
            request.setAttribute("Events", eventItems);
            RequestDispatcher dispatcher = request.getRequestDispatcher("events.jsp");
            dispatcher.forward(request, response);
        }
        else
        {
            String key = parts[3].replace("%20", " ");
            EventEntity eventItem = (EventEntity)eventItems.get(key);
            request.setAttribute("Events", eventItem);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/eventStory.jsp");
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
        }
    }
    
    private void changeEvent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        int eventID = Integer.parseInt(request.getParameter("eventID"));
        EventEntity event = new EventEntity();
        
        event = eventModel.GetEventByID(eventID);
        request.setAttribute("Events", event);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/editEvent.jsp");
        dispatcher.forward(request, response);
    }
    
       public java.sql.Date convertJavaDateToSqlDate(java.util.Date date) {
    return new java.sql.Date(date.getTime());
}
    
    private void CreateEvent(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String title = request.getParameter("eventTitle");
        String mDate = request.getParameter("eventDate");
        String location = request.getParameter("eventLocation");
        DateFormat format = new SimpleDateFormat("yyyy-mm-dd", Locale.ENGLISH);
        java.util.Date utilDate;
        java.sql.Date date = new java.sql.Date(2000, 01, 01);
        
        try {
            utilDate = format.parse(mDate);
            date = convertJavaDateToSqlDate(utilDate);
        } catch (ParseException e) {
            System.out.println("expection thrown");
            HttpSession session = request.getSession();
            session.setAttribute("error", "Failed to parse date field");
            System.out.println("false, exception");
            response.sendRedirect(request.getContextPath() + "/FailedNewEvent.jsp");
        }
        
        String description = request.getParameter("eventDescription");
        int theme = Integer.parseInt(request.getParameter("eventTheme"));

        EventModel event = new EventModel();

        try {
            if (title != null) {
                if (event.newEvent(title, description, location, date, theme) == false) {
                    System.out.println("false");
                    response.sendRedirect(request.getContextPath() + "/FailedNewEvent.jsp");
                } else {
                    response.sendRedirect(request.getContextPath() + "/Events");
                }

            } else {
                throw new IllegalArgumentException("No event title entered");
            }
        } catch (IOException | IllegalArgumentException e) {
            System.out.println("expection thrown");
            HttpSession session = request.getSession();
            session.setAttribute("error", "No event title entered.");
            System.out.println("false, exception");
            response.sendRedirect(request.getContextPath() + "/FailedNewEvent.jsp");
        }
    }
    
    
}