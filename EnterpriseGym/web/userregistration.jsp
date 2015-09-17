<%--
    Document   : userregistration
    Created on : 17 May, 2013, 11:22:42 AM
    Author     : Aravind Sankaran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
          function validateForm()
            {  
            var x=document.forms["login"]["username"].value;
            var y=document.getElementById('actual').value;            
            
                if (y=="taken")
                {
                       alert("Name already exist in database");
                    return false;
                }else
                {
                        alert("No name exist");
                }
                    
                    
             }
        </script>
        <script type="text/javascript">
function loadXMLDoc()
{
var xmlhttp;
var k=document.getElementById("username").value;
var urls="checkusername.jsp?ver="+k;

if (window.XMLHttpRequest)
  {
  xmlhttp=new XMLHttpRequest();
  }
else
  {
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4)
    {
        document.getElementById("err").innerHTML=xmlhttp.responseText;
     }
  }
xmlhttp.open("GET",urls,true);
xmlhttp.send();
}
</script>
    </head>
    <body bgcolor="black">
        <form name="login" method="get" action="" >
        <p>
    <center>
        <font color="white">User Name: </font><input type="text" name="username" id="username" onkeyup="loadXMLDoc()"><br>
        <span id="err"> </span>
    </center>
        </p>
        </form>
    </body>
</html>