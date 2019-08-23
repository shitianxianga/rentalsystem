<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>租借申请</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/bootstrap-theme.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/themes/default/easyui.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/themes/icon.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/system/userList.css" type="text/css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/reset.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/common.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/layer/layer.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common/easyui-loading.js"></script>
    <style>
    </style>
</head>
<body>
<table  class="easyui-datagrid dg" width="100%" height="100%"
       toolbar=".toolbar" rownumbers="true" fitColumns="false" singleSelect="true">
    <thead>
    <tr>
        <th field="lid" width="60">订单编号</th>
        <th field="uid" width="60">用户编号</th>
        <th field="username"width="100">用户名</th>
        <th field="createtime" width="120">租借时间</th>
        <th field="returntime" width="120">归还时间</th>
        <th field="phone" width="80">联系电话</th>
        <th field="receiveaddress" width="150">配送地址</th>

        <th field="carinformation" width="80">车辆信息</th>
        <th field="operate" width="120">操作</th>

    </tr>
    </thead>
    <tbody>


        <c:forEach items="${pageBean.resultList}" var="lease">
        <tr>

        <td>${lease.lease.lid}</td>
            <td>${lease.user.uid}</td>
            <td>${lease.user.name}</td>
            <td><fmt:formatDate value="${lease.lease.createtime}" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></td>
            <td><fmt:formatDate value="${lease.lease.returntime}" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></td>
            <td>${lease.lease.contactphone}</td>
            <td>${lease.lease.receiveaddress}</td>

            <td><a href="javascript:void(0)" onclick="showCar(${lease.lease.lid})" class="easyui-linkbutton" iconCls="icon-tip" plain="true">车辆信息</a></td>
            <td>
                <a href="${pageContext.request.contextPath}/order/audit?s=2&&l=${lease.lease.lid}" class="easyui-linkbutton" iconCls="icon-ok" plain="true">通过</a>
                <a href="${pageContext.request.contextPath}/order/audit?s=6&&l=${lease.lease.lid}" class="easyui-linkbutton" iconCls="icon-no" plain="true">退审</a>
            </td>
        </tr>
        </c:forEach>


    </tbody>

</table>
<center>
    <ul class="pagination" >
        <c:if test="${!(pageBean.pageInfo.pageNum==1)}">
            <li><a class="btn-default" href="<c:url value="${pageContext.request.contextPath }/order/findOrderList/${pageBean.url}" />?pc=${pageBean.pageInfo.pageNum-1}">&laquo;</a></li>
        </c:if>
        <c:forEach items="${pageBean.pageInfo.navigatepageNums}" var="page">
            <li><a class="btn-default" href="<c:url value="${pageContext.request.contextPath }/order/findOrderList/${pageBean.url}" />?pc=${page}">${page}</a></li>
        </c:forEach>
        <c:if test="${!(pageBean.pageInfo.pageNum==pageBean.pageInfo.pages)}">
            <li><a class="btn-default" href="<c:url value="${pageContext.request.contextPath }/order/findOrderList/${pageBean.url}" />?pc=${pageBean.pageInfo.pageNum+1}">&raquo;</a></li>

        </c:if>
    </ul>
</center>
<div class="toolbar" style="padding: 20px; position: relative;">
    <img src="${pageContext.request.contextPath}/images/system/username.png"> <input class="username" placeholder="用户名查询">&nbsp;&nbsp;
    <input type="submit" value="查询" onclick="select1()" style="background:#fff; color:#0089dc; border: 0; border-radius: 10%;font-size: 15px;">
    <img src="${pageContext.request.contextPath}/images/system/phone.png"> <input class="username" placeholder="联系电话查询">&nbsp;&nbsp;
    <input type="submit" value="查询" onclick="select2()" style="background:#fff; color:#0089dc; border: 0; border-radius: 10%;font-size: 15px;">
    <img src="${pageContext.request.contextPath}/images/system/username.png"> <input class="username" placeholder="用户编号查询">&nbsp;&nbsp;
    <input type="submit" value="查询"onclick="select3()" style="background:#fff; color:#0089dc; border: 0; border-radius: 10%;font-size: 15px;">
</div>
<div class="easyui-dialog dlg" style="width:500px;height:260px;padding:10px 20px;"
     closed="true" buttons="#dlg-buttons" pagination="true">
</div>

<script>

    function showCar(a)
    {


        var row = $(".dg").datagrid("getSelected");
        <c:forEach items="${pageBean.resultList}" var="lease">
        if (row&&a==${lease.lease.lid}) {
            layer.open({
                title: '车辆信息',
                type: 1,
                closeBtn: 1,  // 调试用
                area: ['600px', '400px'], //宽高
                content:
               ' <table class="base-info-content-box">'+
               ' <tr>'+
                    '<td><img src="${pageContext.request.contextPath}/images/car-conf/seat.png"> 座位数：${lease.car.sitnumber}</td>'+
                    '<td><img src="${pageContext.request.contextPath}/images/car-conf/displacement.png"> 排量：${lease.car.displacement}T</td>'+
                    '</tr>'+
                    '<tr>'+
                    '<td><img src="${pageContext.request.contextPath}/images/car-conf/navigator.png"> 油箱：${lease.car.tankcapacity}</td>'+
                    '<td><img src="${pageContext.request.contextPath}/images/car-conf/gear.png"> 变速箱：${lease.car.automatic==1?'自动':'手动'}</td>'+
                    '</tr>'+
                    ' <tr>'+
                    '<td><img src="${pageContext.request.contextPath}/images/car-conf/sky.png"> 天窗：${lease.car.skylight==1?'有':'无'}</td>'+
                    '<td><img src="${pageContext.request.contextPath}/images/car-conf/navigator.png"> 导航仪：${lease.car.navigator==1?'有':'无'}</td>'
                        +
                    '</tr>'+
                    ' </table>'
        });

        }
        </c:forEach>
    }


    /**
       */
    function changeImg(link) {
        var img = $(link).find("img").get(0);
        $(".content-img-small").css("border", "0");
        $(img).css("border", "1px solid #c0c0c0");

        $(".img-big").attr("src", $(img).attr("src"));
        $(".img-big-link").attr("href", $(img).attr("src"));
    }
    function pass() {
        //get uid   change state;刷新界面重新读取

    }
    function impass() {

        //get uid    change state;刷新界面重新读取
    }
    function select1() {

    }
    function select2() {

    }
    function select3() {

    }
</script>
</body>
</html>