<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<script>
    var date=new Date();
    $(".month").text(date.getMonth());
    $(".day").text(date.getDate());

</script>
<head>
    <meta charset="UTF-8">
    <title>个人中心头部</title>
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/bootstrap.min.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/bootstrap-theme.min.css">

    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/reset.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/common.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/userTopNav.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/improveAccount.css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common/userTopNav.js"></script>
</head>
<body>
<div class="my-cargo">
    <div class="public-container clearfloat">
        <div class="my-cargo-logo-content left-float">
            <img class="my-cargo-logo" src="${pageContext.request.contextPath}/images/my-cargo-logo.png"><br/>
            <div class="weacher-content">

            </div>
        </div>
        <div class="user-img-box left-float">
            <img class="user-img" src="${pageContext.request.contextPath}/images/choice-3.png">
        </div>
        <div class="user-desc left-float">
            <div class="user-name">${user.name}</div>
            <div class="owner-text">车主</div>
            <div class="renter-text">租友</div>
        </div>
        <div class="date-content left-float clearfloat">
            <div class="calender left-float">
                <div class="month">1月</div>
                <div class="day">1日</div>
            </div>
            <div class="current-time left-float">00:00:00</div>
        </div>
        <div class="regist-time-content left-float">
            <img class="regist-time-png" src="${pageContext.request.contextPath}/images/regist-time.png"><!--
                    --><div class="regist-time">2015/12/01 14:00:00加入</div>
        </div>
    </div>
</div>
</body>
</html>