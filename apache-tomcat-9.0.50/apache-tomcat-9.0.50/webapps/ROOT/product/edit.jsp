<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/4/2021
  Time: 10:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Edit customer</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/customers">Back to customer list</a>
</p>
<form method="post">
    <fieldset>
        <legend>Customer information</legend>
        <table>

            <tr>
                <td>STT </td>
                <td><input type="text" name="id" value="${requestScope["product"].getId()}"></td>
            </tr>
            <tr>
                <td>Tên Sản Phẩm: </td>
                <td><input type="text" name="name" value="${requestScope["product"].getNameProduct()}" ></td>
            </tr>
            <tr>
                <td>Gía </td>
                <td><input type="text" name="price" value="${requestScope["product"].getPriceProduct()}"></td>
            </tr>

            <tr>
                <td>Mô tả </td>
                <td><input type="text" name="description" value="${requestScope["product"].getDescriptionProduct()}"></td>
            </tr>

            <tr>
                <td>Nhà Sản Xuất </td>
                <td><input type="text" name="producer" value="${requestScope["product"]. getProducer}"></td>
            </tr>

            <tr>
                <td></td>
                <td><input type="submit" value="Update product"></td>
            </tr>
        </table>
    </fieldset>
</form>

</body>
</html>
