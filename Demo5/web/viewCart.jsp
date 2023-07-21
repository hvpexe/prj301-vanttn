<%-- 
    Document   : viewCart
    Created on : Oct 7, 2022, 12:52:03 PM
    Author     : PhuHV
--%>

<%@page import="dao.PlantDAO"%>
<%@page import="dto.Plant"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <script>
        function warning() {
            var ans = window.confirm("co muon bo san pham nay?");
            return ans;
        }
    </script>
    <body>
        <%
            //lay cart trong session memory
            HashMap<String, Integer> cart = (HashMap<String, Integer>) session.getAttribute("cart");
            if (cart == null || cart.size() == 0) {
                out.print("<h2>nothing<h2>");
            } else {
        %>
        <h1>Thong tin gio hang</h1>
        <table>
            <%
                int sum = 0;
                for (String i : cart.keySet()) {
                    Plant p = PlantDAO.getPlant(Integer.parseInt(i));
            %>
            <form action="MainController" >
                <tr>
                    <td><%= i%></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><input type="number" value="<%= cart.get(i)%>" min="1" max="10" name="txtquantity"> </td>
                    <td>
                        <input type="hidden" value="<%= i%>" name="txtid">
                        <input type="submit" value="update" name="action">
                        <input type="submit" value="delete" name="action" onclick="return warning()">
                    </td>
                </tr>
            </form>
            <%
                sum = sum + cart.get(i);
            %>
            <%
                }
            %>
        </table>
        <h2>Tong tien thanh toan: <%= sum %> VND</h2>
        
        <%
            }
        %>
        <a href="MainController?action=saveorder">save order</a>
    </body>
</html>
