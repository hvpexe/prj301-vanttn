<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login</title>
        <link rel="stylesheet" href="asset/mycss.css" type="text/css" />

    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <section>
            <div class="d-flex justify-content-center align-items-center my-5">
                <div class="col-md-4 p-5 shadow-sm border rounded-3 border-primary bg-white">
                    <h2 class="text-center mb-4 text-primary">Login</h2>
                    <form action="login" method="post">
                        <table class="w-100">
                            <tr>
                                <td>email</td>
                                <td>
                                    <input class="form-control border border-primary" type="email" name="txtemail" required="">
                                </td>
                            </tr>
                            <tr>
                                <td>password</td>
                                <td>
                                    <input class="form-control border border-primary" type="password" name="txtpassword" required=""/>
                                </td>
                            </tr>
                        </table>
                        <div class="w-100">
                            <font style="color:red;">${requestScope.WARNING}</font>
                            <input class="mt-3" type="checkbox" value="savelogin" name="savelogin"/>Stay signed in
                            <input class="btn btn-primary fw-bold d-flex mx-auto mt-3" type="submit"/>
                        </div>
                    </form>

                </div>
            </div>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
