<%@ page  isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
</head>
<body>
<h1>编辑用户</h1>
<form action="/updatePass" name="post">
    <input type="hidden" name="id" value="${user.id}" />
    用户名：<input type="text" name="username" value="${user.username }" readonly="readonly"/>
    密码：<input type="password" name="password"/>
    邮箱：<input type="text" name="email" value="${user.email}" readonly="readonly"/>
    <input type="submit" value="确认修改"/>
</form>
</body>
</html>
