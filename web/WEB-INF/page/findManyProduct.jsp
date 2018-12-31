<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/12/24
  Time: 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page  isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../../css/manager.css">
    <link rel="stylesheet" href="../../css/buttons.css">
    <link rel="stylesheet" href="../../css/fullpage.css">
    <script type="text/javascript" src="../../js/jquery.min.js"></script>
    <script src="../../js/fullpage.js"></script>
</head>
<body>
<div class="sidebar">
    <div class="logo">
        <div class="logoimg"></div>
        <div class="logoname">Foodie</div>
    </div>
    <div id="menu">
        <div class="nav" id="users-nav">
            <a href="/ListAll">
                <div class="icon users">
                    <img src="../../img/user.png">
                </div>
                <div class="tittle">用户</div>
            </a>
        </div>
        <div class="nav cur" id="goods-nav">
            <a href="/performProduct">
                <div class="icon goods">
                    <img src="../../img/goods.png">
                </div>
                <div class="tittle">商品</div>
            </a>
        </div>
    </div>
    <div class="exit"><a href="/logout">退出</a></div>
</div>
<div class="main" id="fullpage">
    <div class="goodspage section">
        <div class="top">
            <div class="search">
                <form>
                    <input type="text" placeholder="输入您想要搜索的商品名称">
                    <button type="submit"></button>
                    <div class="clear"></div>
                </form>
            </div>
        </div>
        <div class="bot">
            <div class="bigTitle">GOODSLIST</div>
            <div class="tab">
                <table cellspacing="0">
                    <tr>
                        <th>id</th>
                        <th>productName</th>
                        <th>price</th>
                        <th>statement</th>
                        <th>image</th>
                    </tr>
                    <c:forEach var="product" items="${Productlist}" >
                    <tr>
                        <td>${product.productId}</td>
                        <td>${product.productName}</td>
                        <td>${product.productPrice}</td>
                        <td>${product.statement}</td>
                        <td><img src="${product.image}" width="100px" height="50px"></td>
                    </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/manager.js"></script>
<%--<table>--%>
    <%--<c:forEach var="product" items="${Productlist}" >--%>
        <%--<tr>--%>
            <%--<td>${product.productId}</td>--%>
            <%--<td>${product.productName}</td>--%>
            <%--<td>${product.statement}</td>--%>
            <%--<td>${product.productPrice}</td>--%>
            <%--<td><img src="${product.image}" width="100px" height="50px"></td>--%>
            <%--</td>--%>
        <%--</tr>--%>
    <%--</c:forEach>--%>
<%--</table>--%>
</body>
</html>
