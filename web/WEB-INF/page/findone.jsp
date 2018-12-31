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
                        <%--<form action="/updateUser" name="post">--%>
                              <table cellspacing="0">
                                    <tr>
                                          <th>id</th><th>user</th><th>email</th><th>password</th><th>changeORdelete</th>
                                    </tr>
                                    <tr>
                                          <td>${user.id}</td>
                                          <td>${user.username}</td>
                                          <td>${user.email}<br></td>
                                          <td>${user.password}<br></td>
                                          <td><a href="/delete?id=${user.id}">删除</a>&nbsp;&nbsp;<a href="/update?id=${user.id}">修改</a></td>
                                    </tr>
                              </table>
                        <%--</form>--%>
                  </div>
            </div>
      </div>
</div>
<script type="text/javascript" src="js/manager.js"></script>
      <%--${user.id}<br>--%>
      <%--${user.username}<br>--%>
      <%--${user.password}<br>--%>
      <%--${user.email}<br>--%>
      <%--<td><a href="/delete?id=${user.id}">删除</a> </td>--%>
      <%--<td><a href="/update?id=${user.id}">修改</a> </td>--%>
</body>
</html>
