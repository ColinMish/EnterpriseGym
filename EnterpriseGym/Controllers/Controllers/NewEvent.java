package Controllers;


import Models.EventModel;
import java.io.IOException;
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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Locale;
import java.text.ParseException;

/**
 *
 * @author Colin
 */
@WebServlet(name = "NewEvent", urlPatterns = {"/NewEvent"})
@MultipartConfig
public class NewEvent extends HttpServlet {

    /**
     * Constructor
     */
    public NewEvent() {

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
                  RequestDispatcher dispatcher = request.getRequestDispatcher("newEvent.jsp");
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
            case "NewEvent":
                CreateEvent(request, response);
                break;
        }
    }
    
    public java.sql.Date convertJavaDateToSqlDate(java.util.Date date) {
    return new java.sql.Date(date.getTime());
}
    
    private void CreateEvent(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String title = request.getParameter("eventTitle");
        String mDate = request.getParameter("eventDate");
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
                if (event.newEvent(title, description, date, theme) == false) {
                    System.out.println("false");
                    response.sendRedirect(request.getContextPath() + "/FailedNewEvent.jsp");
                } else {
                    response.sendRedirect(request.getContextPath() + "/events.jsp");
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