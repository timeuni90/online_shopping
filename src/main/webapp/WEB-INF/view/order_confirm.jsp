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
<link href="${APP_PATH }/static/css/header/meizu_header/header.css" rel="stylesheet">
<link rel="stylesheet"
	href="${APP_PATH }/static/css/order_confirm/layout-a2ae44047d.css">
<link href="${APP_PATH }/static/css/order_confirm/add-8f4ba0d484.css"
	rel="stylesheet">
<script src="${APP_PATH }/static/js/jquery-3.2.1.min.js"></script>
</head>

<body>
	<%@ include file="/WEB-INF/view/header/meizu_header.jsp" %>
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
							<!-- <div class="order-address-checkbox-edit"></div> -->
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
									<tr data-row="${item.row }" data-commodityid="${item.commodityId }">
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
	<%@ include file="/WEB-INF/view/public/loading.jsp"%>
</body>
<script type="text/javascript"
	src="${APP_PATH }/static/js/order_confirm.js"></script>
</html>
