<%-- 
    Document   : index
    Created on : Jun 1, 2023, 7:41:31 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <script src="https://kit.fontawesome.com/65d7426ab6.js" crossorigin="anonymous"></script>

        <!--<link rel="stylesheet" href="../../../css/style.css">-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

    </head>

    <body>
        <!-- Navbar -->
        <jsp:include page="../../${initParam['homepagePathCommon']}/navbar.jsp" ></jsp:include>
        <!-- End Navbar -->

        <!-- Banner -->
        <jsp:include page="../../${initParam['homepagePathCommon']}/banner.jsp" ></jsp:include>
        

        <!-- Content -->
        <section id="content" class="row">
            <!-- Category -->
            <jsp:include page="../../${initParam['homepagePathCommon']}/category.jsp" ></jsp:include>
            <!-- Product -->
            <jsp:include page="../../${initParam['homepagePathCommon']}/product.jsp" ></jsp:include>
            
        </section>

        <!-- Pagination -->
        <jsp:include page="../../${initParam['homepagePathCommon']}/pagination.jsp" ></jsp:include>
        
        <!--Footer-->
        <jsp:include page="../../${initParam['homepagePathCommon']}/footer.jsp" ></jsp:include>
        

    </body>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
    crossorigin="anonymous"></script>
    <script src="test.js"></script>

</html>
