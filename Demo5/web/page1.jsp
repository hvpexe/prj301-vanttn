<%-- 
    Document   : page1
    Created on : Oct 4, 2022, 1:17:29 PM
    Author     : PhuHV
--%>

<%@page import="dto.Plant"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <p><a href="MainController?action=view">View cart</a></p>
        <form  action="MainController" method="post">
            <input type="text" name="txtemail" />
            <input type="password" name="txtpassword"/>
            <input type="submit" value="login" name="action"/>
        </form>
        <form action="MainController" method="post"> 
            <input type="text" name="txtsearch" value="${param.txtsearch}"/>
            <input type="submit" name="action" value="find"/>
        </form>
        <c:set var="kq" value="${requestScope.result}"/>
        <c:if test="${kq != null}">
            <c:forEach var="p" items="${kq}">
                <p>
                    <form action="MainController" method="post">
                        ${p.id}
                        ${p.name}
                        <input type="hidden" value="${p.id}" name="txtid"/>
                        <input type="submit" value="add to cart" name="action"/>
                    </form>
                </p>
            </c:forEach>
        </c:if>
        <a href="MainController?action=more">see more</a>

</body>
</html>
