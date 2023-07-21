<%-- 
    Document   : index
    Created on : Oct 18, 2022, 1:12:49 PM
    Author     : PhuHV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="Servlet1" method="post">
            <input type="text" name="txtemail" placeholder="enter email" /> <br>
            <input type="text" name="txtpassword" placeholder="enter password" /> <br>
            <input type="text" name="txtfullname" placeholder="enter fullname" /> <br>
            <input type="submit" value="register" /> <br>
        </form>
        ${param.error}
        <hr>
        <a href="Servlet2">Open servlet 2</a>
    </body>
</html>
