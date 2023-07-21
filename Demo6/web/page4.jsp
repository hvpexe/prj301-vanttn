<%-- 
    Document   : page4
    Created on : Oct 14, 2022, 1:41:08 PM
    Author     : PhuHV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:set var="s" value="em yeu anh" scope="session"/>
        ${sessionScope.s}
        <c:out value="${sessionScope.s}"/>
        <c:set var="n1" value="100"/>
        <c:set var="n2" value="200"/>
        <c:if test="${n1 < n2}">
            <h1>em pass mon</h1>
        </c:if>
        <c:catch var="e" >
            <c:out value="${Integer.parseInt('a')}"/>
        </c:catch>
        <c:if test="${e != null}">
            <c:out value="${e}"/>
        </c:if>
        <hr>
        <c:set var="kq" value="${requestScope.result}"/>
        <c:forEach items="${kq}" var="item">
            <h5>
                ${item}
            </h5>
        </c:forEach>

        <c:forEach var="i" begin="1" end="10" step="2">
            <h4>${i}</h4>
        </c:forEach>
        <c:forTokens var="str" items="buoc toi deo, khong ngang" delims=",">
            <h3>${str}</h3>
        </c:forTokens>

        <c:url var="myurl" value="${requestScope.mylink}" />
        <a href="${myurl}">hihi</a>
        <c:redirect url="page5.jsp"></c:redirect>
    </body>
</html>
