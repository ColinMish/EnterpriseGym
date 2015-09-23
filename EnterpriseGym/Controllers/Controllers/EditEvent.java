/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Models.EventModel;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lib.Convertors;

/**
 *
 * @author colin
 */
@WebServlet(name = "EditEvent", urlPatterns = {"/EditEvent, editEvent.jsp"})
public class EditEvent extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditEvent</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditEvent at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
  @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
                  RequestDispatcher dispatcher = request.getRequestDispatcher("editEvent.jsp");
                dispatcher.forward(request, response);
                System.out.println("Edit event request received");
                        EventModel event = new EventModel();

        /*try {
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
    }*/
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
        System.out.println("Edit event request received");
        ChangeEvent(request, response);
    }
    
        private void ChangeEvent(HttpServletRequest request, HttpServletResponse response) throws IOException {
            System.out.println("Edit event request received");
        }
        

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
