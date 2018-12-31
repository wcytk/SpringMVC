<%@ page  isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑用户</title>
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
                <form>
                    <input type="text" placeholder="输入您想要搜索的用户名">
                    <button type="submit"></button>
                    <div class="clear"></div>
                </form>
            </div>
        </div>
        <div class="bot">
            <div class="bigTitle">USERSLIST</div>
            <div class="tab">
                <form action="/updateUser" name="post">
                <table cellspacing="0">
                    <tr>
                        <th>user</th><th>email</th><th>password</th><th>changeORdelete</th>
                    </tr>
                    <tr>
                        <input type="hidden" name="id" value="${user.id}" />
                        <td><input type="text" name="username" value="${user.username}" /></td>
                        <td><input type="text" name="email" value="${user.email}" /></td>
                        <td><input type="password" name="password"/></td>
                        <td><button type="submit">编辑</button></td>
                    </tr>
                </table>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/manager.js"></script>
<%--<form action="/updateUser" name="post">--%>
    <%--<input type="hidden" name="id" value="${user.id}" />--%>
    <%--用户名：<input type="text" name="username" value="${user.username}" />--%>
    <%--密码：<input type="password" name="password"/>--%>
    <%--邮箱：<input type="text" name="email" value="${user.email}" />--%>
    <%--<input type="submit" value="编辑"/>--%>
<%--</form>--%>
</body>
</html>
