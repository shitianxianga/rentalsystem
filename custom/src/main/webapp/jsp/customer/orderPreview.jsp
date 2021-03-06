<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>订单预览</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/bootstrap-theme.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/bootstrap-datetimepicker.min.css">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/orderPreview.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/getSubDay.js"></script>
</head>
<script>
    function chg(){
        var totalDay = getYMDHMS($("#startTime").val(),$("#endTime").val());
        if(totalDay<=0) {
            alert("请填写正确的时间段");
            $("#endTime").val("");
            $("#rentDay").html("-");
            $("#price").html("-");
            $("#totalPrice").html("-");
            return;
        }
        $("#rentDay").html(totalDay);
        var price = ${carCustom.price}*totalDay;
        $("#price").html(price);

        var totalPrice = price + 20;
        $("#totalPrice").html(totalPrice);
    }
    $(function () {
        $('.date-choice').datetimepicker({
            autoclose: true,
            startDate: new Date()
        });
        chg();
        $("#endTime").change(chg);
        $("#startTime").change(chg);
    });
</script>
<body>
    <div class="header-box"></div>
    <script>
        $(".header-box").load("${pageContext.request.contextPath}/jsp/common/public-header.jsp");
    </script>

    <div class="main-content">
        <div class="public-container car-container">
            <div class="car-content clearfloat">
                <img class="car-img left-float" src="${host}${carCustom.imgPaths[0]}">
                <div class="car-desc-box left-float">
                    <dl>
                        <dt class="car-name">${carCustom.cname}</dt>
                        <dd class="car-desc">${carCustom.cdesc}</dd>
                        <dd><button class="conf-btn" onclick="window.location.href='${pageContext.request.contextPath}/toCarDetail?cid=${carCustom.cid}'">查看配置信息</button></dd>
                    </dl>
                </div>
                <div class="date-address-box left-float">
                    <div class="date-address-title date-address-common clearfloat">
                        <img class="icon-common left-float" src="../../images/date-address/get-car.png"> <p class="text-common title-text left-float">取车</p><br>
                    </div>
                    <div class="address-text date-address-common clearfloat">
                        <img class="icon-common left-float" src="../../images/date-address/address.png"> <p class="text-common left-float">${carCustom.startaddress}</p>
                    </div>
                </div>
                <div class="date-address-box left-float">
                    <div class="date-address-title date-address-common clearfloat">
                        <img class="icon-common left-float" src="../../images/date-address/return-car.png"> <p class="text-common title-text left-float">还车</p><br>
                    </div>
                    <div class="address-text date-address-common clearfloat">
                        <img class="icon-common left-float" src="../../images/date-address/address.png"> <p class="text-common left-float">${carCustom.endaddress}</p>
                    </div>
                </div>
            </div>

            <form id="leaseForm" action="${pageContext.request.contextPath}/order/makeLease" method="post"></form>
            <input form="leaseForm" name="cid" type="hidden" value="${carCustom.cid}">
			<div class="price-content">
                	<div class="form-group">
                		<label>取车详细地址(不填默认网点取车)</label>
                		<input form="leaseForm" name="receiveaddress" class="form-control" type="text" value="${vo.startAddress}"/>
                	</div>
                	<div class="form-group">
                		<label>还车详细地址(不填默认网点还车)</label>
                		<input form="leaseForm" name="returnaddress" class="form-control" type="text" value="${vo.endAddress}"/>
                	</div>
                	<div class="form-group">
                		<label>取车时间</label>
                		<input form="leaseForm" name="receivetime" class="form-control date-choice" readonly required id="startTime" type="text" value="${startTime}"/>
                	</div>
                	<div class="form-group">
                		<label>还车时间</label>
                		<input form="leaseForm" name="returntime" class="form-control date-choice" readonly required id="endTime" type="text" value="${endTime}"/>
                	</div>
                	<div class="form-group">
                		<label>联系电话</label>
                		<input form="leaseForm" name="contactphone" class="form-control" required type="text"/>
                	</div>
            </div>

            <div class="price-content">
                <dl>
                    <dt class="price-title">费用明细</dt>
                    <dd class="price-text clearfloat"><p class="left-float">车辆租赁费</p><p class="sub-price right-float"><span id="price">-</span>元</p><p class="calc-price right-float">${carCustom.price}x<span id="rentDay">2</span></p></dd>
                    <dd class="price-text clearfloat"><p class="left-float">手续费</p><p class="sub-price right-float">&yen;20</p></dd>
                    <dd class="price-text clearfloat"><p class="left-float">合计</p><p class="sub-price right-float">&yen;<span id="totalPrice">-</span></p></dd>
                    <dd class="price-text clearfloat"><p class="left-float">押金</p><p class="sub-price right-float">&yen;${carCustom.deposit}</p></dd>
                    <dd class="total-text clearfloat"><p class="left-float">预付款<span class="real-money">&yen;30</span></p> <button form="leaseForm" class="submit-btn right-float">提交订单</button></dd>
                </dl>
            </div>

            <div class="caution-content">
                <div class="caution-title">常见问题</div>
                <dl>
                    <dt>租车费用包括什么？</dt>
                    <dd>租车费用包括车辆租赁费、基本保险费、不计免赔险、手续费。其中不计免赔险是不强制性的。</dd><br/>
                    <dt>为什么一定要交基本保险费？</dt>
                    <dd>基本保险费为强制性费用，如车辆租赁期间出险，保险理赔范围内的损失，客户仅需承担1500元以内的车辆损失部分，不用承担其他损失。<br/>
                        承保范围：车辆损失险（1500元以内的损失由客户方承担）；第三者责任险 20万元；车上人员责任险（驾驶员）5万元；全车盗抢险；玻璃单独爆裂险；自燃损失险。
                        本服务按天计费，超时4小时以上按1天计费，超时4小时以内不另计费。</dd><br/>
                    <dt>不计免赔险有什么用？</dt>
                    <dd>不计免赔险是不强制性的。不计免赔险就是对你商业险中的车损，三责，座位，
                        盗抢险这些险种的完善，也就是说，如果车有什么事故的话，
                        不计免赔是100%包赔，假如你的车坏了，需要去修，
                        那你直接开到修理厂去修，到时候拿着发票去给保险公司，
                        你自己不会花一分钱的，如果没有这个不计免赔的话，
                        保险公司只会给你拿一部分，剩下的就只有你自己拿了
                        ，总之，有这个不计免赔，对客户自身是有好处的。为了您的利益，还是非常建议购买的。</dd><br/>
                    <dt>预付款是什么？预付款怎么退？</dt>
                    <dd>由于不确定对方是否能够有效接单或是客户是否突然退单，为了双方的利益着想。顾客只需支付低额的
                    预付款。预付款的退额是有条件的。这些条件都是可以退单的：支付4小时内退单、对方拒单、订单完成。其他
                    条件原则上是无法退额的，这一点需要注意。
                    </dd>
                </dl>
            </div>
        </div>
    </div>


    <div class="footer-box"></div>
    <script>
        $(".footer-box").load("../common/public-footer.html");
    </script>
</body>
</html>