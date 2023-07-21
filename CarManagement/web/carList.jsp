<%-- 
    Document   : carList
    Created on : Sep 30, 2022, 1:40:04 PM
    Author     : PhuHV
--%>

<%@page import="dto.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% User user = (User) session.getAttribute("login");%>
        <h1>Wecome <%= user.getFullname()%></h1>
        <a href="mainController?action=logout">Logout</a>
        <form action="mainController" method="post">
            id <input type="text" name="id"> <br>
            name <input type="text" name="name"> <br>
            description <input type="text" name="description"> <br>
            price <input type="text" name="price"> <br>
            speed <input type="number" name="speed"> <br>
            <input type="submit" name="action" value="create">
        </form>
        <%
            String s = (String) request.getAttribute("create_success");
            if (s != null) {
        %>
        <%= s%>
        <%
            }
        %>
    </body>
</html>
