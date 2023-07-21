<%-- 
    Document   : test
    Created on : Oct 27, 2022, 7:02:35 PM
    Author     : PhuHV
--%>

<%@page import="java.sql.Connection"%>
<%@page import="mylib.DBUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            try {
                Connection cn = DBUtils.makeConnection();   %>
        <h1>connect!!!</h1>
        <%
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        %>
    </body>
</html>
