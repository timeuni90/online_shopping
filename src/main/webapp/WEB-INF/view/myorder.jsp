<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% pageContext.setAttribute("APP_PATH", request.getContextPath()); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>我的订单</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="${APP_PATH }/static/css/myorder/layout-a2ae44047d.css">

<link rel="stylesheet" href="${APP_PATH }/static/css/myorder/c53414.css">
<style>
.sureGet .ui-pop-main .ui-pop-cont {
	line-height: 28px !important;
	margin: 64px auto 30px !important;
	padding: 0 30px;
}

.font-14 {
	font-size: 14px;
}

.big-font {
	font-size: 18px;
}
</style>
</head>

<body>
	<div id="nTalk_post_hiddenElement"
		style="left: -10px; top: -10px; visibility: hidden; display: none; width: 1px; height: 1px;"></div>
	<!-- common header -->
	<%@ include file="/WEB-INF/view/public/header.jsp"%>
	<div class="store-wrap">
		<div class="crumbs">
			<a href="//store.meizu.com/index.html">首页 &gt;&nbsp;</a> <a
				href="//me.meizu.com/member/index">我的商城 &gt;&nbsp;</a> <a href=""
				class="active">我的订单&nbsp;</a>
		</div>
		<div class="main clearfix">
			<%@ include file="/WEB-INF/view/public/mysider.jsp"%>
			<div class="right-content f-fr">
				<div class="order-main">
					<div class="type-tab-btn">
						<a href="javascript:;" class="allOrder active" data-type="-1"
							data-bh="click_store_mc_orderstatus_all">全部订单</a><i class="line">|</i>
						<a class="waitPay" href="javascript:;" data-type="0"
							data-bh="click_store_mc_orderstatus_1">待付款<span
							class="amount _actAmount"></span></a><i class="line">|</i> <a
							class="waitDeliver" href="javascript:;" data-type="1"
							data-bh="click_store_mc_orderstatus_2">待发货</a><i class="line">|</i>
						<a class="hasDeliver" href="javascript:;" data-type="2"
							data-bh="click_store_mc_orderstatus_3">已发货</a><i class="line">|</i>
						<a class="other" href="javascript:;" data-type="99"
							data-bh="click_store_mc_orderstatus_other">其他</a>
					</div>
					<div class="list-head">
						<ul class="clearfix">
							<li class="w50"><select id="checkType" class="check-type">
									<option value="0">近三个月的订单</option>
									<option value="1">全部订单</option>
							</select> 订单明细</li>
							<li class="w125">售后</li>
							<li class="w125">金额</li>
							<li class="w125">状态</li>
							<li class="w125">操作</li>
						</ul>
					</div>
					<div id="tableList" class="type-contain ui-load-container">
						<div class="ui-load-content">
							<input id="unPayNum" type="hidden" value="0">
							<table class="orderItem">
								<tbody>
									<c:forEach items="${orders }" var="order">
									<tr class="trHead">
										<td colspan="4" class="title clearfix">
											<div class="f-fl">
												下单时间：
												<span class="time">
													<fmt:formatDate value="${order.key.generateTime }" pattern="yyyy-MM-dd HH:ss" />
												</span>
												订单号：
												<span class="orderNumber">
													${order.key.orderNumber }
												</span>
												 <a href="javascript:;" class="kefu j-kefu">
												 	<i class="iconfont icon-kefu"></i>&nbsp;联系客服
												 </a>
											</div>
										</td>
									</tr>
									<tr class="list-box b-l b-r b-b">
										<td class="list b-r j-iamCart">
											<div class="cart-wrap j-CartWrap">
												<div class="shop j-shop">
													<c:set value="0.0" var="totalPrice"></c:set>
													<c:forEach items="${order.value }" var="commodity">
													<div class="item b-t clearfix j-iamMain">
														<a class="productDetail nameWidth"
															href="//detail.meizu.com/item/meizu_power_bank_3.html"
															target="_blank"> 
															<img
																src="${commodity.key.commodityCover }"
																class="f-fl">
														</a>
														<div class="describe f-fl ">
															<div class="vertic clearfix">
																<span class="clearfix"> 
																	<a
																		title="${commodity.key.commotityName }"
																		class="productDetail nameWidth"
																		href="//detail.meizu.com/item/meizu_power_bank_3.html"
																		target="_blank"> 
																		${commodity.key.commotityName }
																	</a>
																	<p>${commodity.value }</p>
																	<p>
																		￥<fmt:formatNumber value="${commodity.key.price }" maxFractionDigits="2" minFractionDigits="2">
																		</fmt:formatNumber>
																		×${commodity.key.quantity }
																	</p>
																	<c:set value="${totalPrice + commodity.key.price * commodity.key.quantity }" var="totalPrice"></c:set>
																</span>
															</div>
														</div>
														<input type="hidden" class="orderSn" value="51050643590921833081">
														<input type="hidden" class="isCart" value="1">
														<input class="orderSnSon" type="hidden" value="21050643590921835081"> 
														<input type="hidden" class="supplierId" value="1"> 
														<input type="hidden" class="supportXiaoneng" value="1">
														<input type="hidden" class="brandName" value="魅族">
													</div>
													</c:forEach>
												</div>

											</div>
										</td>
										<td class="b-r w125 center price b-t">
											<div class="priceDiv">
												￥ <fmt:formatNumber value="${totalPrice }" maxFractionDigits="2" minFractionDigits="2">
												</fmt:formatNumber>
											</div>
										</td>
										<td class="b-r w125 center state b-t">
											<div class="stateDiv">
												<div>
													<c:if test="${order.key.status == 0 }">待付款</c:if>
													<c:if test="${order.key.status == 1 }">待发货</c:if>
													<c:if test="${order.key.status == 2 }">已发货</c:if>
													<c:if test="${order.key.status == 3 }">已收货</c:if>
													<br>
												</div>

											</div>
										</td>
										<td class="w125 center opreat b-t">
											<ul>
												<c:if test="${order.key.status == 0 }">
												<li class="goPay">
													<a href="${APP_PATH }/alipay?groupId=${order.key.groupId }">
														立即付款
													</a>
												</li>
												</c:if>
												<li class="more">
													<a
													href="//ordercenter.meizu.com/detail.html?sn=51050643590921833081&amp;isOld=0&amp;isCart=1"
													target="_blank">
														查看详情
													</a>
												</li>
											</ul>
										</td>
									</tr>
									<tr class="empty">
										<td></td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<input type="hidden" id="pageId" value="0">
				</div>
			</div>
		</div>
	</div>

	<!-- common js -->

	<!-- end content -->
	<%@ include file="/WEB-INF/view/public/footer.jsp" %>
</body>
</html>