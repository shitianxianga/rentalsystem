<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>完善账户</title>
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/bootstrap.min.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/bootstrap-theme.min.css">

    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/reset.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/common.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/improveAccount.css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/layer/layer.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/user/improveAccount.js"></script>
</head>
<body>
<!--头部-->
<div class="header-box"></div>
<script>
    $(".header-box").load("${pageContext.request.contextPath}/jsp/common/public-header.jsp");

</script>
<script>
    function testPwdExit() {
        $.ajax(
            {
                url:"${pageContext.request.contextPath}/user/testPwd/"+$("[name='oldPassword']").val(),
                method: "Post",
                dataType:"json",
                success:function (data) {
                    if (data.isSame==true)
                    {
                        $(".passwordError").text("");
                    }
                    else{
                        $(".passwordError").text("原密码不正确");
                    }
                }
            }
        )

    }
    function testpwd() {
        var pwd=$("[name='newPassword']").val();
        var pwd1=$("[name='newPassword1']").val();
        var oldpwd=$("[name='oldPassword']").val();
        if (pwd.length<6)
        {
            $(".passwordError").text("密码必须大于等于6位");
            return false;
        }
        if (pwd==pwd1)
        {
            return true;
        }
        else
        {
            $(".passwordError").text("密码不一致，请重新输入");
            return false;
        }
    }
</script>

<!-- 用户中心头部 -->
<div class="top-box"></div>
<script>
    $(".top-box").load("${pageContext.request.contextPath}/jsp/common/userTopNav.jsp");
</script>


<div class="main-content">
    <div class="public-container clearfloat">
        <!-- 左边导航 -->
        <div class="left-box"></div>
        <script>
            $(".left-box").load("${pageContext.request.contextPath}/jsp/common/userLeftNav.jsp");
        </script>
        <form action="${pageContext.request.contextPath}/user/changePwd" onsubmit="return testpwd();" method="post" >
        <!-- 右边内容 -->
        <div class="right-content left-float">
            <dl>
                <table>
                    <dt class="content-title">账户信息 </dt>
                   <%-- <dd class="content-input-box">
                        <span class="content-text">用户名</span><!--
                             --><input class="content-input" placeholder="请输入用户名"><!--
                             --><span class="content-error">用户名格式错误</span><!--
                             --><a class="content-link" href="javascript:void(0)" onclick="openEditUsername();">修改</a>
                        <!--<a class="content-link" href="#">保存</a>-->
                    </dd>
                    <dd class="content-input-box">
                        <span class="content-text">电话</span><!--
                            --><span class="content-span">13432825705</span><!--
                            --><span class="content-error">联系电话格式错误</span><!--
                            --><a class="content-link" href="javascript:void(0)" onclick="openEditPhone();">修改</a>
                    </dd>
                    <dd class="content-input-box">
                        <span class="content-text">邮箱</span><!--
                            --><input class="content-input" placeholder="请输入邮箱号"><!--
                            --><span class="content-error">邮箱格式错误</span><!--
                            --><a class="content-link" href="javascript:void(0)" onclick="openEditEmail();">修改</a>
                    </dd>--%>
                    <span hidden name="old">${user.password}</span>
                    <dd class="content-input-box">
                        <span class="content-text">旧密码</span>
                        <input   name="oldPassword" type="password" onchange="testPwdExit()" class="content-input" placeholder="请输入原密码"><br><br>
                        <span class="content-text">新密码</span>
                        <input   name="newPassword" type="password" class="content-input" placeholder="请输入新密码"><br><br>
                        <span class="content-text">再次输入</span>
                        <input   name="newPassword1" type="password" class="content-input" placeholder="请确认新密码"><br>
                        <span class="passwordError red-text"></span><br>


                    </dd>
        </form>
                </table><button type="submit" class="btn-info btn-sm col-lg-offset-6 col-lg-1" >提交</button>
            </dl>
        </div>
    </div>
</div>

<!--尾部-->
<div class="footer-box"></div>
<script>
    $(".footer-box").load("${pageContext.request.contextPath}/jsp/common/public-footer.jsp");
</script>
</body>
</html>