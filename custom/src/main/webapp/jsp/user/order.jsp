<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>完善账户</title>
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/bootstrap.min.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/bootstrap-theme.min.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/jquery.raty.css">

    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/reset.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/common.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/carList.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/improveAccount.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/order.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/layer/layer.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/user/improveAccount.js"></script>
</head>
<body>
<!--头部-->
<div class="header-box"></div>
<script>
    $(".header-box").load("${pageContext.request.contextPath}/jsp/common/public-header.jsp");
</script>

<!-- 用户中心头部 -->
<div class="top-box"></div>
<script>
    $(".top-box").load("${pageContext.request.contextPath}/jsp/common/userTopNav.jsp");
</script>


<div class="main-content">
    <div class="public-container clearfloat">
        <!-- 左边导航 -->
        <div class="left-box"></div>
        <script>
            $(".left-box").load("${pageContext.request.contextPath}/jsp/common/userLeftNav.jsp");
        </script>
        <div class="right-content left-float">${tip}</div>
        <!-- 右边内容 -->
        <div class="right-content left-float">
            <dl>
                <table>

                    <dt class="content-title ">
                        <a class="btn-info btn-lg"  href="${pageContext.request.contextPath}/order/findOrderList/0">全部</a>
                        <a class="btn-info btn-lg" href="${pageContext.request.contextPath}/order/findOrderList/1">审核中</a>
                        <a class="btn-info  btn-lg" href="${pageContext.request.contextPath}/order/findOrderList/2">预定成功</a>
                        <a class="btn-info  btn-lg " href="${pageContext.request.contextPath}/order/findOrderList/3">租赁中</a>
                        <a class="btn-info  btn-lg " href="${pageContext.request.contextPath}/order/findOrderList/4">还车申请中</a>
                        <a class="btn-info  btn-lg " href="${pageContext.request.contextPath}/order/findOrderList/5">已完成</a>
                        <a class="btn-info  btn-lg " href="${pageContext.request.contextPath}/order/findOrderList/6">已取消</a>
                    </dt>
                    <tr class="tableth">

                        <th class="col-lg-6">订单信息</th>
                        <th class="col-lg-3">取还信息</th>
                        <th class="col-lg-2">总计</th>
                        <th class="col-lg-2">状态</th>

                    </tr>
                    <c:forEach items="${pageBean.resultList}" var="lease">
                    <tr class="tabletr">
                        <td>
                            <img class="img left-float" src="${lease.carfirstimg}">
                            <br>
                            &nbsp;<span> <strong>${lease.car.cname}</strong></span>
                            <br>  &nbsp;<span class="decs">${lease.car.cdesc}</span>
                            <br>   &nbsp;<span class="decs">${lease.lease.lid}</span></br>
                        </td>
                        <td>
                            <br><br>
                            <span>${lease.lease.receiveaddress}</span><br>

                            <span class="decs"><fmt:formatDate value="${lease.lease.receivetime}"  pattern="yyyy-MM-dd HH:mm"/></span><br>
                            <span>${lease.lease.returnaddress}</span><br>
                            <span class="decs"><fmt:formatDate value="${lease.lease.returntime}" pattern="yyyy-MM-dd HH:mm"/></span><br>
                            <br>
                            <br>
                        </td>
                        <td>
                            <span class="price">${lease.lease.totalprice}</span>
                        </td>
                        <td>
                            <c:if test="${lease.lease.state==1}">
                                <span class="decs status">审核中</span><br>
                            </c:if>
                            <c:if test="${lease.lease.state==2}">
                                <span class="decs status">预定成功</span><br>
                            </c:if>
                            <c:if test="${lease.lease.state==3}">
                            <span class="decs status">租赁中</span><br>

                        </c:if>
                            <c:if test="${lease.lease.state==4}">
                                <span class="decs status">还车申请中</span><br>

                            </c:if>
                            <c:if test="${lease.lease.state==5}">
                                <span class="decs status">已完成</span><br>
                            </c:if>
                            <c:if test="${lease.lease.state==6}">
                                <span class="decs status">已取消</span><br>
                            </c:if>

                            <a href="${pageContext.request.contextPath}/order/toOrderDetail?lid=${lease.lease.lid}" class="btn-md btn-link">查看详情</a>
                        </td>
                    </tr>
                    </c:forEach>



                </table>
            </dl>
             <center>
            <ul class="pagination" >
            <c:if test="${!(pageBean.pageInfo.pageNum==1)}">
                <li><a class="btn-success" href="<c:url value="${pageContext.request.contextPath }/order/findOrderList/${pageBean.url}" />?pc=${pageBean.pageInfo.pageNum-1}">&laquo;</a></li>
            </c:if>

            <c:forEach items="${pageBean.pageInfo.navigatepageNums}" var="page">
                <li><a class="btn-success" href="<c:url value="${pageContext.request.contextPath }/order/findOrderList/${pageBean.url}" />?pc=${page}">${page}</a></li>
            </c:forEach>



            <c:if test="${!(pageBean.pageInfo.pageNum==pageBean.pageInfo.pages)}">
                <li><a class="btn-success" href="<c:url value="${pageContext.request.contextPath }/order/findOrderList/${pageBean.url}" />?pc=${pageBean.pageInfo.pageNum+1}">&raquo;</a></li>

            </c:if>

        </ul>
            </center>
        </div>

    </div>

</div>

<!--尾部-->
<div class="footer-box"></div>
<script>
    $(".footer-box").load("${pageContext.request.contextPath}/jsp/common/public-footer.jsp");
</script>
</body>
</html>