<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta name="spm-id" content="a220m.1000858">
<meta name="renderer" content="webkit">
<meta name="description" content="外套,品类齐全，欢迎选购！">
<meta name="viewport" content="width=device-width">
<title>搜索</title>


<!-- globalmodule version: 3.0.83 -->
<link rel="stylesheet" href="${APP_PATH }/static/css/sousuo/global.css">
<link rel="stylesheet" href="${APP_PATH }/static/css/sousuo/bts.css">
<link rel="stylesheet" href="${APP_PATH }/static/css/sousuo/jicheng.css">

<link href="${APP_PATH }/static/css/header/meizu_header/header.css" rel="stylesheet">
<link rel="stylesheet" href="${APP_PATH }/static/css/myorder/layout-a2ae44047d.css">

<script src="${APP_PATH }/static/js/jquery-3.2.1.min.js"></script>
</head>



<body class="pg">
	<%@ include file="/WEB-INF/view/public/header.jsp" %>
	<div class="page">
			<div id="content">
				<div class="main"> 
					<div class="view  " id="J_ItemList"
						data-spm="a220m.1000858.1000725" data-area="杭州"
						data-atp-a="{p},{id},,,spu,1,spu,{user_id}"
						data-atp-b="{p},{id},,,spu,2,spu,{user_id}">
						<c:forEach items="${pageInfo.list }" var="commodity">
							<div class="product  " data-id="585067159409"
								data-atp="a!,,50010158,,,,,,,,">
								<div class="product-iWrap">
									<div class="productImg-wrap">
										<a href="${APP_PATH }/product/${commodity.id }"
											class="productImg" target="_blank"> <img
											src="${commodity.coverImage }">
										</a>
									</div>
									<div class="productThumb clearfix"
										style="width: 210px; height: 39px"></div>
									<p class="productPrice">
										<em title="${commodity.minPrice }"><b>￥</b>${commodity.minPrice }</em>
									</p>
									<p class="productTitle">
										<a href="${APP_PATH }/product/${commodity.id }"
											target="_blank" title="${commodity.title }">
											${commodity.title } </a>
									</p>

									<div class="productShop">
										<a class="productShop-name" target="_blank">
											${commodity.seller.storeName } </a>
									</div>
									<p class="productStatus">
										<span>月销量 <em>${commodity.monthSale }</em></span> <span>评价
											<a>${commodity.commentQuantity }</a>
										</span> <span data-icon="small" class="ww-light ww-small"><a
											class="ww-inline ww-online" title="点此可以直接和卖家交流"><span>在线服务</span></a>
										</span>
									</p>
								</div>
							</div>
						</c:forEach>
					</div>
					<!--start PCSceneVideo -->
					<!--end PCSceneVideo -->
					<div class="ui-page">
						<div class="ui-page-wrap">
							<b class="ui-page-num"> <c:if
									test="${pageInfo.hasPreviousPage }">
									<a class="ui-page-prev"
										href="${APP_PATH }/search_product?varietyId=${varietyId }&page=${pageInfo.prePage }">上一页</a>
								</c:if> <c:if test="${!pageInfo.hasPreviousPage }">
									<b class="ui-page-prev">上一页</b>
								</c:if> <c:forEach items="${pageInfo.navigatepageNums }" var="pageNum">
									<c:if test="${pageInfo.pageNum == pageNum }">
										<b class="ui-page-cur">${pageNum }</b>
									</c:if>
									<c:if test="${pageInfo.pageNum != pageNum }">
										<a
											href="${APP_PATH }/search_product?varietyId=${varietyId }&page=${pageNum }">${pageNum }</a>
									</c:if>
								</c:forEach> <c:if test="${pageInfo.hasNextPage }">
									<a class="ui-page-next"
										href="${APP_PATH }/search_product?varietyId=${varietyId }&page=${pageInfo.nextPage }">下一页</a>
								</c:if> <c:if test="${!pageInfo.hasNextPage }">
									<b class="ui-page-next">下一页</b>
								</c:if>
							</b> <b class="ui-page-skip">
								<form action="${APP_PATH }/products" method="get">
									共${pageInfo.pages }页，到第 <input type="text" name="page"
										class="ui-page-skipTo" size="3" value="${pageInfo.pageNum }">页
									<input type="hidden" name="varietyId" value=${varietyId }>
									<button type="submit" class="ui-btn-s">确定</button>
								</form>
							</b>
						</div>
					</div>
				</div>
				<!--lidiB end -->
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/view/public/footer.jsp" %>
</body>
</html>
