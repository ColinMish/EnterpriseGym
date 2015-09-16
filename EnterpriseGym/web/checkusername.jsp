<%--
    Document   : checkusername
    Created on : 9 May, 2013, 12:42:25 PM
    Author     : Aravind Sankaran
--%>

<%@ page import="java.io.*,java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<% 
                    String sn=request.getParameter("ver");
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con =DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/enterprise_gym","davidkenny","root1");
                    Statement st=con.createStatement();
                    ResultSet rs = st.executeQuery("select * from user_profile where username='"+sn+"'");  // this is for name
                    if(rs.next())
                    {   %>
                        <font color=red>
                        Name taken
                        <input type="hidden" id="actual" name="actual" value="taken">
                        </font>

                   <% }else {%>
                        <font color=green>
                        <input type="hidden" id="actual" name="actual" value="available">
                        Available
                        </font>
                   <% }%>
                    
     <%               
rs.close();
st.close();
con.close();
%>
