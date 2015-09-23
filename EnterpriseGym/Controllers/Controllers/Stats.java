/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Models.AdminModel;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.LinkedList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lib.Convertors;
import lib.SearchResultsObject;

/**
 *
 * @author Dave
 */
@WebServlet(name = "Stats", urlPatterns = {"/Stats/*", "/Data/*", "/UserEvent/*", "/Search/*"})
@MultipartConfig
public class Stats extends HttpServlet {

    /**
     * Constructor
     */
    public Stats() {

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
        String resultsAsJson = "";
        String[] parts = Convertors.SplitRequestPath(request);
        if (parts.length == 2) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("stats.jsp");
            dispatcher.forward(request, response);
        } else if (parts.length == 3 && parts[1].equals("Stats")) {
            resultsAsJson = getColumnNames(parts[2]);
        } else if (parts.length == 4 && parts[1].equals("Data")) {
            resultsAsJson = getDataCountByField(parts[3], parts[2]);
        } else if (parts[1].equals("UserEvent")) {
            resultsAsJson = getUsersVsEventsData(parts[2], parts[3]);
        }
        else if(parts[1].equals("Search"))
        {
            resultsAsJson = getSearchResults(parts[2], parts[3]);
        }
        try (PrintWriter out = response.getWriter()) {
            out.print(resultsAsJson);
            out.flush();
            out.close();
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

    private String getColumnNames(String part) {
        String json = "";
        AdminModel aModel = new AdminModel();
        if (part.equals("user") || part.equals("event")) {
            LinkedList columnNames = aModel.getColumnNames(part);
            json = new Gson().toJson(columnNames);
        } else {
            LinkedList valueNames = aModel.getUniqueValuesFromUser(part);
            json = new Gson().toJson(valueNames);
        }
        return json;
    }

    private String getDataCountByField(String field, String table) {
        AdminModel aModel = new AdminModel();
        ArrayList results = aModel.getDatabyFieldAsPercent(field, table);
        String json = new Gson().toJson(results);
        return json;
    }

    private String getUsersVsEventsData(String field, String value) {
        AdminModel aModel = new AdminModel();
        ArrayList results =null;
        String json;
        if (field.equals("None") && value.equals("None")) {
            results = aModel.getAllEventsWithAttendance();
        } else 
        {
            results = aModel.getAttendanceWithFilters(field, value);
        }
        json = new Gson().toJson(results);
        return json;
    }

    private String getSearchResults(String table, String searchValue) 
    {
        AdminModel aModel = new AdminModel();
        SearchResultsObject results = aModel.getSearchResults(table, searchValue);
        String json = new Gson().toJson(results);
        return json;
    }
}
