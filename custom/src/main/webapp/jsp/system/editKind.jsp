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
<title>类别信息修改</title>
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
	<form action="<c:url value='editKind'/>" method="post" enctype="multipart/form-data">
		<input type="hidden" name="kid" value="${kind.kid }" />
	   	<tr>
	   		<td>类别名称：</td>
	       	<td><input type="text" name="kname" value="${kind.kname }" /></td>
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
