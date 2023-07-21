<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage plant</title>
         <link href="asset/mycss.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <c:import url="header_loginedAdmin.jsp">

        </c:import>
        <div class="px-4">
            <form action="searchPlant" method="post">
                <div class="input-group d-flex w-50 my-3">
                    <input class="form-control" type="text" name="txtSearch" value="">
                    <input class="btn btn-primary" type="submit" value="Search plant">
                </div>
            </form>

            <table class="table caption-top table-striped">
                <thead class="table-success">
                    <tr>
                        <th> PID</th>
                        <th> Image</th>
                        <th> Plant name</th>
                        <th> Description</th>
                        <th> Price</th>
                        <th> Category name</th>
                        <th> Status</th>
                        <th> action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="pla" items="${requestScope.plantList}"> 
                        <tr>
                            <td>${pla.id}</td>
                            <td>
                                <img src="${pla.imgpath}" class="rounded-3 border border-success" width="100" height="100">
                            </td>
                            <td>${pla.name}</td>
                            <td>${pla.description}</td>
                            <td>${pla.price}</td>
                            <td>${pla.catename}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${pla.status == 1 }">
                                        available
                                    </c:when>
                                    <c:when test="${pla.status == 0 }">
                                        out of stock
                                    </c:when>
                                </c:choose>
                            </td>
                            <td>
                                
                                <c:url var="getPlant" value="getPlant">
                                    <c:param name="pid" value="${pla.id}"></c:param>
                                </c:url>
                                <a class="btn btn-info btn-sm m-1 text-nowrap" href="${getPlant}">View detail</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>
