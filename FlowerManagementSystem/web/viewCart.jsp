<%@page import="sample.dto.Plant"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View cart</title>
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <c:if test="${sessionScope.login != null}">
            <section>
                <h3 class="p-3 m-3 bg-success text-white">Welcome ${sessionScope.login.fullname} come back</h3>
                <a class="btn btn-secondary ms-3" href="logout">Logout</a>
            </section>
        </c:if>
        <a class="btn btn-primary ms-3 mt-3" href="personal">personal page</a>

        <section class="container-fluid"> 
            <font style="color:red;">${requestScope.WARNING}</font>
            <%
                HashMap<Plant, Integer> cart = (HashMap<Plant, Integer>) session.getAttribute("cart");
                if (cart != null && !cart.isEmpty()) {
                    Set<Plant> plants = cart.keySet();
                    int total = 0;
                    for (Plant plant : plants) {
                        int quantity = cart.get(plant);
                        total += quantity * plant.getPrice();
            %>
            <table class="table mt-3 w-100">
                <thead class="table-primary">
                    <tr>
                        <td>Product ID</td>
                        <td>Image</td>
                        <td class="w-25">Product Name</td>
                        <td>Price</td>
                        <td>Quantity</td>
                        <td>Money</td>
                        <td>Action</td>
                    </tr>
                </thead>

                <tbody>
                <form action="updateCart" method="post">
                    <tr>
                        <td>
                            <input type="hidden" value="<%= plant.getId()%>" name="pid">
                            <c:url var="getPlant" value="getPlant">
                                <c:param name="pid" value="<%= Integer.toString(plant.getId())%>"></c:param>
                            </c:url>
                            <a href="${getPlant}"><%= plant.getId()%></a>
                        </td>
                        <td>
                            <img src="<%= plant.getImgpath()%>" width="100" height="100">
                        </td>
                        <td>
                            <%= plant.getName()%>
                        </td>
                        <td>
                            <%= plant.getPrice()%>
                        </td>
                        <td>
                            <input type="number" value="<%= quantity%>" name="quantity">
                        </td>
                        <td>
                            <%= quantity * plant.getPrice()%>
                        </td>
                        <td>
                            <input type="submit" value="update" name="action">
                            <input type="submit" value="delete" name="action">
                        </td>
                    </tr>
                </form>
                </tbody>

            </table>
            <%
                }%>
            <div>Total money: <%= total%> </div>
            <div>Order Date: <%= (new Date()).toString()%> </div>
            <div>Ship Date: N/A </div>
            <form action="saveShoppingCart" method="post">
                <input class="btn btn-success" type="submit">
            </form>
            <%
            } else {
            %>
            <h2 class="text-center fst-italic py-5">Your cart is empty</h2>
            <%
                }
            %>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
