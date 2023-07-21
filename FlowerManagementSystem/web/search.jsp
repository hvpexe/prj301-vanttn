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
                    pageContext.setAttribute("list", list);
                } else {
                    list = PlantDAO.getPlants(keyword, searchby); //only get products by name/category
                }
            %>
            <div class="row container-fluid">
                <c:forEach var="p" items="${list}">
                    <table class="product col-6">
                        <tr class="">
                            <td class="p-2"><img src="${p.imgpath}" class="plantimg"></td>
                            <td>Product ID: ${p.id}</td>
                            <td>Product name: ${p.name}</td>
                            <td>Price: ${p.price}</td>
                            <td>Status: ${p.status}</td>
                            <td>Category: ${p.catename}</td>
                            <c:url var="addToCart" value="addToCart">
                                <c:param name="pid" value="${p.id}"></c:param>
                            </c:url>
                            <td><a class="btn btn-warning" href="${addToCart}">add to cart </a></td>
                        </tr>
                    </table>
                </c:forEach>
            </div>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>