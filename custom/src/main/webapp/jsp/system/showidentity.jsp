<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
	<base href="<%=basePath%>">
	<title>认证信息</title>
	<style type="text/css">
		body{
			font-size:12px;
		}
		table{
			width:80%;
			text-align:center;
			margin:auto;
		}
		table,td{
			border:1px solid #09F;
			border-collapse:collapse;
			padding:10px;
		}
		table#tab1{
			text-align:left;
			margin-bottom:10px;
		}
	</style>
</head>
<body>

<table id="tab1">
	<form action="/findUserAll" method="post" enctype="multipart/form-data">
		<tr>
			<td>身份证正面：</td>
			<td><img    class=" " id="idCard1" src="${idCard1}" width="130px" height="80px" ></td>
		</tr>
		<tr>
			<td>身份证反面：</td>
			<td><img   class="  " id="idCard2"src="${idCard2}" width="130px" height="80px" ></td>
		</tr>
		<tr>
			<td>驾驶证正面：</td>
			<td><img  class="" id="driverCar1" src="${driverCard1}" width="130px" height="80px" ></td>
		</tr>
		<tr>
			<td>驾驶证副页：</td>
			<td><img   class="  "  id="driverCar2"  src="${driverCard2}" width="120px" height="80px" ></td>
		</tr>

		<tr>
			<td colspan="2">
				<input type="submit" name="submit" value="返回"  />
			</td>
		</tr>
	</form>
</table>
</body>
</html>
