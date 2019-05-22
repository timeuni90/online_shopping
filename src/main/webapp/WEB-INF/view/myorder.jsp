<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>我的订单</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${APP_PATH }/static/css/jquery-confirm.min.css">

<link href="${APP_PATH }/static/css/header/meizu_header/header.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${APP_PATH }/static/css/myorder/layout-a2ae44047d.css">
<link rel="stylesheet" href="${APP_PATH }/static/css/myorder/c53414.css">
<link href="${APP_PATH }/static/css/commodity_detail/mallphotos.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="${APP_PATH }/static/backstage/bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${APP_PATH }/static/backstage/bower_components/font-awesome/css/font-awesome.min.css">
<!-- 消息提示 -->
<link rel="stylesheet" href="${APP_PATH }/static/css/sco.message.css">
	
<script src="${APP_PATH }/static/js/jquery-3.2.1.min.js"></script>
<script
	src="${APP_PATH }/static/backstage/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
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
	<%@ include file="/WEB-INF/view/public/header.jsp"%>
	<div id="nTalk_post_hiddenElement"
		style="left: -10px; top: -10px; visibility: hidden; display: none; width: 1px; height: 1px;"></div>

	<div class="store-wrap">
		<div class="main clearfix">
			<c:set value="active" var="mysider_status1"></c:set>
			<%@ include file="/WEB-INF/view/public/mysider.jsp"%>
			<div class="right-content f-fr">
				<div class="order-main">
					<div class="type-tab-btn">
						<a href="javascript:;" class="allOrder active" data-type="-1"
							data-bh="click_store_mc_orderstatus_all">全部订单</a>
						<!-- <i class="line">|</i>
						<a class="waitPay" href="javascript:;" data-type="0"
							data-bh="click_store_mc_orderstatus_1">待付款<span
							class="amount _actAmount"></span></a><i class="line">|</i> <a
							class="waitDeliver" href="javascript:;" data-type="1"
							data-bh="click_store_mc_orderstatus_2">待发货</a><i class="line">|</i>
						<a class="hasDeliver" href="javascript:;" data-type="2"
							data-bh="click_store_mc_orderstatus_3">已发货</a><i class="line">|</i>
						<a class="other" href="javascript:;" data-type="99"
							data-bh="click_store_mc_orderstatus_other">其他</a> -->
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
						<c:if test="${orders == null }">
							<div class="ui-load-content J_no_data">
								<p class="J_no_data_des">您暂无此类订单，赶快去下单吧！</p>
							</div>
						</c:if>
						<c:if test="${orders != null }">
							<div class="ui-load-content">
								<input id="unPayNum" type="hidden" value="0">
								<table class="orderItem">
									<tbody>
										<c:forEach items="${orders }" var="order">
											<tr class="trHead">
												<td colspan="4" class="title clearfix">
													<div class="f-fl">
														下单时间： <span class="time"> <fmt:formatDate
																value="${order.key.generateTime }"
																pattern="yyyy-MM-dd HH:ss" />
														</span> 订单号： <span class="orderNumber">
															${order.key.orderNumber } </span>
													</div>
												</td>
											</tr>
											<tr class="list-box b-l b-r b-b">
												<td class="list b-r j-iamCart">
													<div class="cart-wrap j-CartWrap">
														<div class="shop j-shop">
															<c:set value="0.0" var="totalPrice"></c:set>
															<c:forEach items="${order.value }" var="commodity">
																<div class="item b-t clearfix j-iamMain"
																	style="width: 100%;">
																	<a class="productDetail nameWidth" href="#"> <img
																		src="${commodity.key.commodityCover }" class="f-fl">
																	</a>
																	<div class="describe f-fl ">
																		<div class="vertic clearfix">
																			<span class="clearfix"> <a
																				title="${commodity.key.commotityName }"
																				class="productDetail nameWidth" href="#">
																					${commodity.key.commotityName } </a>
																				<p>${commodity.value }</p>
																				<p>
																					￥
																					<fmt:formatNumber value="${commodity.key.price }"
																						maxFractionDigits="2" minFractionDigits="2">
																					</fmt:formatNumber>
																					×${commodity.key.quantity }
																				</p> <c:set
																					value="${totalPrice + commodity.key.price * commodity.key.quantity }"
																					var="totalPrice"></c:set>
																			</span>
																		</div>
																	</div>
																	<c:if test="${order.key.status==3 }">
																		<label class="comment-btn" data-toggle="modal" data-orderid="${order.key.id }" data-commodityid="${commodity.key.commodityId }"
																			data-target="#modal_comment"
																			style="margin-top: 50px; width: 70px; height: 24px; background: #F66567; color: #fff; text-align: center; line-height: 24px; border-radius: 4px; float: right; cursor: pointer;">
																			评价 </label>
																	</c:if>
																</div>
															</c:forEach>
														</div>

													</div>
												</td>
												<td class="b-r w125 center price b-t">
													<div class="priceDiv">
														￥
														<fmt:formatNumber value="${totalPrice }"
															maxFractionDigits="2" minFractionDigits="2">
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
															<li class="goPay"><a
																href="${APP_PATH }/alipay?groupId=${order.key.groupId }">
																	立即付款 </a></li>
														</c:if>
														<c:if test="${order.key.status == 2 }">
															<li data-orderid="${order.key.id }"
																class="confirm_receive"
																style="margin-bottom: 5px; width: 70px; height: 24px; background: #367fa9; color: #fff; text-align: center; line-height: 24px; border-radius: 4px; cursor: pointer;">
																确认收货</li>
														</c:if>
														<c:if test="${order.key.status == 3 }">
															<li data-orderid="${order.key.id }"
																class="goPay remove_order" style="background: #ff851b">
																删除订单</li>
														</c:if>
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
						</c:if>
					</div>
					<input type="hidden" id="pageId" value="0">
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="modal_comment" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header" style="border: none;">
					<h4 class="modal-title" id="myModalLabel">评论</h4>
				</div>
				<div class="modal-body">
					<!-- <div class="tm-rate-premiere">
						<div class="tm-rate-tag">
							<div class="tm-rate-title">初次评论:</div>
							<div class="tm-rate-title">2019-4-30</div>
						</div>
						<div title="删除" style="postion: absolute; top: 0px; right: 0px;">
							<button type="button" class="close">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="tm-rate-content">
							<div class="tm-rate-fulltxt">物美价廉，非常实惠，强烈推荐</div>

							<div class="tm-m-photos">
								<ul class="tm-m-photos-thumb">

									<li><img
										src="/online-shopping/static/images/comment_images/O1CN0122AEDTONiTEEAnd_!!1917047079.jpg">
									</li>

									<li><img
										src="/online-shopping/static/images/comment_images/TB2Emm3tS8YBeNkSnb4XXaevFXa_!!901409638.jpg_40x40q90.jpg">
									</li>

								</ul>
							</div>

						</div>
						<div class="tm-rate-reply">
							<div class="tm-rate-fulltxt" style="color: #AF874D;">解释：一千几百块，买不了楼房，买不了跑车，但是，您可以买到魅妹爱您的心漫天星辰夜寂寥，魅妹为您解烦忧，如您有疑问或不清楚的地方，记得来联系魅妹哦！魅妹会给您解答疑惑哒！欢迎再次光临，么么哒！</div>
						</div>
					</div> -->
					<div class="form-group">
						<label for="name">评论输入</label>
						<textarea id="comment" class="form-control" rows="6" name="comment"></textarea>
					</div>
					<style>
						.images-upload li {
							border : 1px dotted #ccc;
							width: 100px;
							height: 100px;
							cursor: pointer;
							float: left;
							margin-left: 10px;
							position: relative;
						}
						.my-clear-float {
							clear: both;
						}
						.my-icon {
							width: 40px;
    						height: 40px;
    						margin: 0 auto;
    						background-position: -716px -332px;
    						margin-top: 25px;
    						background-image: url(${APP_PATH}/static/images/icons.png);
    						transition: background .2s ease;
						}
						.images-upload li:hover {
							border: 1px solid #00a1d6;
						}
						.images-upload li:hover .my-icon {
							background-position: -716px -396px;
						}
						.images-upload li input {
							display: none;
						}
						.images-upload li img {
							width: 100px;
							height: 100px;
						}
						.my-remove-image {
							position: absolute;
							top: 5px;
							right: 2px;
							display: none;
							color: 
						}
						.images-upload li:hover .my-remove-image {
							display: block;
						}
					</style>
					<div>
						<p style="font-weight: 700;">图片上传</p>
						<ul class="images-upload">
							<li>
								<div class="my-icon"></div>
								<img style="display: none;">
								<input type="file" accept="image/*">
							</li>
						</ul>
						<div class="my-clear-float"></div>
					</div>
				</div>
				<div class="modal-footer" style="border: none;">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" id="comment_btn" class="btn btn-primary">评论</button>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/view/public/footer.jsp"%>
	<script type="text/javascript">
		var APP_PATH = "${APP_PATH }";
	</script>
	<script src="${APP_PATH }/static/js/jquery-confirm.min.js"></script>
	<script src="${APP_PATH }/static/js/sco.message.js"></script>
	<script src="${APP_PATH }/static/js/myorder.js"></script>
</body>
</html>