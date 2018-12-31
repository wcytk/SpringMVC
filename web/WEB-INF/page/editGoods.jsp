<%@ page  isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑商品</title>
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
                    <form action="/updateGood" name="post">
                    <tr>
                        <th>name</th><th>statement</th><th>price</th><th>iamge</th><th>change</th>
                    </tr>
                    <tr>
                        <input type="hidden" name="productId" value="${product.productId}" />
                        <td><input type="text" name="productName" value="${product.productName}" /></td>
                        <td><input type="text" name="statement" value="${product.statement}"/></td>
                        <td><input type="text" name="productPrice" value="${product.productPrice}" /></td>
                        <td><input type="text" name="image" value="${product.image}"></td>
                        <td><button type="submit">编辑</button></td>
                    </tr>
                    </form>
                </table>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/manager.js"></script>
<form action="/updateGood" name="post">
    <input type="hidden" name="productId" value="${product.productId}" />
    商品名称：<input type="text" name="productName" value="${product.productName}" />
    商品描述：<input type="text" name="statement" value="${product.statement}"/>
    商品价格：<input type="text" name="productPrice" value="${product.productPrice}" />
    商品图片：<input type="text" name="image" value="${product.image}">
    <input type="submit" value="编辑"/>
</form>
</body>
</html>
