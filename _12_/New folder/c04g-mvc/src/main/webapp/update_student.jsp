<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/6/2021
  Time: 11:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>update student</h2>
<p>${msg}</p>
<form action="/student" method="post">
    <input type="hidden" name="actionClient" value="update"/>
    <input type="hidden" name="studentId" value="${studentObj.studentId}"/>
    <p>Name</p>
    <input type="text" name="studentName" value="${studentObj.studentName}"/>
    <p>Số Điện Thoại</p>
    <input type="text" name="phone" value="${studentObj.phone}"/>
    <input type="submit" value="update"/>
</form>

</body>
</html>
