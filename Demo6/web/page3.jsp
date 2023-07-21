<%-- 
    Document   : page3
    Created on : Oct 14, 2022, 1:14:51 PM
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
        <jsp:useBean id="c" class="basic.Book" scope="request"></jsp:useBean>
        <jsp:getProperty name="c" property="id"/>
        <jsp:getProperty name="c" property="name"/>
        <jsp:getProperty name="c" property="price"/>
        <%= request.getParameter("test") %>
        <hr>
        ${requestScope.c.id}
        ${requestScope.c.name}
        ${requestScope.c.price}
        ${param.test}
    </body>
</html>
