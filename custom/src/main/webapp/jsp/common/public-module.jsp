<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>公共模板</title>
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/bootstrap.min.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/bootstrap-theme.min.css">

    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/reset.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/common.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/xxx.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common/jquery-3.2.1.min.js"></script>
</head>
<body>
<!--头部-->
<div class="header-box"></div>
<script>
    $(".header-box").load("${pageContext.request.contextPath}/jsp/common/public-header.jsp");
</script>

<!--尾部-->
<div class="footer-box"></div>
<script>
    $(".footer-box").load("${pageContext.request.contextPath}/jsp/common/public-footer.jsp");
</script>

<!-- 用户中心头部 -->
<div class="top-box"></div>
<script>
    $(".top-box").load("${pageContext.request.contextPath}/common/userTopNav.html");
</script>

<!-- 左边导航 -->
<div class="left-box"></div>
<script>
    $(".left-box").load("${pageContext.request.contextPath}/common/userLeftNav.html");
</script>
</body>
</html>