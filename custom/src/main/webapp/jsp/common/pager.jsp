<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<ul class="pagination">
    <c:if test="${!(pageBean.pageInfo.pageNum==1)}">
        <li><a  href="<c:url value="${pageContext.request.contextPath }/order/findOrderList/${pageBean.url}" />?pc=${pageBean.pageInfo.prePage}">&laquo;</a></li>
    </c:if>
    <c:forEach items="${pageBean.pageInfo.navigatepageNums}" var="navigatepageNum">
        <c:if test="${navigatepageNum==pageBean.pageInfo.pageNum}">
            <li ><a  href="<c:url value="${pageContext.request.contextPath }/order/findOrderList/${pageBean.url}"/>?pc=${navigatepageNum}">${navigatepageNum}</a></li>
        </c:if>
        <c:if test="${navigatepageNum!=pageBean.pageInfo.pageNum}">
            <li><a  href="<c:url value="${pageContext.request.contextPath }/order/findOrderList/${pageBean.url}" />?pc=${navigatepageNum}">${navigatepageNum}</a></li>
        </c:if>
    </c:forEach>
    <c:if test="${!pageBean.pageInfo.isLastPage}">
        <li><a href="<c:url value="${pageContext.request.contextPath }/order/findOrderList/${pageBean.url}" />?pc=${pageBean.pageInfo.nextPage}">&raquo;</a></li>

    </c:if>

</ul>