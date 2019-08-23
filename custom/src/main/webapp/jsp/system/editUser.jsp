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
<title>用户信息修改</title>
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
<script type="text/javascript">
	function html5Reader(file,imgid) {

		var file = file.files[0];
		var imgid=imgid;
		var reader = new FileReader();
		reader.readAsDataURL(file);
		reader.onload = function(e){
			var pic = document.getElementById(imgid);
			pic.src=this.result;
			$("#"+imgid).show();
		}
	}


</script>
	<table id="tab1">
	<form action="<c:url value='editUser'/>?user_uid=${user.uid }" method="post" enctype="multipart/form-data">
		<input type="hidden" name="uid" value="${user.uid }" />
	   	<tr>
	   		<td>手机号：</td>
	       	<td><input type="text" name="phone" value="${user.phone }" /></td>
	    </tr>
	    <tr>
	   		<td>密码：</td>
	       	<td><input type="text" name="password" value="${user.password }" /></td>
	    </tr>
		<tr>
			<td>姓名：</td>
			<td><input type="text" name="name" value="${user.name }" /></td>
		</tr>
		<tr>
			<td>地址：</td>
			<td><input type="text" name="address" value="${user.address }" /></td>
		</tr>
		<tr>
			<td>身份证号：</td>
			<td><input type="text" name="idcardnum" value="${user.idcardnum }" /></td>
		</tr>
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
	       		<input type="reset" name="reset" value="重置" />
	       		<input type="submit" name="submit" value="更新"  />
	       	</td>
	    </tr>
	</form>
   	</table>
</body>
</html>
