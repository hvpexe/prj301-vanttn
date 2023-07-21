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
            <%@include file="header.jsp" %>
        </header>
        <section>
            <div class="d-flex justify-content-center align-items-center my-5">
                <div class="col-md-4 p-5 shadow-sm border rounded-3 border-primary bg-white">
                    <h2 class="text-center mb-4 text-primary">Register</h2>

                    <form action="register" method="post">
                        <table class="w-100">
                            <tr>
                                <td>email</td>
                                <td>
                                    <input class="form-control border border-primary" type="text" name="txtemail" required="" value="${requestScope.txtemail}" pattern="^(\w)+@[a-zA-Z]+([.](\w)+){1,2}">
                                </td>
                            </tr>
                            <tr>
                                <td>full name</td>
                                <td><input class="form-control border border-primary" type="text" name="txtfullname" required="" value="${requestScope.txtfullname}">
                                </td>
                            </tr>
                            <tr>
                                <td>password</td>
                                <td>
                                    <input class="form-control border border-primary" type="password" name="txtpassword" required="" value="${requestScope.txtpassword}">
                                </td>
                            </tr>
                            <tr>
                                <td>phone</td>
                                <td>
                                    <input class="form-control border border-primary" type="text" name="txtphone" value="${requestScope.txtphone}">
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>${requestScope.ERROR}</td>
                            </tr>
                        </table>
                        <div class="w-100">
                            <input class="btn btn-primary fw-bold d-flex mx-auto mt-3" type="submit">
                        </div>
                    </form>
                </div>

        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
