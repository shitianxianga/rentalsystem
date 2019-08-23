<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/bootstrap-theme.min.css">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/regist.css" type="text/css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common/jquery-3.2.1.min.js"></script>
</head>
<script>
    $(function(){
        $(".phone").change(function () {
            $.ajax({
                method:"GET",
                dataType:"json",
                url:"${pageContext.request.contextPath }/getUserExist/"+$(this).val(),
                success:function (data) {
                    if(data.isExist==true) {
                        $(".phoneError").html("用户名已存在");
                        $(".registBtn").attr("disabled",true);
                    }
                    else{
                        $(".registBtn").attr("disabled",false);
                    }
                }
            });
            if($(".phone").val().length!=11) {
                $(".phoneError").html("手机号不正确");
                $(".registBtn").attr("disabled",true);
            }else{

                $(".phoneError").html("&nbsp;");
            }
            $(this).val();
        });
    })

</script>
<body>
<!--头部-->
<div class="header-box"></div>
<script>
    $(".header-box").load("${pageContext.request.contextPath}/jsp/common/public-header.jsp");
    function sub() {
        $(".phoneError").html("&nbsp;");
        $(".passwordError").html("&nbsp;");
        if($(".phone").val().length!=11)
            $(".phoneError").html("手机号不正确");
        else if($(".password").val().length<6)
            $(".passwordError").html("密码长度必须大于6");
        else{
            $.ajax({
                url:"${pageContext.request.contextPath }/regist",
                method:"POST",
                data:$("#registForm").serialize(),
                dataType:"json",
                success:function (data) {
                    if(data.status==1){
                        alert("注册成功");
                        window.location.href="${pageContext.request.contextPath }/toLogin";
                    }else{
                        alert("注册失败");
                    }
                }
            })
        }
        return false;
    }

</script>
<div class="main-content">
    <div class="registBox">
        <form action="${pageContext.request.contextPath }/regist" id="registForm" class="form-horizontal" method="post">
            <div class="heading">用户注册</div>
            <div class="form-group help">
                <input type="text" class="form-control phone" name="phone" placeholder="手机号" maxlength="11">
                <span class="phoneError">&nbsp;</span>
            </div>

            <div class="form-group help">
                <input type="password" class="form-control password" name="password" placeholder="3-12位的密码" maxlength="12">
                <span class="passwordError">&nbsp;</span>
            </div>

            <div class="form-group">
                <button class="registBtn" onclick="return sub()">注册</button>
                <a class="loginLink" href="login.jsp"><span>已有账号？前往</span>登录</a>
            </div>
        </form>
    </div>
</div>
<!--尾部-->
<div class="footer-box"></div>
<script>
    $(".footer-box").load("${pageContext.request.contextPath }/jsp/common/public-footer.html");
</script>
<script type="text/javascript">
</script>
</body>
</html>
