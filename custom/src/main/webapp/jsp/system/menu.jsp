<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>系统后台</title>

    <link rel="stylesheet" type="text/css" href="../../css/common/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../../css/common/bootstrap-theme.min.css">
    <link rel="stylesheet" href="../../css/themes/default/easyui.css" type="text/css">
    <link rel="stylesheet" href="../../css/themes/icon.css" type="text/css">

    <link rel="stylesheet"type="text/css" href="../../css/common/reset.css">
    <link rel="stylesheet"type="text/css" href="../../css/common/common.css">

    <script type="text/javascript" src="../../js/common/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../../js/layer/layer.js"></script>
    <script type="text/javascript" src="../../js/common/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../js/common/easyui-loading.js"></script>
    <style>
        a {
            color: #0000FF;
        }
    </style>
</head>
<body>
<div class="easyui-layout" style="width:100%;height:675px;margin:0 auto;">
    <div region="north" style="width:100%; height: 70px; background: #0089dc; border-bottom: 1px solid white;">
        <a href="#"><img style="margin: 15px 10px 0 25px;" src="../../images/system/admin-logo.png"></a>
    </div>
    <div region="south" style="width:100%; height: 50px; line-height: 50px; background: #0089dc; border-top: 1px solid white; color: white; text-align: center; font-size: 15px;">所有权：Cargo租车有限公司</div>
    <div class="easyui-accordion" region="west" split="true" title="功能" style="width:15%;">
        <div title="用户管理">
            <ul class="easyui-tree">
                <li><a href="javascript:void(0)" onclick="addTab('用户列表','<c:url value="/findUserAll" />')"> 用户列表</a></li>
                <li><a href="javascript:void(0)" onclick="addTab('个体出租列表','renterList.html')">个体出租列表</a></li>
            </ul>
        </div>
        <div title="订单管理">
            <ul class="easyui-tree">
                <li><a href="javascript:void(0)" onclick="addTab('订单列表','${pageContext.request.contextPath}/order/findOrderList/0')">订单列表</a></li>
                <li><a href="javascript:void(0)" onclick="addTab('租借申请<','${pageContext.request.contextPath}/order/findOrderList/1')">预定申请列表</a></li>
                <li><a href="javascript:void(0)" onclick="addTab('还车申请','${pageContext.request.contextPath}/order/findOrderList/4')">还车申请列表</a></li>
                <li><a href="javascript:void(0)" onclick="addTab('取车列表','${pageContext.request.contextPath}/order/findOrderList/2')">确认取车列表</a></li>
            </ul>
        </div>
        <div title="车库管理">
            <ul class="easyui-tree">
                <li><a href="javascript:void(0)" onclick="addTab('车辆列表','<c:url value="/findCarAll" />')">车辆列表</a></li>
                <li><a href="javascript:void(0)" onclick="addTab('类别列表','<c:url value="/findKindAll" />')">类别列表</a></li>
            </ul>
        </div>
    </div>
    <div id="content" region="center" style="">
        <div id="tt" class="easyui-tabs" style="width:100%;height:100%;">
            <div title="首页">
            </div>
        </div>
    </div>
</div>

<script>
    function addTab(title, url){

            var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
            $('#tt').tabs('add',{
                title:title,
                content:content,
                closable:true
            });

    }
</script>
</body>
</html>