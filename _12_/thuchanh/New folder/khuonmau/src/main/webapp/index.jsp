<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/6/2021
  Time: 8:48 PM
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
  <table border="1">
    <th>Id</th>
    <th>Tên</th>
    <th>Ngày Sinh</th>
  </tr>
<%--  VAR ĐẠI DIỆN CHO TỪNG OBJ TRONG LIST,ITEM CHÍNH LÀ LIST--%>
  <c:forEach var="studentObj" items="${studentListServlet}" >
  <tr>
    <td><c:out value="${studentObj.id}"/></td>
    <td><c:out value="${studentObj.name}"/></td>
    <td><c:out value="${studentObj.dateOfBirth}"/></td>
  </tr>
</c:forEach>

</table>
  </body>
</html>
