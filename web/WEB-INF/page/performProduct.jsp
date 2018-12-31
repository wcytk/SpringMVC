<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>显示商品信息</title>
    <link rel="stylesheet" type="text/css" href="../../css/manager.css">
    <link rel="stylesheet" href="../../css/buttons.css">
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
            <a href="/ListAll">
            <div class="icon goods">
                <img src="../../img/goods.png">
            </div>
            <div class="tittle">商品</div>
            </a>
        </div>
    </div>
    <div class="exit"><a href="/logout">退出</a></div>
</div>
<div class="main" id="fullpage1">
    <div class="goodspage section">
        <div class="top">
            <div class="search">
                <form action="/findByProductName">
                    <input type="text" placeholder="输入您想要搜索的商品名称" name="productName">
                    <button type="submit"></button>
                    <div class="clear"></div>
                </form>
            </div>
        </div>
        <div class="bot">
            <div class="bigTitle">GOODSLIST</div>
            <div class="tab">
                <table cellspacing="0">
                        <c:forEach var="product" items="${Productlist}">
                            <tr>
                                <td>${product.productId}</td>
                                <td>${product.productName}</td>
                                <td>${product.statement}</td>
                                <td>${product.productPrice}</td>
                                <td><img src="${product.image}" width="100px" height="50px"></td>
                                <td><a href="/deleteGood?productId=${product.productId}">删除</a></td>
                                <td><a href="/editGood?productId=${product.productId}">修改</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                    <div class="pagelist">
                        <span><a href="performProduct?page=${page.firstPage}">第一页</a></span>
                        <span><a href="performProduct?page=${page.prePage}">上一页</a></span>
                        <span>第${page.pageNum}页</span>
                        <span><a href="performProduct?page=${page.nextPage}">下一页</a></span>
                        <span><a href="performProduct?page=${page.lastPage}">最后页</a></span>
                        <span class="tolPage">一共${page.pages}页</span>
                    </div>
                </table>
            </div>
            <button class="button button-circle button-jumbo btn" id="addgoods1"><i class="fa fa-plus"></i></button>
            <div class="addBox" id="add2">
                <form action="/insertGood" method="post">
                    <input type="text" name="productName" placeholder="商品名称">
                    <input type="text" name="statement" placeholder="商品描述">
                    <input type="text" name="productPrice" placeholder="商品价格">
                    <input type="text" name="image" placeholder="商品图片位置">
                    <button type="submit">添加</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="../../js/commonMana.js"></script>
</body>
</html>
