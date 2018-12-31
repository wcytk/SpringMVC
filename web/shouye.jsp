<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/12/21
  Time: 20:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page  isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>显示商品信息</title>
</head>
<body>
<table>
    <c:forEach var="product" items="${Productlist}" >
        <tr>
            <td>${product.productId}</td>
            <td>${product.productName}</td>
            <td>${product.statement}</td>
            <td>${product.productPrice}</td>
            <td><img src="${product.image}"></td>
            </td>
        </tr>
    </c:forEach>
</table>

<form action="/findByProductName" method="post">
    想查找商品名字：<input type="text" name="productName"><br>
    <input type="submit" value="查找">
</form>

</body>
</html>
