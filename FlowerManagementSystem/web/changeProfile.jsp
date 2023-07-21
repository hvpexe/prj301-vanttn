<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String name = (String) session.getAttribute("name");
            String email = (String) session.getAttribute("email");
            if (name == null) {
        %>
        <p><font color="red">you must login to change profile page</font></p>
            <%
            } else {
            %>

        <header>
            <%@include file="header_loginedUser.jsp" %>
        </header>
        <section>
            <div class="d-flex justify-content-center align-items-center my-5">
                <div class="col-md-4 p-5 shadow-sm border rounded-3 border-primary bg-white">
                    <h2 class="text-center mb-4 text-primary">Edit profile</h2>
                    <form action="changeProfile" method="post">
                        <table class="w-100">
                            <tr>
                                <td>Full name</td>
                                <td>
                                    <input class="form-control border border-primary" type="text" name="txtname" value="${sessionScope.login.fullname}" required="">
                                </td>
                            </tr>
                            <tr>
                                <td>Phone</td>
                                <td>
                                    <input class="form-control border border-primary" type="text" name="txtphone" value="${sessionScope.login.phone}" required=""/>
                                </td>
                            </tr>
                        </table>
                        <div class="w-100">
                            <font style="color:red;">${requestScope.WARNING}</font>
                            <input class="btn btn-primary fw-bold d-flex mx-auto mt-3" type="submit" value="Save"/>
                        </div>
                    </form>

                </div>
            </div>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
        <%
            }
        %>
    </body>
</html>
