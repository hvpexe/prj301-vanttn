<%-- 
    Document   : LoginPage
    Created on : Sep 27, 2022, 2:33:03 PM
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
        <form action="MainController" method="post">
            <input type="text" name="txtemail"/> <br>
            <input type="password" name="txtpassword"/> <br>
            <input type="submit" name="action" value="login"/>
        </form>
        <p><% 
            String error = (String) request.getAttribute("error");
            if (error != null && !error.isEmpty()) {
                out.print(error);
            }
            %></p>
    </body>
</html>
