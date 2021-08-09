<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/9/2021
  Time: 11:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>User Management</h1>
<div align="center">
    <h2>
        <a href="users?action=users">List All Users</a>
    </h2>
    <table border="1" cellpadding="5">
        <h2>List of Result</h2>
        <p>
            <c:if test='${requestScope["msg"] != null}'>
                <span class="message" style="color: green">${requestScope["msg"]}</span>
            </c:if>
        </p>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
        </tr>
        <c:forEach var="user" items="${listUser}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
