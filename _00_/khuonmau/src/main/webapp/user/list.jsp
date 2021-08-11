<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/9/2021
  Time: 4:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form>
    <table border="1">
        <tr>
            <th>id</th>
            <th>name</th>
            <th>email</th>
            <th>country</th>
            <th>edit</th>
            <th>delete</th>
        </tr>

        <c:forEach var="user" items="${listUser}" >
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td><a href="/users?action=edit&id=${user.id}">Edit</a></td>
                <td><a href="/users?action=edit&id=${user.id}">delete</a></td>

            </tr>
        </c:forEach>
    </table>
</form>


</body>
</html>
