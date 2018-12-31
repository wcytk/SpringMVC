<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/11/12
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page  isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查找结果</title>
</head>
<body>
${product.productId}<br>
${product.productName}<br>
${product.statement}<br>
${product.productPrice}<br>
<td><a href="/deleteGood?productId=${product.id}">删除</a> </td>


</body>
</html>
