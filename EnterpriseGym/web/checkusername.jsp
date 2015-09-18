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
                    Connection con =DriverManager.getConnection("jdbc:mysql://160.153.16.42:3306/Enterprise_Gym","davidkenny","root1");
                    Statement st=con.createStatement();
                    ResultSet rs = st.executeQuery("select * from account where username='"+sn+"'");  // this is for name
                    if(sn == "")
                    { %>
                        <div class='alert alert-warning fade in'><p>Please Enter a Username.</p></div>
                    <%}
                    else if(rs.next())
                    {   %>
                        <div class='alert alert-danger fade in'><p>Username already exists.</p></div>
                   <%}
                    else {%>
                        <div class='alert alert-success fade in'><p>Username is available.</p></div>
                   <%}%>
                    
     <%               
rs.close();
st.close();
con.close();
%>
