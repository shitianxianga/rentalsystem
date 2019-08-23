<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>我的Cargo</title>
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/bootstrap.min.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/bootstrap-theme.min.css">

    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/reset.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/common.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/userLeftNav.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/userRightContent.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/userTopNav.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common/userLeftNav.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/userCenter.js"></script>
</head>
<body>
<div class="header-box"></div>
<script>
    $(".header-box").load("${pageContext.request.contextPath}/jsp/common/public-header.jsp");

</script>

<div class="main-content">
    <div class="public-container clearfloat">
        <!-- 左边导航 -->
        <div class="left-nav left-float">
            <dl>
                <dt class="nav-title">我的订单</dt>
                <a href="${pageContext.request.contextPath}/user/findOrder?status=1" onclick="changeNav(this);"><dd class="nav-text active">当前订单</dd></a>
                <a href="${pageContext.request.contextPath}/user/findOrder?status=2" onclick="changeNav(this);"><dd class="nav-text">历史订单</dd></a>

                <dt class="nav-title">我的账户</dt>
                <a href="${pageContext.request.contextPath}/user/identitySAuth" onclick="changeNav(this);"><dd class="nav-text">身份认证</dd></a>
                <a href="${pageContext.request.contextPath}/user/toChangePwd" onclick="changeNav(this);"><dd class="nav-text">修改密码</dd></a>
                <dt class="nav-title">我的消息</dt>
            </dl>
        </div>
        <!-- 右边内容 -->
        <div class="right-content left-float">

        </div>
    </div>
</div>

<div class="footer-box"></div>
<script>
    $(".footer-box").load("${pageContext.request.contextPath}/jsp/common/public-footer.jsp");
</script>
</body>
</html>