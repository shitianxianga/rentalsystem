<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common/bootstrap.min.css" type="text/css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/bootstrap-theme.min.css">

    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/reset.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/login.css" type="text/css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common/jquery-3.2.1.min.js"></script>
</head>

<body>
<!--头部-->
<div class="header-box"></div>
<script>
    $(".header-box").load("${pageContext.request.contextPath}/jsp/common/public-header.jsp");
</script>
<div class="main-content">
    <div class="bg-img"></div>
    <div class="transparent"></div>
    <div class="loginBox">
        <form action="${pageContext.request.contextPath }/login" class="form-horizontal" onsubmit="return validate();" method="post">

            <div class="heading">用户登录</div>
            <div class="form-group">
                <input type="text" class="form-control username" name="username" placeholder="手机号" maxlength="50">
                <span class="usernameError"></span>
            </div>

            <div class="form-group help">
                <input type="password" class="form-control password" name="password" placeholder="密码" maxlength="20">
                <span class="passwordError"></span>

            </div>
            <div class="form-group">
                <span class="loginError">${er}</span>
                <input type="submit" class="loginBtn" id="login" value="登录" />
                <a id="register" class="registLink" href="${pageContext.request.contextPath }/toRegist"><span>还没账号？</span>快速注册</a>
                <a class="forgetLink" id="forgetPwd" href="${pageContext.request.contextPath }/user/toForgetPassword">忘记密码?</a>
            </div>
        </form>
    </div>
</div>
<!--尾部-->
<div class="footer-box"></div>
<script>
    $(".footer-box").load("${pageContext.request.contextPath}/jsp/common/public-footer.jsp");
</script>
<script type="text/javascript">
    // 登录前台校验
    function validate() {
        $(".loginError").text("");
        var reg=/^[1][3,4,5,7,8][0-9]{9}$/;
        var username = $(".username").val();
        var password = $(".password").val();
        // 用户名和密码非空校验
        if (username == "") {
            $(".usernameError").text("手机号为空");
            return false;
        } else {
            if (!reg.test(username))
            {
                $(".usernameError").text("手机号不合法");
                return false;
            }
            $(".usernameError").text("");
        }
        if (password == "") {
            $(".passwordError").text("密码为空");
            return false;
        } else {
            $(".passwordError").text("");
        }

        // 判断用户输入内容是：用户名/手机号还是邮箱
        $(".username").attr("name", "phone");

        return true;
    }
</script>
</body>
</html>