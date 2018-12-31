<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/12/13
  Time: 20:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
    <script src="js/reforgetPassword.js"></script>
    <title>注册页面</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.css" type="text/css" rel="stylesheet" />
    <link href="css/register.css" type="text/css" rel="stylesheet" />
</head>
<body>
<!--导航-->
<nav class="nav navbar-default navbar-inverse navbar-fixed-top" role='navigation'>
    <!--长度100%-->
    <div class="container-fluid">
        <div class="navbar-header">
            <!--logo文字-->
            <div class="logo navbar-brand"> </div>
            <div class="navbar-brand  cur">Foodie</div>
            <!--当页面减少到sm大小时导航栏出现一个三横杆图标，此图标指向id为naver的dom元素，以伸缩栏的形式展现-->
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#naver" >
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
                    <a class="dropdown-toggle  hidden-1">    </a>
                </li>
                <li>
                    <a class="dropdown-toggle  hidden-1">    </a>
                </li>
                <li>
                    <a class="dropdown-toggle  hidden-1">    </a>
                </li>
                <li>
                    <a class="dropdown-toggle  hidden-1">    </a>
                </li>
                <li>
                    <a class="dropdown-toggle  hidden-2">    </a>
                </li>
                <li>
                    <a class="dropdown-toggle  hidden-2">    </a>
                </li>
                <li>
                    <a class="dropdown-toggle  hidden-2">    </a>
                </li>
                <li>
                    <a class="dropdown-toggle  hidden-3">    </a>
                </li>
                <li>
                    <a class="dropdown-toggle  hidden-3">    </a>
                </li>
                <li>
                    <a class="dropdown-toggle hidden-3">    </a>
                </li>
                <li>
                    <a class="dropdown-toggle hidden-4">    </a>
                </li>
                <li>
                    <a class="dropdown-toggle hidden-4">    </a>
                </li>
                <li>
                    <a class="dropdown-toggle hidden-4">    </a>
                </li>
                <li>
                    <a class="dropdown-toggle hidden-5">    </a>
                </li>
                <li>
                    <a class="dropdown-toggle hidden-6">    </a>
                </li>
                <li>
                    <a class="dropdown-toggle hidden-7">    </a>
                </li>
                <li>
                    <a class="dropdown-toggle hidden-7">    </a>
                </li>
                <li>
                    <a class="dropdown-toggle  ">    </a>
                </li>
                <li>
                    <a href="register.jsp" class="dropdown-toggle cur" target="_blank">注册</a>
                </li>
                <li>
                    <a href="index.jsp" class="dropdown-toggle cur" id="login">登录</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!--两列布局：左侧注册表;右侧介绍栏-->

