<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/bootstrap.min.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/bootstrap-theme.min.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/bootstrap-datetimepicker.min.css">

    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/reset.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/common.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/index.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common/bootstrap-datetimepicker.min.js"></script>
</head>
<body>
<div class="header-box"></div>
<script>
    $(".header-box").load("${pageContext.request.contextPath}/jsp/common/public-header.jsp");

</script>

<div class="index-carousel">
    <div class="index-carousel-bg">
    </div>
    <div class="index-choice">
        <form id="form" action="<c:url value='${pageContext.request.contextPath}/conditionSubmit'/>" method="post" ></form>

        <div class="choice-address">
            <div class="choice-address-block"><span class="address-text get-address-text">取车</span><input  form="form"    name="deliveryAddress"class="address-choice" placeholder="请输入送车上门地址"></div>
            <div class="choice-address-block"><span class="address-text return-address-text">还车</span><input form="form" class="address-choice"  name="pickUpAddress" placeholder="请输入上门取车地址"></div>
        </div>
        <div class="choice-date">
            <span class="date-text">租期</span><input readonly name="startTime" form="form" placeholder="请选择开始日期" class="date-choice" type="text">
            <!--<span class="date-to-bg"></span>-->
            <img src="${pageContext.request.contextPath}/images/dateTo.png" alt="至">
            <input readonly   placeholder="请选择结束日期" name="endTime" form="form" class="date-choice return-date-choice" type="text">
        </div>
        <input type="submit"  form="form" class="choice-btn" value="立即选车">
    </div>
</div>

<div class="index-tab">
    <table class="public-container index-tab-box">
        <tr>
            <td><div class="index-tab-common"><img class="tab-img-common" src="${pageContext.request.contextPath}/images/tab-model.png"></div></td>
            <td><div class="index-tab-common"><img class="tab-img-common" src="${pageContext.request.contextPath}/images/tab-store.png"></div></td>
            <td><div class="index-tab-common"><img class="tab-img-common" src="${pageContext.request.contextPath}/images/tab-insurance.png"></div></td>
            <td><div class="index-tab-common index-tab-infinite"><img class="tab-img-common" src="${pageContext.request.contextPath}/images/tab-infinite.png"></div></td>
        </tr>
    </table>
</div>

</div>
<center><br><br><br><span class="hotTiltle"><strong>热门车型大搜罗</strong></span><br><span class="hotfont">HOT车型，实时更新随看随租，值得您关注</span><br><br></center>
<div class="hotbox">

    <c:forEach items="${cars}" var="car">
    <div class="hotcar left-float">
        <span>${car.carCustom.cname}</span><br>
        <span class="hotfont">${car.carCustom.cdesc}</span><br>
        <br>
        <a href="${pageContext.request.contextPath}/toCarDetail?cid=${car.carCustom.cid}"><img class="hotimg" src="${host}${car.firstImg}"></a>
    </div>
    </c:forEach>

</div>
<div class="footer-box"></div>
<script>
    $(".footer-box").load("${pageContext.request.contextPath}/jsp/common/public-footer.jsp");
</script>

<script>

    $('.date-choice').datetimepicker({
        autoclose: true,
        startDate: new Date()
    });
</script>
</body>
</html>