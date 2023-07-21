<%-- 
    Document   : page1
    Created on : Sep 27, 2022, 1:04:50 PM
    Author     : PhuHV
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="page2.jsp" %>
<%@page errorPage="errorPage.jsp" %>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%! //declaration
            String msg = "em yeu co";

            public String getMsg() {
                return msg;
            }
        %>

        <% //scriptlet
            int count = 10;
            out.print("<h1> count = " + count + "</h1>");
            session.setAttribute("count2", 500);
            Date d = new Date();
            out.print("<h1>Date: " + d.toString() + " </h1>");
        %>
        <h1><%= count%> </h1> <!--expression-->   
        <h1><%= this.getMsg()%></h1>
        <%
            int v = Integer.parseInt("100a");
            out.println("<h1>" + v + "<h1>");
        %>
    </body>
</html>