<div class="container-fluid">
    <div class="row">
        <div class="col-md-7">
            <!--注册页面-->
            <!--注册界面上的文字-->
            <div class="row">
                <div class="col-md-4 col-md-offset-2 " id="register-title">修改密码</div>
            </div>
            <div class="row">
                <div class="col-md-10 col-md-offset-2 ">请输入邮箱以进行验证</div>
            </div>
            <div class="row">
                <div class="col-lg-12 blank1"></div>
            </div>
            <div class="row">
                <div class="col-lg-12 blank1"></div>
            </div>


            <form class="form-horizontal" action="/forgetPass" method="post" onsubmit="return check()">
                <!--邮箱-->
                <div class="row register-modify">
                    <div class="col-md-10 col-md-offset-2"><label for="truename-text">邮箱</label></div>
                </div>
                <div class="row">
                    <div class="col-lg-9 col-lg-offset-2 col-md-9 col-md-offset-2 col-sm-11 input-group">
                        <input type="text" id="truename-text" name="email" placeholder="请输入您常用的邮箱" class="form-control"/>
                        <span class="input-group-addon" name="identifying-code" id="yanzhengma">发送验证码</span>

                    </div>
                </div>
                <div class="row height-get">
                    <div class="col-md-4 col-md-offset-2" id="truename-tip"></div>
                </div>

                <!--验证码-->
                <div class="row register-modify">
                    <div class="col-md-10 col-md-offset-2"><label for="idnumber-text">验证码</label></div>
                </div>
                <div class="row">
                    <div class="col-lg-9 col-lg-offset-2 col-md-9 col-md-offset-2 col-sm-11 ">
                        <input type="text" name="identifyingCode" id="idnumber-text" placeholder="请核对已经发送到您邮箱的验证码" class="form-control"/> </div>
                </div>
                <div class="row height-get">
                    <div class="col-md-4 col-md-offset-2" id="idnumber-tip"></div>
                </div>
                <!--确认按钮-->
                <div class="row">
                    <div class="col-md-6 col-md-offset-2">
                        <input type="submit" class="submit-button" id="submit-button">
                    </div>
                </div>
            </form>
        </div>
        <!--右侧介绍栏-->
        <div class="col-md-4 col-md-offset-1   hidden-sm hidden-xs">
            <div class="row">
                <!--空白-->
                <div class="col-lg-12  blank"></div>
            </div>
            <!--International-->
            <div class="row">
                <div class="col-md-6 col-md-offset-2 intro-border">
                    <em>Celebration</em>
                    <span>为您的聚餐、派对快速准备美食</span>
                </div>
                <div class="col-md-3 intro-international-img"></div>
            </div>
            <!--comments-->
            <div class="row">
                <!--空白-->
                <div class="col-lg-12 blank1"></div>
            </div>
            <div class="row">
                <div class="col-md-6 col-md-offset-2 intro-border">
                    <em>Conter meal</em>
                    <span>一份简餐，为您开启美好的一天</span>
                </div>
                <div class="col-md-3 intro-comment-img"></div>
            </div>
            <!--ACCURATE-->
            <div class="row">
                <!--空白-->
                <div class="col-lg-12 blank1"></div>
            </div>
            <div class="row">
                <div class="col-md-6 col-md-offset-2 intro-border">
                    <em>Fresh</em>
                    <span>邻家水果店，新鲜值得信任。</span>
                </div>
                <div class="col-md-3 intro-accurate-img"></div>
            </div>
            <!--CONTACT-->
            <div class="row">
                <!--空白-->
                <div class="col-lg-12 blank1"></div>
            </div>
            <div class="row">
                <div class="col-md-6 col-md-offset-2 intro-border">
                    <em>Supermarket</em>
                    <span>为您在超市便利店采购一切您需要的</span>
                </div>
                <div class="col-md-3 intro-contact-img"></div>
            </div>
        </div>
    </div>
</div>

<!--页脚-->
<div class="blank"></div>
<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-10 col-lg-offset-2" style="margin-bottom:6px;">
                <a href="">公司简介</a>|
                <a href="">合作伙伴</a>|
                <a href="">诚聘精英</a>|
                <a href="">法律声明</a>|
                <a href="">联系我们</a>|
                <a href="">帮助中心</a>|
                <a href="">诚信保障措施</a>|
                <a href="">有情链接</a>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <span>互联网药品信息服务资格证书:(沪)-经营性-2016-0011 | 增值电信业务许可证 : 沪B2-20150033 | 沪ICP备 09007032 | 上海工商行政管理 Copyright ©2008-2018 上海拉扎斯信息科技有限公司, All Rights Reserved.</span>
                </div>
            </div>
        </div>
    </div>
</footer>

<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/getDom.js"></script>
<script src="js/forgetPassword.js"></script>
</body>

<body>

<%--<form action="/register" method="post">--%>
<%--用户名：<input type="text" name="username"><br>--%>
<%--邮箱：<input type="text" name="email"><br>--%>
<%--密码:<input type="password" name="password"><br>--%>
<%--<input type="button" id="yanzhengma" value="发送验证码" onclick="yanzheng()"><br>--%>
<%--请输入验证码：<input type="text" name="identifyingCode"><br>--%>
<%--<input type="submit" value="提交">--%>
<%--</form>--%>

</body>
</html>