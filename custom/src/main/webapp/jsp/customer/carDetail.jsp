<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>车辆详情</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/bootstrap-theme.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/jquery.raty.css">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/carDetail.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=HHNwksT3c9XuGE9iwPrL0LLgSF0KzQsg"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common/jquery.raty.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/carDetail.js"></script>
</head>
<body>
    <div class="header-box"></div>
    <script>
        $(".header-box").load("${pageContext.request.contextPath}/jsp/common/public-header.jsp");
    </script>

    <div class="main-content">
        <div class="public-container clearfloat">
            <div class="car-desc-box left-float">
                <div class="car-title">${carCustom.cname}</div>
                <div class="car-img-box">
                    <img class="car-img-big" src="${host}${carCustom.imgPaths[0]}">
                    <ul class="clearfloat car-img-small-box">
                        <c:forEach items="${carCustom.imgPaths}" var="img">
                        <li class="left-float"><a href="javascript:void(0)" onclick="changeCarImg(this);"><img class="car-img-small" src="${host}${img}"></a></li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="car-base-info-box">
                    <dl>
                        <dt class="base-info-title">${carCustom.cname}租车基本信息</dt>
                        <dd class="base-info-content">
                            <table class="base-info-content-box">
                                <tr>
                                    <td><img src="../../images/car-conf/brand.png"> 品牌：${carCustom.kind.kname}</td>
                                    <td><img src="../../images/car-conf/model.png"> 车系：英朗</td>
                                </tr>
                                <tr>
                                    <td><img src="../../images/car-conf/year.png"> 年代：2016</td>
                                    <td><img src="../../images/car-conf/conf.png"> 配置：高配款</td>
                                </tr>
                            </table>
                        </dd>
                    </dl>
                </div>
                <div class="car-base-info-box">
                    <dl>
                        <dt class="base-info-title">${carCustom.cname}租车配置信息</dt>
                        <dd class="base-info-content">
                            <table class="base-info-content-box">
                                <tr>
                                    <td><img src="${pageContext.request.contextPath}/images/car-conf/seat.png"> 座位数：${carCustom.sitnumber}</td>
                                    <td><img src="${pageContext.request.contextPath}/images/car-conf/displacement.png"> 排量：${carCustom.displacement}T</td>
                                </tr>
                                <tr>
                                    <td><img src="${pageContext.request.contextPath}/images/car-conf/navigator.png"> 油箱：${carCustom.tankcapacity}</td>
                                    <td><img src="${pageContext.request.contextPath}/images/car-conf/gear.png"> 变速箱：${carCustom.automatic==1?'自动':'手动'}</td>
                                </tr>
                                <tr>
                                    <td><img src="${pageContext.request.contextPath}/images/car-conf/sky.png"> 天窗：${carCustom.skylight==1?'有':'无'}</td>
                                    <td><img src="${pageContext.request.contextPath}/images/car-conf/navigator.png"> 导航仪：${carCustom.navigator==1?'有':'无'}</td>
                                </tr>
                            </table>
                        </dd>
                    </dl>
                </div>
                <div class="order-btn-box">
                    <button class="order-btn" onclick="window.location.href='${pageContext.request.contextPath}/order/toOrderPreview?cid=${carCustom.cid}'">立刻预定</button>
                </div>
            </div>
            <div class="car-store left-float">
                <p class="store-name">武汉天河机场店</p>
                <div id="store-map" class="store-map"></div>
                <div class="store-desc">
                    <dl>
                        <dt class="store-title">门店地址：</dt>
                        <dd class="store-content">T3航站楼国内到达二楼7号出口左面柜台</dd>
                        <dt class="store-title">营业时间：</dt>
                        <dd class="store-content">09:00-21:00</dd>
                        <dt class="store-title">门店电话：</dt>
                        <dd class="store-content">13432825705</dd>
                        <dt class="store-title">客户评价：</dt>
                        <dd class="store-content clearfloat"><div class="comment-star left-float"></div>&nbsp;<span class="orange-text">3.0</span><a href="#" class="total-comment right-float">3000000条评论&gt;</a></dd>
                    </dl>
                </div>
            </div>
        </div>
    </div>

    <div class="footer-box"></div>
    <script>
        $(".footer-box").load("../common/public-footer.html");
    </script>

    <script>
        // 星星
        $('.comment-star').raty({
            starOn:'../../images/star-on.png',
            starOff:'../../images/star-off.png',
            halfShow: false,
            score:3,
            readOnly: true,
        });

        $(function() {
            var map = new BMap.Map("store-map");
            var point = new BMap.Point(116.404, 39.915);  // 根据经纬度设置中心点:天安门
            map.centerAndZoom(point,12);  // 设置中心点和缩放级别，数字越大，显示的范围越小
            map.enableScrollWheelZoom();  // 支持滚轮缩放
            // map.addControl(new BMap.NavigationControl());  // 左上角添加平移缩放控件
            // map.addControl(new BMap.ScaleControl());  // 左下方显示比例
            // 根据地址在地图上显示
            var myGeo = new BMap.Geocoder();
            myGeo.getPoint("武汉天河机场", function(point) {
                if (point) {
                    map.centerAndZoom(point, 17);
                    map.addOverlay(new BMap.Marker(point));    // 标注
                }
            });
        });

    </script>
</body>
</html>