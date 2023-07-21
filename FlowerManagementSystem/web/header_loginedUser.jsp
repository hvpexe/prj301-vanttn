<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap-5.2.2-dist/css/bootstrap.min.css" type="text/css" />
        <link rel="stylesheet" href="asset/mycss.css" type="text/css" />
        <title></title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light ">
            <div class="container-fluid">
                <ul class="navbar-nav d-flex justify-content-between mb-2 mb-lg-0 w-100">
                    <li class="nav-item align-self-center "><a class="nav-link" href="index.jsp">Home</a></li>
                    <li class="nav-item align-self-center "><a class="nav-link" href="changeProfile.jsp">Change profile</a></li>
                    <li class="nav-item align-self-center "><a class="nav-link" href="completedOrder">Completed orders</a></li>
                    <li class="nav-item align-self-center "><a class="nav-link" href="cancelledOrder">Cancelled orders</a></li>
                    <li class="nav-item align-self-center "><a class="nav-link" href="processingOrder">Processing orders</a></li>
                    <li class="nav-item align-self-center "><a class="nav-link" href="viewCart.jsp">Your cart</a></li>

                    <li class="nav-item align-self-center">
                        <form action="filterOrder">
                            From<input type="date" name="from" value="${from}" required=""> 
                            to <input type="date" name="to" value="${to}" required="">
                            <input class="btn btn-primary btn-sm" type="submit" value="search">
                        </form>
                    </li>
                </ul>
            </div>
        </nav>
    </body>
</html>
