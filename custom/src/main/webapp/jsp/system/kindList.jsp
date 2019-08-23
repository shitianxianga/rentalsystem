<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>类别列表</title>

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
                <th field="kid" width="60">类别编号</th>
                <th field="kname" width="60">类别名称</th>
                <th field="operate" width="300">操作</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageBean.resultList }" var="kind">
            <tr>
                <td>${kind.kid }</td>
                <td>${kind.kname }</td>
                <td>
                    <a href="<c:url value="toUpdateKind"/>?kind_kid=${kind.kid }" id="failBtn" class="easyui-linkbutton" iconCls="icon-edit" plain="true" >修改</a><br/><br/>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <table width="100%" align="right" >
        <tr>
            <td color="#fff">
                <jsp:include page="pager3.jsp"></jsp:include>
            </td>
        </tr>
    </table>
    <div class="toolbar" style="padding: 20px; position: relative;">
        <a href="<c:url value="toAddKind" />?car_cid=${car.cid}" id="passBtn" class="easyui-linkbutton" iconCls="icon-add" plain="true" >添加</a>
        <form id="form5" action="<c:url value="findKind" />" method="post"></form>
        <form id="form6" action="<c:url value="findKindAll" />" method="post"></form>
        <img src="../../images/system/brand.png"> <input class="username" form="form5" name="kindCustom.kname" placeholder="类别名称查询">&nbsp;&nbsp;
        <input type="submit" form="form5"  value="查询" style="background:#0089dc; color: #fff; border: 0; border-radius: 3%;">
        <input type="submit" form="form6"  value="返回" style="background:#0089dc; color: #fff; border: 0; border-radius: 3%;">
    </div>

    <div class="easyui-dialog dlg" style="width:500px;height:260px;padding:10px 20px;"
         closed="true" buttons="#dlg-buttons" pagination="true">
    </div>


</body>
</html>