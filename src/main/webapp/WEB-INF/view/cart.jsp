<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("APP_PATH", request.getContextPath()); %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="x-ua-compatible" content="ie=edge">
		<title>购物车</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<link href="${APP_PATH }/static/css/header/meizu_header/header.css" rel="stylesheet">
		<link rel="stylesheet" href="${APP_PATH }/static/css/cart/layout-a2ae44047d.css">
		<link href="${APP_PATH }/static/css/cart/cart-189e8e56b7.css" rel="stylesheet">
		
		<script src="${APP_PATH }/static/js/jquery-3.2.1.min.js"></script>
	</head>

	<body>
		<%@ include file="/WEB-INF/view/public/header.jsp" %>
		<div class="cart" id="cart">
			<div class="cart-login-tips" id="cartLoginTips">
				<i class="cart-login-tips-icon"></i> 您还没有登录！登录后可显示您账号中已加入的商品哦~
				<a class="mz-btn s success" href="javascript:void(0);" data-mdesc="登录提示" data-mtype="store_cart_tip_login" data-bh="click_store_cart_tip_login">
					去登录
				</a>
				<div class="close-tips" id="closeTips"></div>
			</div>

			<div class="mzcontainer">
				<table class="cart-header">
					<tbody>
						<tr>
							<td class="cart-col-select">
								<div class="cart-select-all JSelectAll" data-mdesc="全选按钮" data-mtype="store_cart_all" data-bh="click_store_cart_all">
									<div class="mz-checkbox"></div>
									<span class="cart-select-title">全选</span>
								</div>
							</td>
							<td class="cart-col-price">单价(元)</td>
							<td class="cart-col-number">数量</td>
							<td class="cart-col-total">小计(元)</td>
							<td class="cart-col-ctrl show" id="J-cartHearCtrl">删除</td>
						</tr>
					</tbody>
				</table>
				<ul class="cart-merchant-list" id="merchantList">
					<c:forEach items="${groups }" var="group">
					<li class="cart-merchant">
						<div class="cart-merchant-header">

							<div class="cart-select-all">
								<div class="mz-checkbox"></div>
								<span class="cart-select-title">${group.key }</span>
							</div>

						</div>
						<table class="cart-merchant-body">	
							<c:forEach items="${group.value }" var="cartItem">
							<tr class="cart-product" data-row="${cartItem.row }">
								<td class="cart-col-select">

									<div class="mz-checkbox"></div>

									<a href="${APP_PATH }/product/${cartItem.commodityId }" class="cart-product-link" target="_blank" data-mdesc="购物车商品位" data-mtype="click_store_cart_prod" data-bh="click_store_cart_prod">
										<img class="cart-product-img" src="${cartItem.coverImage }" style="display: inline;">
									</a>
									<a href="${APP_PATH }/product/${cartItem.commodityId }" class="cart-product-link cart-product-info" target="_blank" data-mdesc="购物车商品位" data-mtype="click_store_cart_prod" data-bh="click_store_cart_prod">
										<p class="cart-product-item-name" title="${cartItem.title }">${cartItem.title }</p>
										<p class="cart-product-desc">${cartItem.commodityParameter }</p>
									</a>
								</td>
								<td class="cart-col-price">
									<p>
										<c:if test="${cartItem.promotionPrice==null }">
										<span class="cart-product-price">
											<fmt:formatNumber value="${cartItem.price }" minFractionDigits="2" maxFractionDigits="2" groupingUsed="false"></fmt:formatNumber>
										</span>
										</c:if>
										<c:if test="${cartItem.promotionPrice!=null }">
										<span class="cart-product-price">
											<fmt:formatNumber value="${cartItem.promotionPrice }" minFractionDigits="2" maxFractionDigits="2" groupingUsed="false"></fmt:formatNumber>
										</span>
										</c:if>
									</p>
								</td>
								<td class="cart-col-number">

									<div class="cart-product-number-adder">
										<p class="cart-product-number-max show">
										
										</p>
										<div class="mz-adder">
											<button class="mz-adder-subtract"></button>
											<div class="mz-adder-num"><input type="text" class="mz-adder-input" value="${cartItem.quantity }"></div>
											<button class="mz-adder-add"></button>
										</div>
									</div>

								</td>
								<td class="cart-col-total">
									<span class="cart-product-price total main-goods">
										<c:if test="${cartItem.promotionPrice==null }">
										<fmt:formatNumber value="${cartItem.price*cartItem.quantity }" minFractionDigits="2" maxFractionDigits="2" groupingUsed="false"></fmt:formatNumber>
										</c:if>
										<c:if test="${cartItem.promotionPrice!=null }">
										<fmt:formatNumber value="${cartItem.promotionPrice*cartItem.quantity }" minFractionDigits="2" maxFractionDigits="2" groupingUsed="false"></fmt:formatNumber>
										</c:if>
									</span>
								</td>
								<td class="cart-col-ctrl">
									<div class="cart-product-remove  let-show" data-mdesc="删除单个商品按钮" data-mtype="click_store_cart_del" data-bh="click_store_cart_del"></div>
								</td>
							</tr>
							</c:forEach>
						</table>
					</li>
					</c:forEach>
				</ul>
			</div>

			<div class="cart-footer" id="cartFooter">
				<div class="mzcontainer">
					<div class="cart-footer-left">
						<div class="cart-select-all JSelectAll" data-mdesc="全选按钮" data-mtype="store_cart_all" data-bh="click_store_cart_all">
							<div class="mz-checkbox"></div>
							<span class="cart-select-title">全选</span>
						</div>
						<span class="cart-remove-selected" data-mdesc="删除选中商品" data-mtype="store_cart_batch" data-bh="click_store_cart_batch" id="removeSelected">删除选中的商品</span>
						<span class="cart-footer-count">
          共<span class="cart-footer-num" id="totalCount">${totalCount }</span>件商品， 已选择
						<span class="cart-footer-num blue" id="totalSelectedCount">0</span>件
						</span>
					</div>
					<div class="cart-footer-right">
						<span class="cart-footer-sum">          合计：<span class="cart-footer-total" id="totalPrice">0.00</span>
						</span>
						<div class="mz-btn success to-order-btn disabled" id="cartSubmit" data-mdesc="去结算按钮" data-mtype="store_cart_checkout" data-bh="click_store_cart_checkout">去结算
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="mz-mask hide" id="confirm_box">
			<div class="mz-dialog dialog ">
				<div class="mz-dialog-header">
					<div class="mz-dialog-title">删除</div>
					<div class="mz-dialog-close"></div>
				</div>
				<div class="mz-dialog-main">
					<div class="mz-dialog-warp">

						<div class="mz-dialog-content">您确定要删除该商品吗？</div>
					</div>
				</div>

				<div class="mz-dialog-bottom">

					<div class="mz-btn cancel">删除</div>

					<div class="mz-btn success">取消</div>

				</div>

			</div>

		</div>　
		<%@ include file="/WEB-INF/view/public/loading.jsp"%>
		<%@ include file="/WEB-INF/view/public/footer.jsp" %>
	</body>
<script src="${APP_PATH }/static/js/cart.js"></script>
</html>
