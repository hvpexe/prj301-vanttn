<%-- 
    Document   : page3
    Created on : Sep 27, 2022, 1:44:07 PM
    Author     : PhuHV
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ArrayList<String> kq = (ArrayList<String>) request.getAttribute("result");
            if (kq != null && kq.size() > 0) {
        %>
        <table>
            <tr>
                <th>ten item</th>
            </tr>
            <%
                for (String s : kq) {
            %>
            <tr> 
                <td><%= s%></td>
            </tr>
            <%
                } //het for
            %>

        </table>
        <%
            } else {

            }
        %>

    </body>
</html>
