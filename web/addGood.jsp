<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/11/12
  Time: 18:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/insertGood" method="post">
    商品名称：<input type="text" name="productName">
    商品描述：<input type="text" name="statement">
    商品价格: <input type="text" name="productPrice">
    商品图片: <input type="text" name="image">
    <input type="submit" value="提交">
</form>
</body>
</html>
