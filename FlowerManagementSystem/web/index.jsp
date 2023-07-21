<%-- 
    Document   : index.jsp
    Created on : Sep 30, 2022, 9:32:14 AM
    Author     : PhuHV
--%>

<%@page import="java.util.List"%>
<%@page import="sample.dao.PlantDAO"%>
<%@page import="sample.dto.Plant"%>
<%@page import="java.util.ArrayList"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>index</title>
        <link rel="stylesheet" href="asset/mycss.css" type="text/css" />

    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <section>
            <%
                String keyword = request.getParameter("txtsearch");
                String searchby = request.getParameter("searchby");
                ArrayList<Plant> list = new ArrayList<Plant>();
                String[] tmp = {"out of stock", "available"};
                if (keyword == null && searchby == null) //when the page is loaded, all products will be displayed
                {
                    list = PlantDAO.getPlants("", "");
                } else {
                    list = PlantDAO.getPlants(keyword, searchby); //only get products by name/category
                }
                pageContext.setAttribute("list", list);

            %>
            <div class="row m-3">
                <c:forEach var="p" items="${list}">
                    <div class="col-lg-6">
                        <table class="table table-info">
                            <tr>
                                <td class="p-2"><img src="${p.imgpath}" class="rounded-3" width="100" height="100"></td>
                                <td>Product ID: ${p.id}</td>
                                <td>Product name: ${p.name}</td>
                                <td>Price: ${p.price}$</td>
                                <td>Status: ${p.status}</td>
                                <td>Category: ${p.catename}</td>
                                <c:url var="addToCart" value="addToCart">
                                    <c:param name="pid" value="${p.id}"></c:param>
                                </c:url>
                                <c:url var="getPlant" value="getPlant">
                                    <c:param name="pid" value="${p.id}"></c:param>
                                </c:url>
                                <td style="width: 100px">
                                    <a class="btn btn-warning btn-sm m-1 text-nowrap" href="${addToCart}">Add to cart</a>
                                    <a class="btn btn-info btn-sm m-1 text-nowrap" href="${getPlant}">View detail</a>
                                </td>
                            </tr>
                        </table>
                    </div>
                </c:forEach>
            </div>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
