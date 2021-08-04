<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/4/2021
  Time: 10:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Product details</h1>
<p>
    <a href="/products">Back to product list</a>
</p>
<table>
    <tr>
        <td>STT </td>
        <td>${requestScope["product"].getId()}</td>
    </tr>
    <tr>
        <td>Tên Sản Phẩm: </td>
        <td>${requestScope["product"].getNameProduct()}</td>
    </tr>
    <tr>
        <td>Gía </td>
        <td>${requestScope["product"].getPriceProduct()}</td>
    </tr>

    <tr>
        <td>Mô tả </td>
        <td>${requestScope["product"].getDescriptionProduct()}</td>
    </tr>

    <tr>
        <td>Nhà Sản Xuất </td>
        <td>${requestScope["product"]. getProducer}</td>
    </tr>
</table>

</body>
</html>
