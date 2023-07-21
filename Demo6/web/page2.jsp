<%-- 
    Document   : page2
    Created on : Oct 14, 2022, 1:05:24 PM
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
        <jsp:useBean id="b" class="basic.Book" scope="session"/>
        <jsp:getProperty name="b" property="id"/>
        <jsp:getProperty name="b" property="name"/>
        <jsp:getProperty name="b" property="price"/>
        
        <jsp:useBean id="c" class="basic.Book" scope="request">
            <jsp:setProperty name="c" property="id" value="2"/>
            <jsp:setProperty name="c" property="name" value="fall in love"/>
            <jsp:setProperty name="c" property="price" value="2000"/>
        </jsp:useBean>
        <jsp:forward page="page3.jsp">
            <jsp:param name="test" value="testing" />
        </jsp:forward>

    </body>
</html>
