<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage order</title>
        <link href="asset/mycss.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <c:import url="header_loginedAdmin.jsp"></c:import>
            <div class="px-4">
                <!--                <form action="searchAccount" method="post">
                                    <div class="input-group d-flex w-50 my-3">
                                        <input class="form-control" type="text" name="txtSearch" value="">
                                        <input class="btn btn-primary" type="submit" value="Search account">
                                    </div>
                                </form>-->

                <table class="table caption-top table-striped">
                    <thead class="table-success">
                        <tr>
                            <th> ID</th>
                            <th> Order Date</th>
                            <th> Ship Date</th>
                            <th> Status</th>
                            <th> AccID</th>
                            <th> action</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="ord" items="${requestScope.orderList}"> 
                        <tr>
                            <td>${ord.orderID}</td>
                            <td>${ord.orderDate}</td>
                            <td>${ord.shipDate}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${ord.status == 1 }">
                                        processing
                                    </c:when>
                                    <c:when test="${ord.status == 2 }">
                                        completed
                                    </c:when>
                                    <c:when test="${ord.status == 3 }">
                                        cancelled
                                    </c:when>
                                </c:choose>
                            </td>
                            <td>${ord.accID}</td>
                            <td>
                                <a class="btn btn-info btn-sm" href="${orderDetail}">Detail</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>
