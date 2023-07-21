<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap-5.2.2-dist/css/bootstrap.min.css" type="text/css" />
        <title>header</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light ">
            <div class="container-fluid">
                <ul class="navbar-nav d-flex justify-content-between mb-2 mb-lg-0 w-100">
                    <li class="nav-item align-self-center "><a class="nav-link" href="manageAccounts">Manage Accounts</a></li>
                    <li class="nav-item align-self-center "><a class="nav-link" href="manageOrders">Manage Orders</a></li>
                    <li class="nav-item align-self-center "><a class="nav-link" href="managePlants">Manage Plants</a></li>
                    <li class="nav-item align-self-center "><a class="nav-link" href="#">Manage categories</a></li>
                    <li class="nav-item align-self-center ">Welcome ${sessionScope.login.fullname} <a class="btn btn-secondary btn-sm" href="logout">Logout</a></li>

                </ul>
            </div>
        </nav>
    </body>
</html>
