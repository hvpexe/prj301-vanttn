<%-- 
    Document   : index
    Created on : Oct 18, 2022, 2:02:26 PM
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
        <form action="search" method="post">
            <input type="text" name="txtemail" placeholder="enter email"/> <br>
            <input type="submit" value="Find"/>

        </form>
        <form action="createAccount"> 
            <input type="submit" value="register">
        </form>
        <p><a href="test.jsp">open test page</a></p>
        <form action="login" method="post">
            <input type="text"/>
            <input type="submit" value="dang nhap"/>
        </form>
    </body>
</html>
