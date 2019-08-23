<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户中心左边导航栏</title>
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/bootstrap.min.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/bootstrap-theme.min.css">

    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/reset.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/common.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/userLeftNav.css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common/userLeftNav.js"></script>
</head>
<body>
<!-- 左边导航 -->
<div class="left-nav left-float">
    <dl>
        <dt class="nav-title">我的订单</dt>
        <a href="${pageContext.request.contextPath}/order/findOrderList/0" onclick="changeNav(this);"><dd class="nav-text active">订单中心</dd></a>
        <dt class="nav-title">我的账户</dt>
        <a href="${pageContext.request.contextPath}/user/identitySAuth" onclick="changeNav(this);"><dd class="nav-text">身份认证</dd></a>
        <a href="${pageContext.request.contextPath}/user/toChangePwd" onclick="changeNav(this);"><dd class="nav-text">修改密码</dd></a>
        <dt class="nav-title">我的消息</dt>
    </dl>
</div>
</body>
</html>