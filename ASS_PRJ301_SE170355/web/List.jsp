<%-- 
    Document   : List.jsp
    Created on : 06/07/2023, 4:20:09 PM
    Author     : nhath
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="1px solid black">
            <tr>
                <th>uID</th>
                <th>User</th>
                <th>Pass</th>
                <th>RoleID</th>

            </tr>
            <c:forEach items="${listA}" var="o">
                <tr>
                    <td>${o.productID}</td>
                    <td>${o.productName}</td>
                    <td>${o.price}</td>
                    <td>${o.image}</td>

                </tr>
            </c:forEach>
        </table>
        <c:forEach begin ="1" end="${endP}" var="i">
            <a href="ListProduct?index=${i}">${i}</a>
        </c:forEach>
    </body>
</html>
