package Controllers;


import Entities.EventEntity;
import Models.EventModel;
import java.io.IOException;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dave
 */
@WebServlet(name = "Events", urlPatterns = {"/Events/*"})
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
    }
}