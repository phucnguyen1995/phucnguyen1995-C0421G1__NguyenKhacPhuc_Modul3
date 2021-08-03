<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/3/2021
  Time: 10:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
<form action="/money_servlet">
    <h2>Currency Converter</h2>
    <p>Rate</p>
    <input type="text" name="rate" placeholder="RATE" value="22000"/><br/>
     <p>USD</p>
    <input type="text" name="usd" placeholder="USD" value="0"/><br/>
    <input type= "submit" value = "Converter"/>
</form>


  </body>
</html>
