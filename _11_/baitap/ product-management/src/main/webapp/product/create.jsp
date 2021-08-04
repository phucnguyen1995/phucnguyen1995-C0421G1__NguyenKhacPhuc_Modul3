<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/4/2021
  Time: 9:57 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .message{
            color:green;
        }
    </style>
</head>
<body>
<h1>Create new product</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/products">Back toproduct list</a>
</p>
<form method="post">
    <fieldset>
        <legend>Product information</legend>
        <table>
            <tr>
                <td>STT </td>
                <td><input type="text" name="id"></td>
            </tr>
            <tr>
                <td>Tên Sản Phẩm: </td>
                <td><input type="text" name="name" ></td>
            </tr>
            <tr>
                <td>Gía </td>
                <td><input type="text" name="price"></td>
            </tr>

            <tr>
                <td>Mô tả </td>
                <td><input type="text" name="description"></td>
            </tr>

            <tr>
                <td>Nhà Sản Xuất </td>
                <td><input type="text" name="producer"></td>
            </tr>

            <tr>
                <td></td>
                <td><input type="submit" value="Create product"></td>
            </tr>
        </table>
    </fieldset>
</form>

</body>
</html>
