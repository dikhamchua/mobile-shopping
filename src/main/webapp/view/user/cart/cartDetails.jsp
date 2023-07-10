<%-- 
    Document   : productDetails
    Created on : Jul 9, 2023, 12:29:28 PM
    Author     : ADMIN
--%>


<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!-- Bootstrap CDN -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />

        <!-- CSS stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles-item.css" />

        <!-- Font Awesome -->
        <script src="https://kit.fontawesome.com/65d7426ab6.js" crossorigin="anonymous"></script>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Navbar -->
        <jsp:include page="../../common/homepage/navbar.jsp" ></jsp:include>

            <!--Cart Details-->
            <section id="cart-details">
            <c:if test="${sessionScope.cart.size() == 0 || sessionScope.cart == null}">
                <h1>Shopping Cart Is Empty</h1>
            </c:if>

            <!--Shopping cart have order-->
            <c:if test="${sessionScope.cart.size() != 0}">
                <h1>Shopping Cart</h1>
                <table class="table table-hover">
                    <thead class="thead-light">
                        <tr>
                            <th scope="col">No</th>
                            <th scope="col">Image</th>
                            <th scope="col">Name</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Price</th>
                            <th scope="col">Amount</th>
                            <th scope="col">Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${sessionScope.cart}" var="orderDetails" varStatus="status">
                            <tr>
                                <fmt:setLocale value = "en_US"/>
                                <th scope="row">${status.index + 1}</th>

                                <!--Image-->
                                <td>
                                    <img src="${orderDetails.value.book.image}" 
                                         width = "100" height = "100" alt="alt"/> 
                                </td>
                                <!--Name-->
                                <td>${orderDetails.value.book.name}</td>

                                <!--Quantity-->
                                <td>
                                    <form action="order-update" method ="GET">
                                        <input type="hidden"
                                               name="productID" 
                                               value="${orderDetails.value.book.id}" />
                                        <input onchange="this.form.submit()" 
                                               type="number"
                                               min ="1"
                                               name="quantity"
                                               value="${orderDetails.value.quantity}" />
                                    </form>
                                </td>

                                <!--Price-->
                                <td>
                                    <p>${String.format("%.2f", orderDetails.value.book.price)}</p>
                                </td>

                                <!--Amount-->
                                <td>
                                    <p>${String.format("%.2f", orderDetails.value.book.price * orderDetails.value.quantity)}</p>

                                </td>

                                <!--Delete action-->
                                <td>
                                    <a href="order-delete?productID=${orderDetails.key}">
                                        <i class="fa-solid fa-trash fa-2x text-danger"></i>
                                    </a> 
                                </td>
                            </tr>

                        </c:forEach>
                        <tr>
                            <td></td>
                            <td>
                                <h3>Total Money</h3>
                            </td>
                            <td colspan="3"></td>
                            <td>
                                <h3>
                                    <fmt:formatNumber type="currency"
                                                      value="${requestScope.totalMoney}"
                                                      maxFractionDigits="2">
                                    </fmt:formatNumber>
                                </h3>
                            </td>
                            <td colspan="1"></td>
                        </tr>
                    </tbody>
                </table>
                <!--                <a class="btn btn-info btn-lg text-white" href="check-out">
                                    Check Out
                                </a>-->

            </c:if>

        </section>

    </body>

    <!-- Bootstrap Scripts -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
    crossorigin="anonymous"></script>
</html>
