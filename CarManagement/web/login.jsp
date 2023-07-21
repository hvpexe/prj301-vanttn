<%-- 
    Document   : login.jsp
    Created on : Sep 30, 2022, 1:24:32 PM
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
        <form action="mainController" method="post">
            userID<input type="text" name="userid"> <br>
            password<input type="password" name="password"> <br>
            <input type="submit" name="action" value="login">
        </form>
        <%
            String s = (String) request.getAttribute("login_error");
            if (s != null) {
        %>
        <h3><%= s %></h3>
        <%
            }
        %>
    </body>
</html>
