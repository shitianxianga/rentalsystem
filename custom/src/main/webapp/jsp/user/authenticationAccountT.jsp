    <%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>实名认证</title>
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/bootstrap.min.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/bootstrap-theme.min.css">

    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/reset.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/common.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/userTopNav.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/authenticationAccount.css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/layer/layer.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/user/authenticationAccount.js"></script>
</head>
<body>
<!--头部-->
<div class="header-box"></div>
<script>
    $(".header-box").load("${pageContext.request.contextPath}/jsp/common/public-header.jsp");
</script>

<!-- 用户中心头部 -->
<div class="top-box"></div>
<script>
    $(".top-box").load("${pageContext.request.contextPath}/jsp/common/userTopNav.jsp");
</script>
    <script type="text/javascript">
    function html5Reader(file,imgid) {

    var file = file.files[0];
    var imgid=imgid;
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function(e){
    var pic = document.getElementById(imgid);
    pic.src=this.result;
    $("#"+imgid).show();

    }

    }


    </script>
<div class="main-content">
    <div class="public-container clearfloat">
        <!-- 左边导航 -->
        <div class="left-box"></div>
        <script>
            $(".left-box").load("${pageContext.request.contextPath}/jsp/common/userLeftNav.jsp");
        </script>
        <!-- 右边内容 -->
        <form id="form" action="${pageContext.request.contextPath}/user/authentica" onsubmit="return test()" method="post" enctype="multipart/form-data" >
        <div class="right-content left-float">
            <dl>
                <table>
                    <dt class="content-title">实名认证 </dt>
                    <dd class="content-input-box">
                        <span class="content-text">姓名</span><!--
                             --><input disabled name="name" class="content-input" value="${user.name}"><!--
                             --> <span class="content-error" id="nameError"></span>
                        <!--<a class="content-link" href="#">保存</a>-->
                    </dd>
                    <dd class="content-input-box">
                        <span class="content-text">地址</span><!--
                             --><input disabled  name="address" class="content-input" value="${user.address}">
                        <span class="content-error" id="addressError"></span>

                    </dd>
                    <dd class="content-input-box">
                        <span class="content-text">身份证号码</span><!--
                             --><input disabled name="idCardNum" class="content-input" value="${user.idcardnum}"><!--
                             --><span class="content-error" id="idError"></span>

                    </dd>
                </table>
            </dl>
        </div>

        <!-- 右边内容 -->
        <div class="right-content right-content-second right-float">
            <dl>
                <table>
                    <dt class="content-title">证件上传</dt>
                    <dd class="content-file-box  ">
                        <span class=" content-text">身份证正面</span>
                        <br> <br>

                        <img    class=" " id="idCard1" src="${idCard1}" width="130px" height="80px" >
                    </dd>
                    <dd class="content-file-box">
                        <span class="content-text">身份证反面</span>
                        <br> <br>



                        <!--<a class="content-link" href="#">保存</a>-->
                        <img   class="  " id="idCard2"src="${idCard2}" width="130px" height="80px" >
                    </dd>
                    <dd class="content-file-box">

                        <span class="content-text">驾驶证正面</span>
                        <br><br>


                        <img  class="" id="driverCar1" src="${driverCard1}" width="130px" height="80px" >

                    </dd>
                    <dd class="content-file-box">
                        <span class="content-text">驾驶证副页</span>
                        <br> <br>
                          <!--
                             --><!--
                             -->
                        <img   class="  "  id="driverCar2"  src="${driverCard2}" width="120px" height="80px" >
                        <!--<a class="content-link" href="#">保存</a>-->
                    </dd>

                </table>
            </dl>
        </div>
        </form>
    </div>
</div>



<!--尾部-->
<div class="footer-box"></div>
<script>
    $(".footer-box").load("${pageContext.request.contextPath}/jsp/common/public-footer.html");
    function test() {
        var name=$("input[name='name']").val();
        var address=$("input[name='address']").val();
        var idCardNum=$("input[name='idCardNum']").val();
        var idCard1=$("#idCard1").attr("src");
        var idCard2=$("#idCard2").attr("src");
        var driverCard1=$("#driverCar1").attr("src");
        var driverCard2=$("#driverCar2").attr("src");

        $("#nameError").text("");
        $("#addressError").text("");
        $("#idError").text("");
        if (name.length<2)
        {
            $("#nameError").text("请输入合法姓名");
            return false;
        }
        if (address.length==0)
        {
            $("#addressError").text("请输入地址");
            return false;
        }
        if (idCardNum.length==0)
        {
            $("#idError").text("请输入身份证号码");
            return false;
        }
        var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
        if(reg.test(idCardNum) === false)
        {
            $("#idError").text("请输入正确的身份证号码");
            return false;
        }
        if (idCard1==""||idCard2==""||driverCard1==""||driverCard2=="")
        {
            alert("请上传所有的身份证明");
            return false;
        }
        return  true;
    }
</script>
</body>
</html>