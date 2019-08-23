<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+
            request.getServerPort()+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户列表</title>

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
                <th field="id" width="60">用户编号</th>
                <th field="phone" width="120">电话</th>
                <th field="password" width="150">密码</th>
                <th field="name" width="70">姓名</th>
                <th field="state" width="70">账户状态</th>
                <th field="address" width="150">地址</th>
                <th field="idCardNum" width="100">身份证号码</th>
                <th field="operate" width="300">操作</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageBean.resultList }" var="user">
        <tr>
            <td>${user.uid }</td>
			<td>${user.phone }</td>
			<td>${user.password }</td>
			<td>${user.name }</td>
            <td><c:if test="${user.state==1}">已激活</c:if>
                <c:if test="${user.state==0 }">未激活</c:if>
                <c:if test="${user.state==2 }">管理员</c:if>   </td>
            <td>${user.address }</td>
            <td>${user.idcardnum }</td>
            <td>
                <c:if test="${fun:length(user.licenseiimg) >1}">
                    <a href="<c:url value="/useridentitySAuth" />?user_uid=${user.uid}" class="easyui-linkbutton" iconCls="icon-tip" plain="true">认证信息</a>
                </c:if>
                <c:if test="${fun:length(user.licenseiimg) <=1}">
                    <a  class="easyui-linkbutton" iconCls="icon-no" plain="true">认证信息</a>
                </c:if>
                <c:if test="${user.state==0}">
                    <a href="<c:url value="editstate" />?user_uid=${user.uid}" class="easyui-linkbutton" iconCls="icon-ok" plain="true">激活</a>
                </c:if>
                <c:if test="${user.state!=0}">
                    <a  class="easyui-linkbutton" iconCls="icon-no" plain="true">激活</a>
                </c:if>
                <a href="<c:url value="toUpdateUser"/>?user_uid=${user.uid }" id="failBtn" class="easyui-linkbutton" iconCls="icon-edit" plain="true" >修改</a>
                <a href="<c:url value="deleteUser" />?user_uid=${user.uid}" class="easyui-linkbutton" iconCls="icon-no" plain="true">删除</a>
            </td>
		</tr>
		</c:forEach>
        </tbody>
    </table>
    <table width="100%" align="right" >
        <tr>
            <td color="#fff">
                <jsp:include page="pager1.jsp"></jsp:include>
            </td>
        </tr>
    </table>
    <div class="toolbar" style="padding: 20px; position: relative;">
        <form id="form1" action="<c:url value="findUser" />" method="post"></form>
        <form id="form2" action="  " method="post"></form>
        <img src="../../images/system/username.png"> <input class="username" form="form1"  name="userCustom.uid"placeholder="用户编号查询">&nbsp;&nbsp;
        <img src="../../images/system/phone.png"> <input class="username" form="form1"  name="userCustom.name"placeholder="姓名查询">&nbsp;&nbsp;
        <img src="../../images/system/email.png"> <input class="username" form="form1"  name="userCustom.state" placeholder="账户状态查询">&nbsp;&nbsp;
            <input type="submit" form="form1"  value="查询" style="background:#0089dc; color: #fff; border: 0; border-radius: 3%;">
        <input type="submit" form="form2"  value="返回" style="background:#0089dc; color: #fff; border: 0; border-radius: 3%;">
    </div>

    <div class="easyui-dialog dlg" style="width:500px;height:260px;padding:10px 20px;"
         closed="true" buttons="#dlg-buttons" pagination="true">
    </div>

</body>
</html>