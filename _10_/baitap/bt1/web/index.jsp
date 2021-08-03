<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <table border  ="1" style="border-collapse: collapse">
    <tr>
      <th>Tên</th>
      <th> Ngày Sinh</th>
      <th> địa chỉ</th>
      <th>hình thù</th>
    </tr>
 <c:forEach var="customerObj" items="${CustomerServlet}" >
     <tr>
   <td><c:out value="${customerObj.name}"/></td>
   <td><c:out value="${customerObj.dayOfBirth}"/></td>
   <td><c:out value="${customerObj. address}"/></td>
   <td><img width="100px" height="100px" src="${customerObj.picture}" alt=""></td>
     </tr>


 </c:forEach>


  </table>

  </body>
</html>
