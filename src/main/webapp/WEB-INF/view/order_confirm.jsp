<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>确认订单</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${APP_PATH }/static/css/sousuo/global.css">
<link rel="stylesheet"
	href="${APP_PATH }/static/css/order_confirm/layout-a2ae44047d.css">
<link href="${APP_PATH }/static/css/order_confirm/add-8f4ba0d484.css"
	rel="stylesheet">
<script src="${APP_PATH }/static/js/jquery-3.2.1.min.js"></script>
</head>

<body>
	<%@ include file="/WEB-INF/view/header.jsp"%>
	<!-- common header -->
	<!-- <div class="layout-header clearfix layout-header-order login"
		id="layoutHeader">
		<div class="mzcontainer">
			<div class="layout-header-logo">
				<a target="_blank" href="http://www.meizu.com"
					class="layout-header-logo-link" alt="魅族科技" data-mdesc="购物车页头logo"
					data-mtype="store_cart_yt_logo" data-bh="click_store_cart_yt_logo">
					<img
					src="data:image/png;base64,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"
					style="max-width: 125px; margin-top: 28px;">
				</a>
			</div>
			<ul class="layout-header-bread">
				<li class="layout-header-bread-block ">购物车</li>
				<li class="layout-header-bread-block active">确认订单</li>
				<li class="layout-header-bread-block ">在线支付</li>
				<li class="layout-header-bread-block ">完成</li>
			</ul>
			<ul class="layout-header-right">
				<li class="layout-header-right-item"><a
					class="layout-header-right-link"
					href="//ordercenter.meizu.com/list/index.html" target="_blank"
					data-mdesc="购物车页头-我的订单" data-mtype="store_cart_yt_order"
					data-bh="click_store_cart_yt_order">我的订单</a></li>
				<li class="layout-header-right-item signout"><a
					class="layout-header-right-link" data-mdesc="购物车页头-登录"
					data-mtype="store_cart_yt_login"
					data-bh="click_store_cart_yt_login"
					href="javascript:window.location.href='https://login.flyme.cn/vCodeLogin?sid=unionlogin&amp;service=store&amp;autodirct=true&amp;useruri=http://store.meizu.com/member/login.htm?useruri='+ encodeURIComponent(encodeURIComponent(window.location.href));">登录</a>
				</li>
				<li class="layout-header-right-item signout"><a
					class="layout-header-right-link" data-mdesc="购物车页头-注册"
					data-mtype="store_cart_yt_register"
					data-bh="click_store_cart_yt_register" target="_blank"
					href="//member.meizu.com/register">注册</a></li>
				<li class="layout-member signin"><a class="layout-member-link"
					target="_blank" href="http://me.meizu.com/member/index"><span
						class="layout-member-username" id="topbarUser">用户607640492</span>的商城<i
						class="layout-member-triangle"></i></a>
					<ul class="layout-member-downmenu">
						<li class="layout-member-downmenu-item"><a
							class="layout-member-downmenu-link" data-mdesc="我的商城下拉框1"
							data-mtype="store_index_yt_my_1"
							data-bh="click_store_index_yt_my_1" target="_blank"
							href="//me.meizu.com/member/address/index">地址管理</a></li>
						<li class="layout-member-downmenu-item"><a
							class="layout-member-downmenu-link" data-mdesc="页头-收藏"
							data-mtype="store_index_yt_collect"
							data-bh="click_store_index_yt_collect" target="_blank"
							href="//me.meizu.com/member/favorite/index">我的收藏</a></li>
						<li class="layout-member-downmenu-item"><a
							class="layout-member-downmenu-link" data-mdesc="我的商城下拉框2"
							data-mtype="store_index_yt_my_2"
							data-bh="click_store_index_yt_my_2" target="_blank"
							href="//mcycle.meizu.com/page/balance_log">我的回购金</a></li>
						<li class="layout-member-downmenu-item"><a
							class="layout-member-downmenu-link" data-mdesc="我的商城下拉框3"
							data-mtype="store_index_yt_my_3"
							data-bh="click_store_index_yt_my_3" target="_blank"
							href="//me.meizu.com/member/advice/index">问题反馈</a></li>
						<li class="layout-member-downmenu-item"><a
							class="layout-member-downmenu-link exit" data-mdesc="我的商城下拉框4"
							data-mtype="store_index_yt_my_4"
							data-bh="click_store_index_yt_my_4"
							href="javascript:window.location.href='http://store.meizu.com/member/logout.htm?useruri='+ encodeURIComponent(encodeURIComponent(window.location.href));">退出</a>
						</li>
					</ul></li>
			</ul>
		</div>
	</div> -->

	<div class="order">
		<div class="mzcontainer">
			<div class="order-address" id="addressModule">
				<div class="order-address-title">
					收货人信息
					<div class="order-address-title-tips" id="orderAddressHasOldTips">
						<i class="order-address-tips-icon"></i>因配送地址库升级，部分地址需升级后方可使用！
					</div>
				</div>
				<fmt:formatNumber
					value="${(fn:length(addressDetails)-fn:length(addressDetails)%4)/4}"
					pattern="##" type="NUMBER" var="count"></fmt:formatNumber>
				<c:set value="${(count+1)*174 }" var="height"></c:set>
				<ul class="order-address-list clearfix" id="addressList"
					style="height: ${height }px;">
					<c:forEach items="${addressDetails }" var="addressDetail"
						varStatus="status">
						<c:if test="${status.index == 0 }">
						<li class="order-address-checkbox checked" data-id="${addressDetail.id }" data-mdesc="收货人信息"
								data-mtype="click_store_se_adr" data-bh="click_store_se_adr">
						</c:if>
						<c:if test="${status.index != 0 }">
						<li class="order-address-checkbox" data-id="${addressDetail.id }" data-mdesc="收货人信息"
								data-mtype="click_store_se_adr" data-bh="click_store_se_adr">
						</c:if>
						<div class="order-address-checkbox-top">
							<div class="order-address-checkbox-name">${addressDetail.receiver }</div>
							<div class="order-address-checkbox-phone">${addressDetail.phoneNumber }</div>
						</div>
						<div class="order-address-checkbox-content">${addressDetail.detailAddress }</div>
						<div class="order-address-checkbox-checked">
							<div class="order-address-checkbox-tick"></div>
						</div>

						<div class="order-address-checkbox-ctrl">
							<div class="order-address-checkbox-delete"></div>
							<div class="order-address-checkbox-edit"></div>
						</div>
						</li>
					</c:forEach>
					<li class="order-address-checkbox add">
						<div class="order-add-icon"></div>
						<div class="order-address-add-text">添加新地址</div>
					</li>
				</ul>
				<div class="order-address-bottom">
					<div class="order-address-more" id="orderAddressMore">
						<p class="order-address-more-text">点击显示更多地址</p>
						<i class="order-address-triangle"></i>
					</div>
				</div>
				<div class="mz-loading-mask"
					style="width: 1240px; height: 246px; display: none;">
					<div class="mz-loading spinner">
						<div class="mz-bounce mz-bounce1"></div>
						<div class="mz-bounce mz-bounce2"></div>
						<div class="mz-bounce mz-bounce3"></div>
					</div>
				</div>
			</div>

			<div class="mzcontainer order-product">
				<div class="order-product-title">确认订单信息</div>
				<div class="order-product-list" id="orderProductList">
					<c:forEach items="${groups }" var="group">
						<c:set value="0.0" var="sellerTotalPrice"></c:set>
						<table cellpadding="0" cellspacing="0" class="order-product-table">
							<thead>
								<tr>
									<th class="order-product-table-name">
										<div class="order-product-supplier">
											供应商：<span class="order-product-supplier-name">${group.key }</span>
										</div>
									</th>
									<th class="order-product-table-price">单价</th>
									<th class="order-product-table-num">数量</th>
									<th class="order-product-table-total">小计</th>
									<th class="order-product-table-express table-express-header">配送方式</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${group.value }" var="item" varStatus="status">
									<tr>
										<td class="order-product-table-name"><a target="_blank"
											class="order-product-link"
											href="//detail.meizu.com/item/meizu_power_bank_3.html"
											data-mdesc="确认订单信息" data-mtype="click_store_se_ord"
											data-bh="click_store_se_ord"> <img
												class="order-product-image" src="${item.coverImage }"
												style="display: inline;">
										</a>
											<div class="order-product-name">
												<a target="_blank" class="order-product-link"
													href="${APP_PATH }/product/${item.commodityId }">
													<p class="order-product-name-item item-name"
														title="${item.title}">${item.title}</p>
													<p class="order-product-name-item cspu-desc"
														title="${item.commodityParameter }">${item.commodityParameter }</p>
												</a>
											</div></td>
										<td class="order-product-table-price">
											<p>
												<span class="order-product-price"> <c:if
														test="${item.promotionPrice==null }">
														<fmt:formatNumber value="${item.price }"
															minFractionDigits="2" maxFractionDigits="2"
															groupingUsed="false">
														</fmt:formatNumber>
													</c:if> <c:if test="${item.promotionPrice!=null }">
														<fmt:formatNumber value="${item.promotionPrice }"
															minFractionDigits="2" maxFractionDigits="2"
															groupingUsed="false">
														</fmt:formatNumber>
													</c:if>
												</span>
											</p>
										</td>
										<td class="order-product-table-num">${item.quantity }</td>
										<td class="order-product-table-total">
											<p class="order-product-price red">
												<c:if test="${item.promotionPrice==null }">
													<fmt:formatNumber value="${item.price*item.quantity }"
														minFractionDigits="2" maxFractionDigits="2"
														groupingUsed="false"></fmt:formatNumber>
													<c:set
														value="${sellerTotalPrice+item.price*item.quantity }"
														var="sellerTotalPrice"></c:set>
												</c:if>
												<c:if test="${item.promotionPrice!=null }">
													<fmt:formatNumber
														value="${item.promotionPrice*item.quantity }"
														minFractionDigits="2" maxFractionDigits="2"
														groupingUsed="false"></fmt:formatNumber>
													<c:set
														value="${sellerTotalPrice+item.promotionPrice*item.quantity }"
														var="sellerTotalPrice"></c:set>
												</c:if>
											</p>
										</td>
										<c:if test="${status.index==0 }">
											<td class="order-product-table-express" rowspan="999">
												<p>
													快递配送：运费<span
														class="order-product-price red express-fee has-express-fee">0.00</span>
												</p>
											</td>
										</c:if>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr class="order-product-footer">
									<td colspan="3" class="order-product-info">

										<div class="order-product-invoice clearfix">

											<div class="order-product-invoice-type">
												发票类型：电子发票
												<div class="order-product-invoice-icon"></div>
											</div>

											<span class="order-product-invoice-edit">修改</span>
											<div class="order-product-invoice-info">
												<p>
													发票抬头：<span class="order-product-invoice-title">默认为收货人姓名</span>
												</p>
												<p class="order-product-company">
													纳税人识别号：<span class="order-product-invoice-identify"></span>
												</p>
												<p class="order-product-company">
													开户行及账号：<span class="order-product-invoice-bank"></span>
												</p>
											</div>
										</div>

									</td>
									<td colspan="2" class="order-product-total">合计： <span
										class="order-product-price red total-has-express-fee">
											<fmt:formatNumber value="${sellerTotalPrice }"
												minFractionDigits="2" maxFractionDigits="2"
												groupingUsed="false">
											</fmt:formatNumber>
									</span>
									</td>
								</tr>
								<tr class="order-product-remark">
									<td colspan="5"><span class="order-product-remark-title">备注：</span>
										<textarea class="order-product-remark-input" maxlength="45"></textarea>
									</td>
								</tr>
							</tfoot>
						</table>
					</c:forEach>
				</div>
			</div>

			<div class="mzcontainer order-invoice" id="orderInvoice">
				<div class="order-invoice-header">发票信息</div>
				<ul class="order-invoice-list" id="orderInvoiceList"></ul>
			</div>

			<div class="order-total clearfix" id="orderTotal">
				<div class="order-total-pay">
					<div class="order-total-pay-header">选择支付方式</div>
					<div class="order-total-pay-content" id="payToolsContent">
						<div class="order-total-pay-row clearfix">
							<div class="order-total-pay-title">支付宝</div>
							<ul class="order-total-pay-list clearfix">

								<li class="order-total-pay-label alipay active"
									data-bh="click_store_pay_pm_alipay">
									<div class="order-total-pay-radio"></div>
									<div class="order-total-pay-img"></div>

								</li>

							</ul>

						</div>

						<div class="order-total-pay-row clearfix">
							<div class="order-total-pay-title">微信支付</div>
							<ul class="order-total-pay-list clearfix">

								<li class="order-total-pay-label wechat"
									data-bh="click_store_pay_pm_wechat">
									<div class="order-total-pay-radio"></div>
									<div class="order-total-pay-img"></div>

								</li>

							</ul>

						</div>
					</div>
				</div>

				<div class="order-total-content">
					<div class="order-total-row">
						总金额：
						<div class="order-total-price" id="totalOrderPrice">
							<fmt:formatNumber value="${totalPrice }" groupingUsed="false"
								maxFractionDigits="2" minFractionDigits="2">
							</fmt:formatNumber>
						</div>
					</div>
					<div class="order-total-row order-total-discount"
						id="totalCouponRow">
						优惠券：
						<div class="order-total-price sub">0.00</div>
					</div>
					<div class="order-total-row order-total-discount" id="totalRedRow">
						红包：
						<div class="order-total-price sub">0.00</div>
					</div>
					<div class="order-total-row order-total-discount" id="totalRepoRow"
						style="display: none;">
						回购金：
						<div class="order-total-price sub">0.00</div>
					</div>
					<div class="order-total-row order-total-discount" id="totalGiftRow">
						礼品卡：
						<div class="order-total-price sub">0.00</div>
					</div>
					<div class="order-total-row">
						运费
						<div class="order-total-price" id="totalExpressPrice">0.00</div>
					</div>
					<div class="order-total-line"></div>
					<div class="order-total-row">
						应付：
						<div class="order-total-price total" id="totalPayPrice">
							<fmt:formatNumber value="${totalPrice }" groupingUsed="false"
								maxFractionDigits="2" minFractionDigits="2">
							</fmt:formatNumber>
						</div>
					</div>
					<div class="order-total-row order-total-valid-row clearfix">
						<div class="order-total-valid" id="validCode"></div>
						<div class="mz-btn success" id="submitForm" data-mdesc="下单并支付"
							data-mtype="store_se_pay" data-bh="click_store_se_pay">下单并支付</div>
						<div class="order-stock-tips-wrap" id="orderStockTips"
							style="display: block;">
							<div class="order-stock-tips">该订单含付款减库存商品，支付完成后才会为您预留库存！</div>
						</div>
					</div>
					<div class="order-total-row order-total-row-tips" id="totalTips"></div>
				</div>
			</div>
		</div>
	</div>

	<!-- end content -->

	<div class="mz-mask hide">
		<div class="mz-dialog tips ">
			<div class="mz-dialog-header">
				<div class="mz-dialog-title">提示</div>
				<div class="mz-dialog-close"></div>
			</div>
			<div class="mz-dialog-main">
				<div class="mz-dialog-warp">

					<div class="mz-dialog-content"></div>
				</div>
			</div>

			<div class="mz-dialog-bottom">

				<div class="mz-btn success">确定</div>

			</div>

		</div>
	</div>
	<div class="mz-mask hide">
		<div class="mz-dialog dialog order-pay-dialog">
			<div class="mz-dialog-header">
				<div class="mz-dialog-title">请使用微信扫码完成支付</div>
				<div class="mz-dialog-close hide"></div>
			</div>
			<div class="mz-dialog-main">
				<div class="mz-dialog-warp">

					<div class="mz-dialog-content">
						<div class="order-pay-dialog-qrcode"></div>
					</div>
				</div>
			</div>

			<div class="mz-dialog-bottom"></div>

		</div>
	</div>
	<div class="mz-mask hide">
		<div class="mz-dialog tips ">
			<div class="mz-dialog-header">
				<div class="mz-dialog-title">提示</div>
				<div class="mz-dialog-close"></div>
			</div>
			<div class="mz-dialog-main">
				<div class="mz-dialog-warp">

					<div class="mz-dialog-content"></div>
				</div>
			</div>

			<div class="mz-dialog-bottom">

				<div class="mz-btn success">确定</div>

			</div>

		</div>
	</div>
	<div class="mz-mask hide" id="address_inf">
		<div class="mz-dialog dialog address-adder"
			style="margin-left: -380px; margin-top: -181.5px;">
			<div class="mz-dialog-header">
				<div class="mz-dialog-title">添加新地址</div>
				<div class="mz-dialog-close"></div>
			</div>
			<div class="mz-dialog-main">
				<div class="mz-dialog-warp">

					<div class="mz-dialog-content">
						<div class="address-adder-content">
							<div class="address-adder-row clearfix">
								<div class="address-adder-title">
									收货人姓名<span class="address-adder-must">*</span>
								</div>
								<div class="mz-input-warp" data-tips=" ">
									<input type="text" class="mz-input address-adder-name"
										placeholder="姓名长度不超过15个文字" value="" maxlength="15">
								</div>
								<div class="address-adder-title">
									收货人手机号<span class="address-adder-must">*</span>
								</div>
								<div class="mz-input-warp" data-tips=" ">
									<input type="text" class="mz-input address-adder-phone"
										placeholder="请输入11位手机号" value="" maxlength="11">
								</div>
							</div>
							<div class="address-adder-row clearfix">
								<div class="address-adder-title">
									收货人地址<span class="address-adder-must">*</span>
								</div>
								<div class="mz-input-warp address-adder-select mz-address"
									data-tips=" ">
									<div class="mz-selectmenu">
										<input id="province_input" type="text" readonly="readonly"
											tabindex="-1" class="mz-downmenu-input" placeholder="省份/直辖市">
										<input type="hidden" tabindex="-1" value="27304" name="">
									</div>
									<div class="mz-selectmenu">
										<input id="city_input" type="text" readonly="readonly" tabindex="-1" class="mz-downmenu-input" placeholder="城市">
										<input type="hidden" tabindex="-1" value="29316" name="">
									</div>
									<div class="mz-selectmenu">
										<input id="area_input" type="text" readonly="readonly" tabindex="-1"
											class="mz-downmenu-input" placeholder="区/县"><input
											type="hidden" tabindex="-1" value="29317" name="">
									</div>
								</div>
							</div>
							<div class="address-adder-row clearfix address-adder-other"
								style="display: none;">
								<div class="address-adder-title">其他</div>
							</div>
							<div class="address-adder-row clearfix">
								<div class="address-adder-title">
									详细地址<span class="address-adder-must">*</span>
								</div>
								<div class="mz-input-warp" data-tips=" ">
									<input type="text" class="mz-input address-adder-detail"
										placeholder="请输入4-50个文字的详细地址，例如路名、门牌号" value="" maxlength="50"
										minlength="4">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="mz-dialog-bottom">

				<div class="mz-btn success">确认</div>

				<div class="mz-btn cancel">取消</div>

			</div>

		</div>
	</div>
	<div class="mz-downmenu"
		style="top: 484.969px; left: 728.5px; width: 118px; display: none;">
		<ul class="mz-downmenu-list">
		</ul>
	</div>
	<div class="mz-downmenu"
		style="top: 484.969px; left: 858.5px; width: 118px; display: none;">
		<ul class="mz-downmenu-list">
			
		</ul>
	</div>
	<div class="mz-downmenu"
		style="top: 484.969px; left: 988.5px; width: 118px; display: none;">
		<ul class="mz-downmenu-list">
			
		</ul>
	</div>
	<div class="mz-mask hide">
		<div class="mz-dialog tips ">
			<div class="mz-dialog-header">
				<div class="mz-dialog-title">提示</div>
				<div class="mz-dialog-close"></div>
			</div>
			<div class="mz-dialog-main">
				<div class="mz-dialog-warp">

					<div class="mz-dialog-content"></div>
				</div>
			</div>

			<div class="mz-dialog-bottom">

				<div class="mz-btn success">确定</div>

			</div>

		</div>
	</div>
	<div class="mz-mask hide">
		<div class="mz-dialog tips ">
			<div class="mz-dialog-header">
				<div class="mz-dialog-title">提示</div>
				<div class="mz-dialog-close"></div>
			</div>
			<div class="mz-dialog-main">
				<div class="mz-dialog-warp">

					<div class="mz-dialog-content"></div>
				</div>
			</div>

			<div class="mz-dialog-bottom">

				<div class="mz-btn success">确定</div>

			</div>

		</div>
	</div>
	<div class="mz-mask hide">
		<div class="mz-dialog tips ">
			<div class="mz-dialog-header">
				<div class="mz-dialog-title">提示</div>
				<div class="mz-dialog-close"></div>
			</div>
			<div class="mz-dialog-main">
				<div class="mz-dialog-warp">

					<div class="mz-dialog-content"></div>
				</div>
			</div>

			<div class="mz-dialog-bottom">

				<div class="mz-btn success">确定</div>

			</div>

		</div>
	</div>

	<div class="layout-magnet" style="bottom: 100px;">
		<ul class="layout-magnet-list">

			<li class="layout-magnet-item layout-magnet-item-app"><a
				href="javascript:void(0);" class="layout-magnet-link">
					<div class="layout-magnet-icon">
						<i class="layout-font layout-font-app"></i>
					</div>
					<div class="layout-magnet-text">&nbsp;</div>
					<div class="layout-magnet-download">
						<div class="layout-magnet-download-body">
							<img src="//store.res.meizu.com/layout/img/qrcode-3389e5b72a.png"
								class="layout-magnet-qrcode" alt="QRCode">
							<p class="layout-magnet-download-text">扫码下载魅族商城APP</p>
						</div>
					</div>
			</a></li>

			<li class="layout-magnet-item layout-magnet-item-top"><a
				href="javascript:void(0);" class="layout-magnet-link"
				data-mtype="click_wmz_public_cbxf_top"
				data-bh="click_wmz_public_cbxf_top">
					<div class="layout-magnet-icon">
						<i class="layout-font layout-font-top"></i>
					</div>
					<div class="layout-magnet-text">回到顶部</div>
			</a></li>

		</ul>
		<a
			class="layout-magnet-minimize layout-magnet-icon layout-magnet-link"
			href="javascript:void(0);"> <i
			class="layout-font layout-font-minimize"></i>
		</a>
	</div>
</body>
<script type="text/javascript"
	src="${APP_PATH }/static/js/order_confirm.js"></script>
</html>
