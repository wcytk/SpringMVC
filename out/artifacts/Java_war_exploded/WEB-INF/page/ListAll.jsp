<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>显示所有用户信息</title>
    <meta charset="UTF-8">
    <title>manager</title>
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
        <div class="nav cur" id="users-nav">
            <a href="/ListAll">
                <div class="icon users">
                    <img src="../../img/user.png">
                </div>
                <div class="tittle">用户</div>
            </a>
        </div>
        <div class="nav" id="goods-nav">
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
    <div class="userspage section">
        <div class="top">
            <div class="search">
                <form action="/findByName" method="post">
                    <input type="text" placeholder="输入您想要搜索的用户名" name="username">
                    <button type="submit"></button>
                    <div class="clear"></div>
                </form>
            </div>
        </div>
        <div class="bot">
            <div class="bigTitle">USERSLIST</div>
            <div class="tab">
                <table cellspacing="0">
                    <c:forEach var="user" items="${userlist}">
                        <tr>
                                <%--<td>${user.id}</td>--%>
                            <td>${user.username}</td>
                            <td>${user.email}</td>
                            <td>${user.password}</td>
                            <td><a href="/delete?id=${user.id}">删除</a></td>
                            <td><a href="/update?id=${user.id}">修改</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div class="pagelist">
                <span><a href="ListAll?page=${page.firstPage}">第一页</a></span>
                <span><a href="ListAll?page=${page.prePage}">上一页</a></span>
                <span>第${page.pageNum}页</span>
                <span><a href="ListAll?page=${page.nextPage}">下一页</a></span>
                <span><a href="ListAll?page=${page.lastPage}">最后页</a></span>
                <span class="tolPage">一共${page.pages}页</span>
            </div>
        </div>
        <a href="/performProduct">点击此处进行商品管理</a>
        <button class="button button-circle button-jumbo btn" id="adduser"><i class="fa fa-plus"></i></button>
        <div class="addBox" id="add1">
            <form action="/insert" method="post">
                <input type="text" name="username" placeholder="用户名">
                <input type="password" name="password" placeholder="密码">
                <input type="text" name="email" placeholder="邮箱">
                <button type="submit">添加</button>
            </form>
        </div>
    </div>
</div>
<script src="../../js/manager.js"></script>
</body>

</html>
