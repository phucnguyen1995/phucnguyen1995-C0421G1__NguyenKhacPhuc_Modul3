<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/3/2021
  Time: 8:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>

<form action="/discount-servlet" method="post">
  <p style="color: red">Mô tả sản phẩm</p>
  <input type="text" name="product_description"/>

  <p style="color: blue">Gíá niêm yết của sản phẩm</p>
  <input type="text" name="list_price"/>

  <p style="color: green">Tỉ lệ chiết khấu (phần trăm)</p>
  <input type="text" name="discount_percent"/>

  <input type ="submit" value=" Calculate Discount"/>



</form>
  </body>
</html>
