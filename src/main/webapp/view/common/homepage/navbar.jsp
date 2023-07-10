<%-- 
    Document   : navbar
    Created on : Jun 1, 2023, 7:56:47 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <section id="navbar">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a href="${pageContext.request.contextPath}/home" class="navbar-brand">Book Store</a>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a href="" class="nav-link">Home</a>
                    </li>
                    <li class="nav-item">
                        <a href="" class="nav-link">Feature</a>
                    </li>
                    <li class="nav-item">
                        <a href="" class="nav-link">Pricing</a>
                    </li>
                </ul>
                <form class="form-inline ml-auto mr-lg-3" action="search" method="GET">
                    <input class="form-control mr-sm-2" type="search"
                           placeholder="Search" aria-label="Search"
                           name="keyword">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
                <a href="${pageContext.request.contextPath}/cart">
                    <button class="btn btn-outline-dark mr-lg-3">
                        <i class="fa-solid fa-cart-shopping"></i>&nbsp;&nbsp;&nbsp;Cart
                    </button>
                </a>

                <c:if test="${sessionScope.account == null}">
                    <a href="${pageContext.request.contextPath}/login">
                        <button class="btn btn-outline-primary">
                            Login
                        </button>
                    </a>
                </c:if>
                <c:if test="${sessionScope.account != null}">
                    <a href="${pageContext.request.contextPath}/logout">
                        <button class="btn btn-outline-primary">
                            Logout
                        </button>
                    </a>
                    <a href="${pageContext.request.contextPath}/dashboard" class="ml-3">
                        <button class="btn btn-outline-success">
                            ${sessionScope.account.username}
                        </button>
                    </a>

                </c:if>
            </nav>
        </section>
    </body>
</html>
