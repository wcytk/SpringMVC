<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/12/21
  Time: 20:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>主页</title>
    <link href="../../css/bootstrap.css" type="text/css" rel="stylesheet"/>
    <link href="../../css/register.css" type="text/css" rel="stylesheet"/>
    <link href="../../css/index.css" type="text/css" rel="stylesheet"/>
    <link href="../../font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<!--导航-->
<nav class="nav navbar-default navbar-inverse navbar-fixed-top" role='navigation'>
    <!--长度100%-->
    <div class="container-fluid">
        <div class="navbar-header">
            <!--logo文字-->
            <div class="logo navbar-brand"></div>
            <div class="navbar-brand  cur">Foodie</div>
            <!--当页面减少到sm大小时导航栏出现一个三横杆图标，此图标指向id为naver的dom元素，以伸缩栏的形式展现-->
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#naver">
                <span class="sr-only"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <!--导航栏选项-->
        <div class="collapse navbar-collapse" id="naver">
            <ul class="nav navbar-nav">
                <li>
                    <a class="dropdown-toggle cur">美食</a>
                </li>
                <li>
                    <a class="dropdown-toggle cur">商超便利</a>
                </li>
                <li>
                    <a class="dropdown-toggle cur">水果</a>
                </li>
                <li>
                    <a class="dropdown-toggle cur">甜品饮品</a>
                </li>
                <li>
                    <a class="dropdown-toggle cur">送药上门</a>
                </li>
                <li>
                    <a class="dropdown-toggle cur">大牌惠吃</a>
                </li>
                <li>
                    <a class="dropdown-toggle cur">简食速餐</a>
                </li>
                <li>
                    <a class="dropdown-toggle  hidden-1"> </a>
                </li>
                <li>
                    <a class="dropdown-toggle  hidden-1"> </a>
                </li>
                <li>
                    <a class="dropdown-toggle  hidden-1"> </a>
                </li>
                <li>
                    <a class="dropdown-toggle  hidden-1"> </a>
                </li>
                <li>
                    <a class="dropdown-toggle  hidden-2"> </a>
                </li>
                <li>
                    <a class="dropdown-toggle  hidden-2"> </a>
                </li>
                <li>
                    <a class="dropdown-toggle  hidden-2"> </a>
                </li>
                <li>
                    <a class="dropdown-toggle  hidden-3"> </a>
                </li>
                <li>
                    <a class="dropdown-toggle  hidden-3"> </a>
                </li>
                <li>
                    <a class="dropdown-toggle hidden-3"> </a>
                </li>
                <li>
                    <a class="dropdown-toggle hidden-4"> </a>
                </li>
                <li>
                    <a class="dropdown-toggle hidden-4"> </a>
                </li>
                <li>
                    <a class="dropdown-toggle hidden-4"> </a>
                </li>
                <li>
                    <a class="dropdown-toggle hidden-5"> </a>
                </li>
                <li>
                    <a class="dropdown-toggle hidden-6"> </a>
                </li>
                <li>
                    <a class="dropdown-toggle hidden-7"> </a>
                </li>
                <li>
                    <a class="dropdown-toggle hidden-7"> </a>
                </li>
                <li>
                    <a class="dropdown-toggle  "> </a>
                </li>
                <li>
                    <a href="/register.jsp" class="dropdown-toggle cur" target="_blank">注册</a>
                </li>


                <!-- 右侧账号信息 -->
                <div class="visible-lg visible-md pull-right">
                    <div class="menu-right">
                        <ul class="notification-menu">
                            <!-- 头像+下拉菜单 -->
                            <li>
                                <a href="" class="btn btn-default dropdown-toggle btn-ac" data-toggle="dropdown">
                                    <img src="../../img/tou.png" style="height:28px;width:28px">John
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-wrench"></i> Settings </a>
                                    </li>
                                    <li>
                                        <a href="/performProduct">
                                            <i class="fa fa-user"></i> Profile </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-info"></i> Help </a>
                                    </li>
                                    <li>
                                        <a href="/logout"> <i class="fa fa-lock"></i> Logout </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- 餐厅 -->
    <!-- 餐厅 -->
    <div class="container">
        <!-- 附近的餐厅 -->
        <%--<form action="/findByProductName1" method="post">--%>
        <%--想查找商品名字：<input type="text" name="productName"><br>--%>
        <%--<input type="submit" value="查找">--%>
        <%--</form>--%>
        <div class="row title">
            <div class="col-lg-2 col-sm-3 col-xs-3 recent-cab">附近的餐厅</div>
            <div class="col-lg-3 col-sm-6 col-xs-6 search">
                <form class="form-horizontal" action="/findByProductName" method="post" id="search-form">
                    <div class="input-group">
                        <input type="search" name="productName" class="form-control" placeholder="search..." id="search-input" autocomplete="off">
                        <span class="input-group-btn">
                        <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                        </span>
                    </div>
                </form>
            </div>

            <div class="col-lg-7 col-sm-3 col-xs-3 underline"></div>
        </div>

        <!-- 餐厅排序 -->
        <div class="row">
            <div class="col-lg-12 order">
                <ul>
                    <li>
                        <span>默认</span>
                        <i class="fa fa-unsorted"></i>
                    </li>
                    <li>
                        <span>销量</span>
                    </li>
                    <li>
                        <span>餐厅距离</span>
                    </li>
                    <li>
                        <span>评分</span>
                    </li>
                    <li>
                        <span>起送价</span>
                    </li>
                    <li>
                        <span>送餐速度</span>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 菜单缩略图 -->
        <div class="row" style="margin-top:20px" id="menu">
            <c:forEach var="product" items="${Productlist}">
                <div class="col-lg-3 col-sm-4">
                    <div class="thumbnail">
                        <img src="${product.image}">
                        <div class="caption">
                            <h3>${product.productName}</h3>
                            <span>${product.statement}</span>
                            <p>
                                <a href="#" class="btn btn-primary" role="button">
                                    加入菜篮
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <%--<td>${product.productId}</td>--%>
            <%--<td>${product.productPrice}</td>--%>

        </div>
        <script src="../../js/jquery-3.2.1.min.js"></script>
        <script src="../../js/bootstrap.min.js"></script>
        <script src="../../js/index.js"></script>
</body>

</html>
