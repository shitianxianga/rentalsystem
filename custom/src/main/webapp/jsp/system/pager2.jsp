<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value="/css/pages.css" />">
<!-- 分页 -->
<div class="htmleaf-content" style="position: relative;padding:5px;">
	共${pageBean.pageInfo.total}条记录，当前显示第&nbsp;${pageBean.pageInfo.pageNum}/${pageBean.pageInfo.pages}&nbsp;页
    <ul class="manu" style="position:absolute;right:0px;top:0px;">
        <c:if test="${!pageBean.pageInfo.isFirstPage}">
            <li><a href="<c:url value="findCarAll" />?pc=1${pageBean.url}">首页</a></li>
            <li><a href="<c:url value="findCarAll" />?pc=${pageBean.pageInfo.prePage}${pageBean.url}">上一页</a></li>
        </c:if>
        <c:forEach items="${pageBean.pageInfo.navigatepageNums}" var="navigatepageNum">
            <c:if test="${navigatepageNum==pageBean.pageInfo.pageNum}">
                <li class="active"><a href="<c:url value="findCarAll" />?pc=${navigatepageNum}${pageBean.url}">${navigatepageNum}</a></li>
            </c:if>
            <c:if test="${navigatepageNum!=pageBean.pageInfo.pageNum}">
                <li><a href="<c:url value="findCarAll" />?pc=${navigatepageNum}${pageBean.url}">${navigatepageNum}</a></li>
            </c:if>
        </c:forEach>
        <c:if test="${!pageBean.pageInfo.isLastPage}">
            <li><a href="<c:url value="findCarAll" />?pc=${pageBean.pageInfo.nextPage}${pageBean.url}">下一页</a></li>
            <li><a href="<c:url value="findCarAll" />?pc=${pageBean.pageInfo.lastPage}${pageBean.url}">最后一页</a></li>
        </c:if>
    </ul>
</div>