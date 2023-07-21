

<%@page import="sample.dao.OrderDAO"%>
<%@page import="sample.dto.OrderDetail"%>
<%@page import="java.util.ArrayList"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <%@include file="header_loginedUser.jsp" %>
        </header>
        <section>
            <h3 class="p-3 m-3 bg-success text-white">Welcome ${sessionScope.name} come back</h3>
            <a class="btn btn-secondary ms-3 mb-3" href="logout">Logout</a>
            <a class="btn btn-primary ms-3 mb-3" href="personal">view all orders</a>
        </section>
            <section class="mx-3">
            <c:if test="${list != null}">
                <table class="table order ">
                    <thead>
                        <tr>
                            <td>Order ID</td>
                            <td>Plant ID</td>
                            <td>Plant Name</td>
                            <td>Image</td>
                            <td>Price</td>
                            <td>Quantity</td>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="order" items="${list}">
                            <tr>
                                <td>${order.orderID}</td>
                                <td>${order.plantID}</td>
                                <td>${order.plantName}</td>
                                <td><img src='${order.imgPath}' width="100" height="100"></td>
                                <td>${order.price}</td>
                                <td>${order.quantity}</td>
                            </tr>
                        </c:forEach>
                    </tbody>

                </table>

                <h3 class="m-3"> Total money: ${totalMoney}</h3>

            </c:if>
            <c:if test="${list == null}">
                <p>You don't have any order</p>

            </c:if>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
