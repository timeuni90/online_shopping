<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>收藏</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="${APP_PATH }/static/css/bootstrap.min.css">
	
<link rel="stylesheet"
	href="${APP_PATH }/static/css/collect/layout-a2ae44047d.css">
<link rel="stylesheet"
	href="${APP_PATH }/static/css/collect/collect-list-ab2ac7e7d5.css">

<link rel="stylesheet"
	href="${APP_PATH }/static/css/jquery-confirm.min.css">

<script src="${APP_PATH }/static/js/jquery-3.2.1.min.js"></script>
<script src="${APP_PATH }/static/js/jquery-confirm.min.js"></script>
</head>

<body>
	<!-- common header -->
	<%@ include file="/WEB-INF/view/public/header.jsp"%>
	<div class="store-wrap">
		<div class="main clearfix">
			<c:set value="active" var="mysider_status3"></c:set>
			<%@ include file="/WEB-INF/view/public/mysider.jsp"%>
			<div class="right-content f-fr">
				<div class="collect-main">
					<div class="type-tab-btn">
						<a href="javascript:;" class="active allOrder">已收藏商品</a>
					</div>
					<div id="tableList" class="type-contain clearfix ui-load-container">
						<c:if test="${commodities==null }">
							<!-- 无数据 -->
							<div class="ui-load-content J_no_data">
								<p class="J_no_data_des">您暂无收藏的商品</p>
						</c:if>
						<c:if test="${commodities!=null }">
							<div class="ui-load-content">
								<div class="clearfix">
									<c:forEach items="${commodities }" var="commodity">
										<div class="item j-hover-item f-fl" style="z-index: 18; height: 260px; margin-left: 15px;">
											<i class="icon-del j-icon-del" data-id="12486"
												data-commodityid="${commodity.id }" style="cursor: pointer;"></i> <a
												href="${APP_PATH }/product/${commodity.id }"> <img
												src="${commodity.coverImage }">
											</a> <a href="${APP_PATH }/product/${commodity.id }">
												<h3 title="${commodity.title }" style="font-size: 15px;">${commodity.title }</h3>
											</a>
										</div>
									</c:forEach>
								</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<%@ include file="/WEB-INF/view/public/footer.jsp"%>
</body>
<script type="text/javascript">
	var APP_PATH = "${APP_PATH }";
</script>
<script src="${APP_PATH }/static/js/collect.js"></script>
</html>