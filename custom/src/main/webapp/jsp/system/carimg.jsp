<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
	<title>车辆图片</title>
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
	<form action="/findCarAll" method="post" enctype="multipart/form-data">
		<tr>
			<td><img    class=" " id="carimg1" src="${carimg1}" width="130px" height="80px" ></td>
		</tr>
		<tr>
			<td><img   class="  " id="carimg2"src="${carimg2}" width="130px" height="80px" ></td>
		</tr>
		<tr>
			<td><img  class="" id="carimg3" src="${carimg3}" width="130px" height="80px" ></td>
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
