<%-- 
    Document   : manage
    Created on : Sep 9, 2022, 3:30:40 PM
    Author     : PhuHV
--%>

<%@page import="DTO.Account"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
            <thead>
            <th>email</th>
            <th>address</th>
            <th>status</th>
        </thead>
        <tbody>
            <%
                ArrayList<Account> list = (ArrayList<Account>) session.getAttribute("listAcc");
                for (Account acc : list) {
            %>

            <tr>
                <th><%= acc.getEmail()%></th>
                <th><%= acc.getAddress()%></th>
                <th><%= acc.getStatus()%></th>
                    <%
                        if (acc.getStatus() == 1) {
                    %>

                <th><a href="EditServlet?status=0&email=<%= acc.getEmail() %>">Ban</a></th>
                <th>Unban</th>
                    <%
                    } else {
                    %>

                <th>Ban</th>
                <th><a href="EditServlet?status=1&email=<%= acc.getEmail() %>">Unban</a></th>
                    <%
                        }
                    %>
            </tr>

            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>
