<%-- 
    Document   : errorPage
    Created on : Sep 27, 2022, 1:33:17 PM
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
        <h1>Something wrong</h1>
        <h1><%= exception.getMessage() %></h1>

    </body>
</html>
