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
	<title>增加车辆</title>
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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/kindeditor/themes/default/default.css" />
	<script src="${pageContext.request.contextPath}/kindeditor/kindeditor-all-min.js"></script>
	<script src="${pageContext.request.contextPath}/kindeditor/lang/zh-CN.js"></script>
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

    KindEditor.ready(function(K) {
        var editor = K.editor({
            filePostName:"uploadFile",//上传组件名
            uploadJson: '${pageContext.request.contextPath}/upload',//上传地址
            allowFileManager : true
        });
        K('#J_selectMutiImage').click(function() {
            editor.loadPlugin('multiimage', function() {
                editor.plugin.multiImageDialog({
                    clickFn : function(urlList) {
                        var div = K('#J_imageView');
                        div.html('');
                        K.each(urlList, function(i, data) {
                            div.append('<img src="${host}' + data.url + '" width="300px"/>');
                            var imgs = K("#imgs-input");
                            imgs.val(imgs.val()+data.url+";");
                        });
                        editor.hideDialog();
                    }
                });
            });
        });
    });

</script>
<table id="tab1">
	<form action="<c:url value='addCar'/>" method="post" enctype="multipart/form-data">
		<tr>
			<td>车辆名称：</td>
			<td><input type="text" name="cname"  /></td>
		</tr>
		<tr>
			<td>车辆图片：</td>
			<td>
				<input type="hidden" name="imgs" id="imgs-input"/>
				<input type="button" id="J_selectMutiImage" value="批量上传" />
				<div id="J_imageView"></div>
			</td>
		</tr>
		<tr>
			<td>品牌：</td>
			<td><select name="kid">
                <option value="">--请选择--</option>
				<c:forEach items="${kinds }" var="k">
					<option   value="${k.kid}">
							${k.kname }
					</option>
				</c:forEach>
			</select>
			</td>
		</tr>
		<tr>
			<td>车型</td>
			<td><input type="text" name="cdesc"  /></td>
		</tr>
		<tr>
			<td>每日单价</td>
			<td><input type="text" name="price" /></td>
		</tr>
		<tr>
			<td>车牌号</td>
			<td><input type="text" name="licensenumber" /></td>
		</tr>
		<tr>
			<td>座位数</td>
			<td><input type="text" name="sitnumber"  /></td>
		</tr>
		<tr>
			<td>排量</td>
			<td><input type="text" name="displacement"  /></td>
		</tr>
		<tr>
			<td>是否有导航仪</td>
			<td><input type="radio" name="navigator"value="1" checked=true  />是<input type="radio"value="0" name="navigator"  />否</td>

		<tr>
			<td>油箱</td>
			<td><input type="text" name="tankcapacity"  /></td>
		</tr>
		<tr>
			<td>是否自动挡</td>
			<td><input type="radio" name="automatic" value="1" checked=true  />是<input type="radio" name="automatic"value="0" />否</td>
		</tr>
		<tr>
			<td>是否有天窗</td>
			<td><input type="radio" name="skylight" checked=true value="1"  />是<input type="radio" name="skylight" value="0" />否</td>
		</tr>
		<tr>
			<td>押金</td>
			<td><input type="text" name="deposit"  /></td>
		</tr>
		<tr>
			<td>是否热卖</td>
			<td><input type="radio" name="ishot" checked=true value="1"  />是<input type="radio" name="ishot" value="0" />否</td>
		</tr>
		<tr>
			<td>状态</td>
			<td><input type="radio" name="state" checked=true value="1"  />上架<input type="radio" name="state" value="0" />下架<input type="radio" name="state" value="2" />租出</td>
		</tr>
        <tr>
            <td>起始地址</td>
            <td><input type="text" name="startaddress"  /></td>
        </tr>
        <tr>
            <td>目的地址</td>
            <td><input type="text" name="endaddress"  /></td>
        </tr>
		<tr>
			<td colspan="2">
				<input type="reset" name="reset" value="重置" />
				<input type="submit" name="submit" value="保存"  />
			</td>
		</tr>

	</form>
</table>
</body>
</html>
