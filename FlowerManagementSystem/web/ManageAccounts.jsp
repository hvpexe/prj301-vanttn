<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage account</title>
        <link href="asset/mycss.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <c:import url="header_loginedAdmin.jsp"></c:import>
            <div class="px-4">
                <form action="searchAccount" method="post">
                    <div class="input-group d-flex w-50 my-3">
                        <input class="form-control" type="text" name="txtSearch" value="${sessionScope.txtsearch}">
                        <input class="btn btn-primary" type="submit" value="Search account">
                    </div>
                </form>

                <table class="table caption-top table-striped">
                    <thead class="table-success">
                        <tr>
                            <th> ID</th>
                            <th> Email</th>
                            <th> Full name</th>
                            <th> status</th>
                            <th> phone</th>
                            <th> role</th>
                            <th> action</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="acc" items="${requestScope.accountList}"> 
                        <tr>
                            <td><c:out value="${acc.getAccid()}"></c:out></td>
                            <td><c:out value="${acc.getEmail()}"></c:out></td>
                            <td><c:out value="${acc.getFullname()}"></c:out></td>
                                <td>
                                <c:choose>
                                    <c:when test="${acc.getStatus() eq 1}"> active</c:when>
                                    <c:otherwise>inActive</c:otherwise>
                                </c:choose>
                            </td>
                            <td><c:out value="${acc.getPhone()}"></c:out>
                                </td>
                                <td>
                                <c:choose>
                                    <c:when test="${acc.getRole() eq 1}"> admin</c:when>
                                    <c:otherwise>user</c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <c:if test="${acc.getRole() eq 0}"> <!-- only block/unblock account of the user -->
                                    <c:url var="mylink" value="updateStatusAccount">
                                        <c:param name="email" value="${acc.getEmail()}"></c:param>
                                        <c:param name="status" value="${acc.getStatus()}"></c:param>
                                    </c:url>
                                    <a class="btn btn-dark btn-sm" href="${mylink}">Block/Unblock</a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>
