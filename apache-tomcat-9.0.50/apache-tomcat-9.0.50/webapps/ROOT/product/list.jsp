<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/4/2021
  Time: 10:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Products</h1>
<p>
    <a href="/products?action=create">Create new customer</a>
</p>
<table border="1">
    <tr>
        <td>STT </td>
        <td>Tên Sản Phẩm: </td>
        <td>Gía </td>
        <td>Mô tả </td>
        <td>Nhà Sản Xuất </td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach items='${requestScope["products"]}' var="product">
        <tr>
            <td><a href="/products?action=view&id=${product.getId()}">${product.getId()}</a></td>
            <td>${product.getNameProduct()}</td>
            <td>${product.getPriceProduct()}</td>
            <td>${product.getDescriptionProduct()}</td>
            <td>${product.getProducer()}</td>

            <td><a href="/products?action=edit&id=${product.getId()}">edit</a></td>
            <td><a href="/products?action=delete&id=${product.getId()}">delete</a></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
