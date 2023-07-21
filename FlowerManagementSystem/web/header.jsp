<%-- 
    Document   : header
    Created on : Sep 30, 2022, 9:25:01 AM
    Author     : PhuHV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header</title>
        <link rel="stylesheet" href="asset/mycss.css" type="text/css" />
        <link rel="stylesheet" href="bootstrap-5.2.2-dist/css/bootstrap.min.css" type="text/css" />

    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-lg navbar-light ">
                <div class="container-fluid">
                    <ul class="navbar-nav d-flex justify-content-between mb-2 mb-lg-0 w-100">
                        <li class="nav-item align-self-center "><a class="navbar-brand" href="index.jsp"><img src="images/logo.jpg" id="logo"></a></li>
                        <li class="nav-item align-self-center "><a class="nav-link" href="index.jsp">Home</a></li>
                        <li class="nav-item align-self-center "><a class="nav-link" href="registration.jsp">Register</a></li>
                        <li class="nav-item align-self-center "><a class="nav-link" href="login.jsp">Login</a></li>
                        <li class="nav-item align-self-center "><a class="nav-link" href="viewCart.jsp">View cart</a></li>
                        <li class="nav-item align-self-center">
                            <form action="index.jsp" method="post">
                                <div class="d-flex">
                                    <input style="width: unset" class="form-control" type="text" placeholder="Search" name="txtsearch" value="${param.txtsearch}">
                                    <select class="form-select" name="searchby">
                                        <option value="byname">by name</option>
                                        <option value="bycate">by category</option>
                                    </select>
                                    <input  class="btn btn-outline-success" type="submit">
                                </div>
                            </form>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
    </body>
</html>
