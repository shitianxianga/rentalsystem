<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>车辆列表</title>

    <link rel="stylesheet" type="text/css" href="../../css/common/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../../css/common/bootstrap-theme.min.css">
    <link rel="stylesheet" href="../../css/themes/default/easyui.css" type="text/css">
    <link rel="stylesheet" href="../../css/themes/icon.css" type="text/css">
    <link rel="stylesheet" href="../../css/system/userList.css" type="text/css">
    <link rel="stylesheet" href="../../css/system/carList.css" type="text/css">

    <link rel="stylesheet"type="text/css" href="../../css/common/reset.css">
    <link rel="stylesheet"type="text/css" href="../../css/common/common.css">

    <script type="text/javascript" src="../../js/common/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../../js/layer/layer.js"></script>
    <script type="text/javascript" src="../../js/common/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../js/common/easyui-loading.js"></script>

    <style>
    </style>
</head>
<body>
    <table class="easyui-datagrid dg" width="100%" height="100%"
           toolbar=".toolbar" rownumbers="true" fitColumns="false" singleSelect="true">
        <thead>
            <tr>
                <th field="cid" width="60">车辆编号</th>
                <th field="cname" width="60">车辆名称</th>
                <th field="cdesc" width="100">车型</th>
                <th field="price" width="70">每日单价</th>
                <th field="licensenumber" width="70">车牌号</th>
                <th field="sitnumber" width="50">座位数</th>
                <th field="displacement" width="50">排量</th>
                <th field="navigator" width="50">导航仪</th>
                <th field="tankcapacity" width="50">油箱</th>
                <th field="automatic" width="50">自动挡</th>
                <th field="skylight" width="50">天窗</th>
                <th field="deposit" width="50">押金</th>
                <th field="state" width="50">状态</th>
                <th field="ishot" width="50">是否热卖</th>
                <th field="startaddress" width="150">起始地址</th>
                <th field="endaddress" width="150">目的地址</th>
                <th field="operate" width="300">操作</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageBean.resultList }" var="car">
            <tr>
                <td>${car.cid }</td>
                <td>${car.cname }</td>
                <td>${car.cdesc }</td>
                <td>${car.price }</td>
                <td>${car.licensenumber }</td>
                <td>${car.sitnumber}</td>
                <td>${car.displacement }</td>
                <td>${car.navigator }</td>
                <td>${car.tankcapacity }</td>
                <td>${car.automatic }</td>
                <td>${car.skylight }</td>
                <td>${car.deposit }</td>
                <td><c:if test="${car.state==1 }">上架</c:if>
                    <c:if test="${car.state ==2}">租出</c:if>
                    <c:if test="${car.state==0 }">下架</c:if></td>
                <td><c:if test="${car.ishot==0}">否</c:if>
                    <c:if test="${car.ishot==1}">是</c:if></td>
                <td>${car.startaddress}</td>
                <td>${car.endaddress}</td>
                <td>
                    <a href="<c:url value="carimg" />?car_cid=${car.cid}" class="easyui-linkbutton" iconCls="icon-ok" plain="true">车辆图片</a>
                    <a href="<c:url value="deleteCar" />?car_cid=${car.cid}" class="easyui-linkbutton" iconCls="icon-no" plain="true">删除</a>
                    <a href="<c:url value="toUpdateCar"/>?car_cid=${car.cid }" id="failBtn" class="easyui-linkbutton" iconCls="icon-edit" plain="true" >修改</a><br/><br/>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <table width="100%" align="right" >
        <tr>
            <td color="#fff">
                <jsp:include page="pager2.jsp"></jsp:include>
            </td>
        </tr>
    </table>
    <div class="toolbar" style="padding: 20px; position: relative;">
        <a href="<c:url value="toAddCar" />?car_cid=${car.cid}" id="passBtn" class="easyui-linkbutton" iconCls="icon-add" plain="true" >添加</a>
        <form id="form3" action="<c:url value="findCar" />" method="post"></form>
        <form id="form4" action="<c:url value="findCarAll" />" method="post"></form>
        <img src="../../images/system/brand.png"> <input class="username" form="form3" name="carCustom.cname" placeholder="车辆名称查询">&nbsp;&nbsp;
        <img src="../../images/system/model.png"> <input class="username" form="form3" name="carCustom.cdesc" placeholder="车型查询">&nbsp;&nbsp;
        <input type="checkbox" name="carCustom.navigator" form="form3" value="1" ><label>导航仪</label>
        <input type="checkbox" name="carCustom.automatic" form="form3" value="1" ><label>自动挡</label>
        <input type="checkbox" name="carCustom.skylight" form="form3"  value="1"><label>天窗</label>
        <input type="submit" form="form3"  value="查询" style="background:#0089dc; color: #fff; border: 0; border-radius: 3%;">
        <input type="submit" form="form4"  value="返回" style="background:#0089dc; color: #fff; border: 0; border-radius: 3%;">
    </div>

    <div class="easyui-dialog dlg" style="width:500px;height:260px;padding:10px 20px;"
         closed="true" buttons="#dlg-buttons" pagination="true">
    </div>


</body>
</html>