<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View plant</title>
    </head>
    <body>
        <!-- su dung EL -->
        <header>
            <%@include file="header.jsp" %>
        </header>

        <div class="container my-5">
            <div class="card border border-primary border-1 rounded-4 p-3">
                <div class="container-fliud">
                    <div class="wrapper row">
                        <div class="col-md-6">
                            <img class="border border-3 rounded-4 w-100" src="${plantObj.imgpath}" />
                        </div>
                        <div class="col-md-6">
                            <table class="table">
                                <tr><td><strong>ID:</strong></td><td>${plantObj.id}</td></tr>
                                <tr><td><strong>Product name:</strong></td><td>${plantObj.name}</td></tr>
                                <tr><td><strong>Price:</strong></td><td>${plantObj.price}$</td></tr>
                                <tr><td><strong>Description:</strong></td><td>${plantObj.description}</td></tr>
                                <tr><td><strong>Status:</strong></td><td>${plantObj.status}</td></tr>
                                <tr><td><strong>Category ID:</strong></td><td>${plantObj.cateid}</td></tr>
                                <tr><td><strong>Category name :</strong></td><td>${plantObj.catename}</td></tr>
                            </table>
                            <c:url var="addToCart" value="addToCart">
                                <c:param name="pid" value="${plantObj.id}"></c:param>
                            </c:url>
                            <a class="btn btn-warning" href="${addToCart}">Add to cart</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
