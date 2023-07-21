<%-- 
    Document   : page1
    Created on : Oct 14, 2022, 12:46:23 PM
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
        <!-- 
            điều kiện dùng usebean:
            - dùng access modifier private cho field
            - field đặt tên đúng chuẩn: camelCase
            - constructor chuẩn
            - lớp để trong 1 package
            - class phải implement serialize
            => bean là lớp java căn bản, đạt các tiêu chuẩn trên
        -->
        <jsp:useBean id="b" class="basic.Book" scope="session">
            <jsp:setProperty name="b" property="id" value="1"/>
            <jsp:setProperty name="b" property="name" value="phu huynh"/>
            <jsp:setProperty name="b" property="price" value="999"/>
        </jsp:useBean>
        <!-- xuat book b trong session memory -->
        <jsp:getProperty name="b" property="id"/>
        <jsp:getProperty name="b" property="name"/>
        <jsp:getProperty name="b" property="price"/>

        <a href="page2.jsp"> page 2</a>

        <hr>

        ${100}<br>
        ${10 + 20}<br>
        ${10 > 20}<br>
        ${null}<br>
        ${b.id}<br>

        <jsp:include page="footer.jsp"/>

    </body>
</html>
