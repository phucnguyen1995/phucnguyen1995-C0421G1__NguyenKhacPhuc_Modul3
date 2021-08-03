<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/3/2021
  Time: 8:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3 style="color: red">Product Description:<%=request.getAttribute("product_description")%></h3>

<h3 style="color: green">Discount Amount:<%=request.getAttribute("discount_amount")%> ngàn đồng</h3>

<h3 style="color: blue">Discount Price:<%=request.getAttribute("discount_price")%> ngàn đồng </h3>

</body>
</html>
