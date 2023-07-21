<%@page import="sample.dao.AccountDAO"%>
<%@page import="sample.dto.Account"%>
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
            <h3 class="p-3 m-3 bg-success text-white">Welcome ${sessionScope.login.fullname} come back</h3>
            <h3><a class="btn btn-secondary ms-3" href="logout">Logout</a></h3>
        </section>
        <section class="mx-3">
            <!-- load all orders of the user at here -->
            <c:if test="${list != null}">
                <table class="table order">
                    <thead>
                        <tr>
                            <td>Order ID</td>
                            <td>Order Date</td>
                            <td>Ship Date</td>
                            <td>Order's status</td>
                            <td>Action</td>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                    <c:forEach var="order" items="${list}">
                        <tr>
                            <td>${order.orderID}</td>
                            <td>${order.orderDate}</td>
                            <td>${order.shipDate}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${order.status == 1 }">
                                        processing
                                    </c:when>
                                    <c:when test="${order.status == 2 }">
                                        completed
                                    </c:when>
                                    <c:when test="${order.status == 3 }">
                                        cancelled
                                    </c:when>
                                </c:choose>
                            </td>
                            <td>
                                <c:url var="orderDetail" value="orderDetail">
                                    <c:param name="orderid" value="${order.orderID}"></c:param>
                                </c:url>
                                <a class="btn btn-info btn-sm" href="${orderDetail}">Detail</a>

                                <c:if test="${order.status == 1}">
                                    <c:url var="updateOrder" value="updateOrder">
                                        <c:param name="action" value="cancel"></c:param>
                                        <c:param name="orderid" value="${order.orderID}"></c:param>
                                    </c:url>
                                    <a class="btn btn-danger btn-sm" href="${updateOrder}">Cancel order</a>
                                </c:if>

                                <c:if test="${order.status == 3}">
                                    <c:url var="updateOrder" value="updateOrder">
                                        <c:param name="action" value="again"></c:param>
                                        <c:param name="orderid" value="${order.orderID}"></c:param>
                                    </c:url>
                                    <a class="btn btn-warning btn-sm" href="${updateOrder}">Order again</a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </table>

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
