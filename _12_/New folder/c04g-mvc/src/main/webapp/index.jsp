<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/5/2021
  Time: 8:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <h2>Student List</h2>
  <p>${msg}</p>
<table border="1">
  <tr>
    <th>id </th>
    <th>tên </th>
    <th>sdt </th>
    <th colspan="2">Action</th>
  </tr>

  <c:forEach var="studentObj" items="${studentListServlet}" >
    <tr>

      <td><c:out value="${studentObj.studentId}"/></td>
      <td><c:out value="${studentObj.studentName}"/></td>
      <td><c:out value="${studentObj.phone}"/></td>
      <td>
        <a href="/student?actionClient=update&studentId=${studentObj.studentId}">update</a>
      </td>

      <td>
        <a href="/student?actionClient=delete&studentId=${studentObj.studentId}">delete</a>
      </td>

    </tr>
  </c:forEach>
</table>

  </body>
</html>
