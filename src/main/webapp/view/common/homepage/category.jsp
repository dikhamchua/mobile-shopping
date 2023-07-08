<%-- 
    Document   : category
    Created on : Jun 1, 2023, 7:58:51 PM
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
        <section class="category col-md-2">
            <ul class="list-group">
                <c:forEach items="${listCategories}" var="category">
                    <li class="list-group-item"><a href="category?id=${category.id}">${category.name}</a></li>
                </c:forEach>
            </ul>
        </section>
    </body>
</html>
