<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<%
	pageContext.setAttribute("com_sel",
			new com.timeuni.resourcebundle.ResourceLocation().getCommoditySelectPropertyMediaLocation());
%>
<%
	pageContext.setAttribute("com_media_loc",
			new com.timeuni.resourcebundle.ResourceLocation().getCommdotiyMediaResourcesLocation());
%>
<%
	pageContext.setAttribute("comment_images_location",
			new com.timeuni.resourcebundle.ResourceLocation().getCommentImagesLocation());
%>
<!DOCTYPE html>
<html
	class="w1190 ks-webkit537 ks-webkit ks-chrome73 ks-chrome browser-Chromium">
<head>
<title>商品</title>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">

<!-- adminlte的样式 -->
<link rel="stylesheet"
	href="${APP_PATH }/static/backstage/bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${APP_PATH }/static/backstage/bower_components/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${APP_PATH }/static/backstage/bower_components/Ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="${APP_PATH }/static/backstage/dist/css/AdminLTE.min.css">
	
<!-- globalmodule version: 3.0.83 -->
<link rel="stylesheet" href="${APP_PATH }/static/css/commodity_detail/detail.css">
<link rel="stylesheet" href="${APP_PATH }/static/css/commodity_detail/detail-3c.css">
<link rel="stylesheet" href="${APP_PATH }/static/css/commodity_detail/modules-other-tmall-default-min.css">

<link rel="stylesheet" href="${APP_PATH }/static/css/commodity_detail/tmall.css">
<link href="${APP_PATH }/static/css/commodity_detail/cart-layer.css" rel="stylesheet">
<link href="${APP_PATH }/static/css/commodity_detail/cspu.css" rel="stylesheet">
<link href="${APP_PATH }/static/css/commodity_detail/relateGroup.css" rel="stylesheet">
<link href="${APP_PATH }/static/css/commodity_detail/combo.css" rel="stylesheet">
<link href="${APP_PATH }/static/css/commodity_detail/progressive.css" rel="stylesheet">
<link href="${APP_PATH }/static/css/commodity_detail/index.css" rel="stylesheet">
<link href="${APP_PATH }/static/css/commodity_detail/suggest.css" rel="stylesheet">
<link href="${APP_PATH }/static/css/commodity_detail/brandbar.css" rel="stylesheet">
<link href="${APP_PATH }/static/css/commodity_detail/mallbar.css" rel="stylesheet">
<link rel="stylesheet" href="${APP_PATH }/static/css/commodity_detail/tstart.css">
<link rel="stylesheet" href="${APP_PATH }/static/css/commodity_detail/tdog.css">
<link href="${APP_PATH }/static/css/commodity_detail/floatcartlink.css" rel="stylesheet">
<link href="${APP_PATH }/static/css/commodity_detail/tabRight.css" rel="stylesheet">
<link href="${APP_PATH }/static/css/commodity_detail/waterfall.css" rel="stylesheet">
<link href="${APP_PATH }/static/css/commodity_detail/mallphotos.css" rel="stylesheet">
<link href="${APP_PATH }/static/css/commodity_detail/try.css" rel="stylesheet">

<link href="${APP_PATH }/static/css/header/meizu_header/header.css" rel="stylesheet">

<!-- 新增css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/commodity_detail/innerstyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/commodity_detail/commodity_detail.css">
<link href="${APP_PATH }/static/css/open-iconic.min.css" rel="stylesheet">
<!-- 消息提示 -->
<link rel="stylesheet" href="${APP_PATH }/static/css/sco.message.css">

<script src="${APP_PATH }/static/js/jquery-3.2.1.min.js"></script>
<script src="${APP_PATH }/static/js/sco.message.js"></script>
</head>

<body class="enableHover">
	<%@ include file="/WEB-INF/view/public/header.jsp" %>
	<div id="page">
		<div id="content" data-cat="J_Cat" data-type="normal"
			data-spm-anchor-id="a220o.1000855.0.i0.7b036adb8j58J2">
			<div id="detail"
				data-spm-anchor-id="a220o.1000855.0.i2.7b036adb8j58J2">
				<div id="J_DetailMeta" class="tm-detail-meta tm-clear" role="form">
					<div class="tm-clear">

						<div class="tb-property">
							<div class="tb-wrap">

								<div class="tb-detail-hd">

									<h1 data-spm="1000983">${commodity.title }</h1>

									<p class="newp">${commodity.subtitle }</p>
									<div class="tb-detail-sellpoint"></div>
								</div>
								<!--引入normalBasic-->
								<div class="tm-fcs-panel">
									<dl class="tm-price-panel" id="J_StrPriceModBox">
										<dt class="tb-metatit">价格</dt>
										<dd>
											<c:if test="${commodity.minPromotionPrice==null }">
												<em class="tm-yen1"> ¥ </em>
											</c:if>
											<c:if test="${commodity.minPromotionPrice!=null }">
												<em class="tm-yen"> ¥ </em>
											</c:if>
											<c:if test="${commodity.minPromotionPrice==null }">
												<span class="tm-price1">
											</c:if>
											<c:if test="${commodity.minPromotionPrice!=null }">
												<span class="tm-price">
											</c:if>
											<c:if test="${commodity.minPrice != commodity.maxPrice}">
												${commodity.minPrice }-${commodity.maxPrice }
												</c:if>
											<c:if test="${commodity.minPrice == commodity.maxPrice}">
												${commodity.minPrice }
												</c:if>
											</span>
										</dd>
									</dl>
									<c:if test="${commodity.minPromotionPrice!=null }">
										<dl class="tm-promo-panel tm-promo-cur" id="J_PromoPrice"
											data-label="促销价">
											<dt class="tb-metatit">促销价</dt>
											<dd>
												<div class="tm-promo-price">
													<em class="tm-yen1">¥</em> <span class="tm-price1">
														<c:if
															test="${commodity.minPromotionPrice != commodity.minPromotionPrice }">
													${commodity.minPromotionPrice }-${commodtity.maxPromotionPrice }
													</c:if> <c:if
															test="${commodity.minPromotionPrice == commodity.minPromotionPrice }">
													${commodity.minPromotionPrice }
													</c:if>
													</span>
												</div>
												<p></p>
											</dd>
										</dl>
									</c:if>
									<c:if test="${commodity.seller.activity != null }">
										<dl class="tm-shopPromo-panel">
											<div class="tm-shopPromotion-title tm-gold ">
												<dt class="tb-metatit">本店活动</dt>
												<dd>${commodity.seller.activity }</dd>
											</div>
										</dl>
									</c:if>
								</div>
								<div class="tb-meta">
									<dl class="tm-delivery-panel" id="J_RSPostageCont">
										<dt class="tb-metatit">运费</dt>
										<dd>
											<div class="tb-postAge">
												<span class="tb-deliveryAdd" id="J_deliveryAdd">包邮</span>
											</div>
										</dd>
									</dl>

								</div>
								<ul class="tm-ind-panel">
									<li class="tm-ind-item tm-ind-sellCount" data-label="月销量">
										<div class="tm-indcon">
											<span class="tm-label">月销量</span><span class="tm-count">${commodity.monthSale }</span>
										</div>
									</li>
									<li class="tm-ind-item tm-ind-reviewCount canClick tm-line3"
										id="J_ItemRates">
										<div class="tm-indcon">
											<span class="tm-label">累计评价</span><span class="tm-count">${commodity.commentQuantity }</span>
										</div>
									</li>
								</ul>

								<div class="tb-key">
									<div class="tb-skin">
										<div class="tb-sku">
											<div id="J_WtSKU" class="clearfix j-mdv"></div>
											<c:forEach items="${commodityPropertyGroup }"
												var="commodityProperty">
												<dl class="tb-prop tm-sale-prop tm-clear">
													<dt class="tb-metatit">${commodityProperty.key }</dt>
													<dd>
														<c:if test="${commodityProperty.value[0].mediaType==0 }">
															<ul class="tm-clear J_TSaleProp">
																<c:forEach items="${commodityProperty.value }"
																	var="item">
																	<li class="property-value" data-rows=${item.rows }>
																		<a href="#" role="button" tabindex="0"> <span>${item.propertyValue }</span>
																	</a>
																	</li>
																</c:forEach>
															</ul>
														</c:if>
														<c:if test="${commodityProperty.value[0].mediaType==1 }">
															<ul class="tm-clear J_TSaleProp tb-img">
																<c:forEach items="${commodityProperty.value }"
																	var="item">
																	<li class="property-value" data-rows=${item.rows }>
																		<a href="#"
																		style="background:url(${com_sel }${item.propertyValue }) center no-repeat;"
																		role="button" tabindex="0"> </a>
																	</li>
																</c:forEach>
															</ul>
														</c:if>
														<c:if test="${commodityProperty.value[0].mediaType==2 }">
															<ul class="tm-clear J_TSaleProp tb-img tb-img-alias">
																<c:forEach items="${commodityProperty.value }"
																	var="item">
																	<li class="property-value" data-rows=${item.rows }>
																		<a href="#"
																		style="background: url(${com_sel }${fn:substring(item.propertyValue, 0, fn:indexOf(item.propertyValue, '+')) }) center/40px 40px no-repeat;"
																		role="button" tabindex="0"> <span>${fn:substring(item.propertyValue, fn:indexOf(item.propertyValue, '+')+1, fn:length(item.propertyValue)) }</span>
																	</a>
																	</li>
																</c:forEach>
															</ul>
														</c:if>
													</dd>
												</dl>
											</c:forEach>
											<!-- <dl class="tb-prop tm-sale-prop tm-clear">
												<dt class="tb-metatit">网络类型</dt>
												<dd>
													<ul class="tm-clear J_TSaleProp">
														<li class="tb-selected">
															<a href="#" role="button" tabindex="0"> <span>4G全网通</span>
														</a> <i>已选中</i>
														</li>
													</ul>
												</dd>
											</dl> -->
											<!-- <dl class="tb-prop tm-sale-prop tm-clear">
												<dt class="tb-metatit">机身颜色</dt>
												<dd>
													<ul class="tm-clear J_TSaleProp tb-img tb-img-alias">
														<li class="tb-selected">
															<a href="#"
																style="background: url1(// img.alicdn.com/ imgextra/ i4/ 1695308781/ TB2A1GKJL5TBuNjSspcXXbnGFXa_ !! 1695308781.jpg_40x40q90 .jpg) center no-repeat;"
																role="button" tabindex="0"> <span>静夜黑</span>
															</a> <i>已选中</i>
														</li>
														<li data-value="1627207:2404963757" title="远山白"><a
															href="#"
															style="background: url1(// img.alicdn.com/ imgextra/ i2/ 1695308781/ TB2NOfGJHGYBuNjy0FoXXciBFXa_ !! 1695308781.jpg_40x40q90 .jpg) center no-repeat;"
															role="button" tabindex="0"> <span>远山白</span>
														</a></li>
													</ul>
												</dd>
											</dl> -->

											<div class="tb-prop tm-clear J_tmSaleTime"
												style="display: none;"></div>
											<dl class="tb-amount tm-clear">
												<dt class="tb-metatit">数量</dt>
												<dd id="J_Amount">
													<span class="tb-amount-widget mui-amount-wrap"> <input
														type="text" class="tb-text mui-amount-input" value="1"
														maxlength="8" title="请输入购买量"> <span
														class="mui-amount-btn"> <span
															class="mui-amount-increase oi icon" style="font-size: 1px; text-align: center"
															data-glyph="chevron-top" style="font-size: 2px;"></span><span
															class="mui-amount-decrease oi icon" style="font-size: 1px; text-align: center"
															data-glyph="chevron-bottom" style="font-size: 2px;"></span>
													</span> <span class="mui-amount-unit">件</span>
													</span> <em id="J_EmStock" class="tb-hidden"
														style="display: inline;">库存${commodity.stock }件</em> <span
														id="J_StockTips"> </span>
												</dd>
											</dl>

											<dl id="J_regionSellServer"
												class="tm-clear tm-services tb-hidden tb-prop"
												data-spm="1000987" style="display: none;"></dl>
											<div class="tb-action tm-clear">
												<div class="tb-btn-buy tb-btn-sku">
													<a id="J_LinkBuy" class="noPost" href="#" rel="nofollow"
														data-addfastbuy="true" title="点击此按钮，到下一步确认购买信息。"
														role="button">立即购买<span class="ensureText">确认</span></a>
												</div>
												<div class="tb-btn-basket tb-btn-sku">
													<a href="#" rel="nofollow" id="J_LinkBasket" class="noPost"
														role="button">加入购物车<span class="ensureText">确认</span></a>
												</div>
												
											</div>
										</div>
									</div>
								</div>

								<div class="tm-ser tm-clear">
									<dl class="tm-clear">
										<dt class="tb-metatit">服务承诺</dt>
										<dd class="tm-laysku-dd">
											<ul class="tb-serPromise">
												<li><a title="全国联保">全国联保</a></li>
												<li><a
													title="信誉评级为“极好”或“优秀”的会员，签收7天内交易状态为“交易成功”或“交易关闭”之前因质量问题申请退换货免举证，0秒响应">免举证退换货</a></li>
												<li><a title="商品支持正品保障服务">正品保证</a></li>
												<li><a
													title="极速退款是为诚信会员提供的退款退货流程的专享特权，额度是根据每个用户当前的信誉评级情况而定">极速退款</a></li>
												<li><a title="卖家为您购买的商品投保退货运费险（保单生效以下单显示为准）"
													target="_blank">赠运费险</a></li>
												<li><a title="七天无理由退换">七天无理由退换</a></li>
											</ul>
										</dd>
									</dl>
								</div>

							</div>
						</div>
						<div data-spm="1997427645" class="tb-gallery">

							<div class="tb-booth">
								<a href="javascript:void(0);"> <!-- <span class="zoomIcon"
									style="">󰄬</span> --> <span class="ks-imagezoom-wrap"><img
										id="J_ImgBooth" src="${commodity.coverImage }"
										data-haszoom="700"><span
										style="position: absolute; top: 1.00637px; left: 302.018px; width: 116.483px; height: 116.483px; display: none;"
										class="ks-imagezoom-lens"></span></span>
								</a>
								<!-- <i class="tm-video-play J_playVideo" style="">󰀓</i> -->
								<i class="tm-video-stop J_stopVideo" style="display: none;"><b></b><s
									data-spm-anchor-id="a220o.1000855.1997427645.i0.7b036adb8j58J2"></s></i>
							</div>
							<div class="tb-thumb-warp">
								<a class="tb-thumb-left disabled"><i></i></a>
								<div class="tb-thumb-content">
									<ul id="J_UlThumb" class="tb-thumb tm-clear" style="left: 0px;">
										<c:forEach items="${commodity.commodityMediaResources }"
											var="commodityMediaResource">
											<c:if test="${commodityMediaResource.mediaType==0 }">
												<li><a><img
														src="${com_media_loc }${commodityMediaResource.location }"
														alt="商品预览图"> </a></li>
											</c:if>
										</c:forEach>
									</ul>
								</div>
								<a class="tb-thumb-right"><i></i></a>
							</div>
							<p class="tm-action tm-clear">
								<style>
									.my_hidden {
										display: none;
									}
								</style>
								<c:if test="${isCollect }">
									<c:set value="my_hidden" var="remove_hidden"></c:set>
								</c:if>
								<c:if test="${!isCollect }">
									<c:set value="my_hidden" var="add_hidden"></c:set>
								</c:if>
								<a id="J_RemoveFavorite" href="javascript:;" class="favorite ${add_hidden }" title="取消收藏" data-commodityid="${commodityId }">
									<i class="oi icon" data-glyph="star" style="color: red"></i>
									<span>已收藏</span>
								</a>
								<a id="J_AddFavorite" href="javascript:;" class="favorite ${remove_hidden }" title="收藏" data-commodityid="${commodityId }">
									<i class="oi icon" data-glyph="star"></i>
									<span>收藏商品</span>
								</a>
								
								
							</p>
							<ul class="tb-meta-icons">
								<li title="天猫网厅"
									href="//wt.tmall.com/?spm=813.7729269.1998733182.d4920745"
									style="width: 40px; height: 42px; background: url1(&amp; amp; amp; amp; amp; amp; amp; amp; amp; quot; // img .alicdn.com/tps/i4/TB1dicEIXXXXXXyXFXX03.AGpXX-40-42.png&amp;amp; amp; amp; amp; amp; amp; amp; amp; quot; ) no-repeat; margin-left: 5px; position: relative; top: 20px; display: block; zoom: 1; float: left;">
									<a href="//wt.tmall.com/?spm=813.7729269.1998733182.d4920745"
									title="天猫网厅" target="_blank"
									style="width: 40px; height: 42px; display: block; position: absolute; top: 0px; left: 0px;"></a>
								</li>
							</ul>
						</div>

						<form id="J_FrmBid" name="bidForm" action="" method="post">
							<input type="hidden" name="title"
								value="【官方旗舰2298元起】Meizu/魅族 16th骁龙845 超窄边框全面屏 屏下指纹解锁 双摄拍照旗舰手机">
							<input type="hidden" name="x_id" value=""> <input
								type="hidden" name="seller_id"
								value="d5f9d85f714d80f326b071bdc89360a9"> <input
								type="hidden" name="seller_nickname" value="魅族官方旗舰店"> <input
								type="hidden" name="who_pay_ship" value="卖家承担运费"> <input
								type="hidden" name="photo_url1"
								value="i2/1695308781/O1CN01Ovvz4u2EjkMl8IAr7_!!0-item_pic.jpg">
							<input type="hidden" name="region" value="广东珠海"> <input
								type="hidden" name="auto_post" value="false"> <input
								type="hidden" name="etm" value="post"> <input
								type="hidden" name="virtual" value="false"> <input
								type="hidden" name="rootCatId" value="1512"> <input
								type="hidden" name="auto_post1" value=""> <input
								type="hidden" id="buyer_from" name="buyer_from" value="">

							<input id="J_TokenField" type="hidden" value="555788bda6e73">
						</form>

					</div>
					<!-- ruleBanner-->
				</div>
			</div>

			<div id="J_SaleCombo" class="tb-scombo" data-spm="1998099587"></div>
			<div id="J_ShopPromtion">
				<!-- -->
			</div>
			<div id="bd" class="">
				<div class="grid-s5m0 tm-clear">
					<div class="col-main tm-clear">
						<div id="mainwrap" class="main-wrap" role="main">
							<div id="J_TabBarBox" style="width: 788px;">
								<ul id="J_TabBar" class="tabbar tm-clear">
									<li id="my_detail" tabindex="0" role="tab" class="tm-selected"
										aria-selected="true"><a tabindex="-1" href="#description"
										rel="nofollow" hidefocus="true" data-index="0"
										data-spm-anchor-id="a220o.1000855.0.0"> 商品详情 </a></li>
									<!-- <li id="my_attrs" tabindex="0" role="tab" aria-selected="false" class="">
										<a tabindex="-1" href="#J_Attrs" rel="nofollow"
										hidefocus="true" data-index="1"
										data-spm-anchor-id="a220o.1000855.0.0">规格参数</a>
									</li> -->
									<li id="my_review" tabindex="0" role="tab"
										aria-selected="false"
										data-spm-anchor-id="a220o.1000855.0.i3.7b036adb8j58J2"
										class=""><a tabindex="-1" href="#J_Reviews"
										rel="nofollow" hidefocus="true" data-index="2">累计评价 <em
											class="J_ReviewsCount" style="display: inline;">${commodity.commentQuantity }</em></a></li>
								</ul>
							</div>
							<div class="tabbar-bg" style="display: none;"></div>
							<div
								style="height: 0px; margin-top: 0px; margin-bottom: 0px; overflow: hidden; width: 790px;"></div>

							<c:if
								test="${commodity.commodityExtendProperties!=null&&fn:length(commodity.commodityExtendProperties)>0 }">
								<div id="attributes" class="attributes">
									<div class="attributes-list" id="J_AttrList">
										<p class="attr-list-hd tm-clear">
											<em>产品参数：</em>
										</p>
										<ul id="J_AttrUL">
											<c:forEach items="${commodity.commodityExtendProperties }"
												var="commodityExtendProperty">
												<li title="2018011606090990">${commodityExtendProperty.propertyName }：${commodityExtendProperty.propertyValue }</li>
											</c:forEach>
											<!-- 健字号相关-->
										</ul>

									</div>
								</div>
							</c:if>
							<div id="mall-banner">
								<div data-spm="1998132255">

									<!--  ESIBanner开始 -->
									<!-- position : MIDDLE , params: {st=1547049600000, link=/malldetail/zhongting, id=10002, et=1547740799000} -->

									<!--  ESIBanner结束 -->
								</div>
								<!-- ruleBanner-->
								<div id="J_DescTMS1">
									<!--rullBanner ids:$ids true-->

								</div>

							</div>
							<div id="J_TmpActBanner"></div>
							<div id="J_Detail">
								<!-- <div id="J_Attrs" class="J_DetailSection">
									<h4 class="hd">规格参数</h4>
									<table class="tm-tableAttr">
										<thead>
											<tr>
												<td colspan="2">规格参数</td>
											</tr>
										</thead>
										<tbody>
											<tr class="tm-tableAttrSub">
												<th colspan="2">拍照功能</th>
											</tr>
											<tr>
												<th>后置摄像头</th>
												<td>&nbsp;1200万+2000万双摄</td>
											</tr>
										</tbody>
									</table>

									<table class="tm-tableAttr">
										<thead>
											<tr>
												<td colspan="2">包装清单</td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th>主机</th>
												<td>1 件</td>
											</tr>
										</tbody>
									</table>
								</div> -->

								<div id="J_Reviews" class="J_DetailSection">

									<div class="tm-rate">
										<!-- <div class="rate-toolbar">
											<span class="rate-filter"><input
												class="rate-list-all rate-radio-group"
												id="J_RateWithFilterall1556517878823" type="radio"
												name="radiogrounp" checked=""><label
												for="J_RateWithFilterall1556517878823">全部</label><input
												class="rate-list-append rate-radio-group"
												id="J_RateWithAppend1556517878823" type="radio"
												name="radiogrounp"><label
												for="J_RateWithAppend1556517878823">追评 (1047)</label><input
												class="rate-list-picture rate-radio-group"
												id="J_RateWithPicture1556517878823" type="radio"
												name="radiogrounp"><label
												for="J_RateWithPicture1556517878823">图片 (2804)</label></span><span
												class="rate-chat-btn" style="display: none;"><input
												class="rate-list-chat rate-radio-group"
												id="J_ReviewChat1556517878823" type="radio"
												name="radiogrounp"><label
												for="J_ReviewChat1556517878823">一起逛</label></span><span
												class="tm-toolbar-lft"><span class="tm-rate-addin"></span><input
												class="rate-list-hascontent"
												id="J_RateWithContent1556517878823" type="checkbox"
												name="content" checked=""><label
												for="J_RateWithContent1556517878823">有内容</label>
												<div class="rate-sort ">
													<div class="tm-selectbtn tm-rate-sort">
														<span z-index="0" class="tm-current">按默认</span>
														<ul>
															<li event-val="sort_3"
																event-data="{userPropertyId:10,userPropertyIndex:0}"
																class="tm-r-default"><a"> 按默认 </a"></li>
															<li event-val="sort_1"
																event-data="{userPropertyId:&quot;10&quot;,userPropertyIndex:&quot;1&quot;}"
																class="tm-r-time"><a"> 按时间 </a"></li>
														</ul>
													</div>
												</div> </span>
										</div> -->
										<div class="rate-grid">
											<table>
												<tbody>
													<c:forEach items="${commodity.comments }" var="comment">
														<tr>
															<td class="tm-col-master"><c:forEach
																	items="${comment.commentAppends }" var="commentAppend"
																	varStatus="status">
																	<div class="tm-rate-premiere">
																		<div class="tm-rate-tag">
																			<c:if test="${status.index==0 }">
																				<div class="tm-rate-title">初次评论:</div>
																			</c:if>
																			<c:if test="${status.index!=0 }">
																				<div class="tm-rate-title">追加评论:</div>
																			</c:if>
																			<div class="tm-rate-date">
																				<fmt:formatDate
																					value="${commentAppend.commentTime }" type="date" />
																			</div>
																		</div>
																		<div class="tm-rate-content">
																			<div class="tm-rate-fulltxt">${commentAppend.comment }</div>
																			<c:if test="${commentAppend.commentImages!=null }">
																				<div class="tm-m-photos">
																					<ul class="tm-m-photos-thumb">
																						<c:forEach items="${commentAppend.commentImages }"
																							var="commentImage">
																							<li><img
																								src="${comment_images_location }${commentImage.commentImage }">
																							</li>
																						</c:forEach>
																					</ul>
																				</div>
																			</c:if>
																		</div>
																		<div class="tm-rate-reply">
																			<div class="tm-rate-fulltxt">${commentAppend.reply }</div>
																		</div>
																	</div>
																</c:forEach></td>
															<td class="col-meta">
																<div class="rate-sku">
																	<c:forEach
																		items="${comment.orderCommoditySelectPropertys }"
																		var="orderCommoditySelectProperty">
																		<p>
																			<span>${orderCommoditySelectProperty.propertyName }：</span>${orderCommoditySelectProperty.propertyValue }
																		</p>
																	</c:forEach>
																</div>
															</td>
															<td class="col-author">
																<div class="rate-user-info">
																	<span>${comment.userName }</span>
																</div>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<!-- <div class="rate-page">
											<div class="rate-paginator">
												<span class="rate-page-prev">&lt;&lt;上一页</span><span>1</span>
												<a href="?page=2">2</a> <a href="?page=3">3</a><span
													class="rate-page-break">...</span> <a data-page="2"
													href="?page=2">下一页&gt;&gt;</a>
											</div>
										</div> -->
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-sub">
						<div id="J_DcShopArchive" class="J_DcAsyn" role="complementary">
							<div id="side-shop-info" data-spm="1997427133">
								<div class="shop-intro" style="">
									<h3 class="hd" style="">
										<div class="name">
											<a data-spm="d4918065" class="shopLink" target="_blank">CLUVIO</a>
											<span class="ww-light ww-small" data-icon="small"
												data-nick="%E9%AD%85%E6%97%8F%E5%AE%98%E6%96%B9%E6%97%97%E8%88%B0%E5%BA%97"
												data-tnick="%E9%AD%85%E6%97%8F%E5%AE%98%E6%96%B9%E6%97%97%E8%88%B0%E5%BA%97"
												data-encode="true" data-display="inline"
												data-from="cntaobao" data-item="574189749365"
												data-items="574189749365"><a
												href="https://amos.alicdn.com/getcid.aw?v=3&amp;groupid=0&amp;s=1&amp;charset=utf-8&amp;uid=%E9%AD%85%E6%97%8F%E5%AE%98%E6%96%B9%E6%97%97%E8%88%B0%E5%BA%97&amp;site=cntaobao&amp;fromid=cntaobao飞离世界到世界"
												target="_blank" class="ww-inline ww-online"
												title="点此可以直接和卖家交流选好的宝贝，或相互交流网购体验，还支持语音视频噢。"><span>旺旺在线</span></a></span>
										</div>
										<i></i>
									</h3>
									<div
										style="height: 0px; margin-top: 0px; margin-bottom: 0px; overflow: hidden; width: 123px;"></div>

									<div class="btnArea" style="width: 70px">
										<a class="enterShop" id="my_contact_seller"
											style="cursor: pointer;" data-toggle="modal"
											data-target="#chat_modal">联系商家</a>
									</div>
								</div>
								<div style="height: 0px; overflow: hidden;"></div>
							</div>
						</div>
					</div>

				</div>
			</div>
			<div id="J_DcFt" class="J_DcAsyn tb-shop">
				<!--ftkey:new_p_lazy_sid104682877_pid1322100871,cacheAt:2019-04-19 23:57:01,ip:sitemisc011020246244.center.na61-->
				<div class="tb-shop" id="ft">
					<div class="layout grid-m J_TLayout" data-widgetid="14678610109"
						data-componentid="33" data-prototypeid="33" data-id="14678610109"
						data-max="">

						<div class="col-main">
							<div class="main-wrap J_TRegion" data-modules="main"
								data-width="f990" data-max="">
								<div class="J_TModule" data-widgetid="15189512952"
									id="shop15189512952" data-componentid="14221003"
									data-spm="110.0.14221003-15189512952"
									microscope-data="14221003-15189512952" data-title="页尾模块">
									<div class="tb-module tshop-um tshop-um-yewei">
										<div class="yeweibox" style="width: 990px; height: 10px;">
											<div class="wbox" style="height: 10px;"></div>
										</div>
										<div>
											<div
												class="J_TWidget jpb abs -_-popup-hidden tb-shop-popup-show"
												data-widget-type="Popup"
												data-widget-config="{'trigger':'.asHMt-xhlR','align':{'node':'.asHMt-xhlR','offset':[-650,30.0069580078125],'points':['tl','tl']}}"
												style="z-index: 99999800; display: block; position: absolute; left: -9999px; top: -9999px;">
												<div class="ks-popup-content">
													<div class="rel"
														style="position: relative; overflow: hidden; width: 1920px; height: 210px; background: url1(// gdp.alicdn.com/ imgextra/ i4/ 1695308781/ O1CN01h4BTsZ2EjkMm9TkqS_ !! 1695308781.png) 50% 0% repeat scroll #FFFFFF; line-height: normal;"
														data-rn="abK1K">
														<a class="jsib abs aS6D9-uyZZ" target="_blank"
															style="outline-color: #FFFFFF; display: block; width: 170px; height: 210px; top: 0px; left: 538px; border: none; z-index: 10; cursor: default;"
															data-linkmode="ptlink" data-appid="aS6D9-uyZZ"> </a> <a
															class="jsib abs aiA80-KGIZ" target="_blank"
															style="outline-color: #FFFFFF; display: block; width: 170px; height: 210px; top: 0px; left: 708px; border: none; z-index: 10; cursor: default;"
															data-linkmode="ptlink" data-appid="aiA80-KGIZ"> </a> <a
															class="jsib abs aCfh8-a3mm" target="_blank"
															style="outline-color: #FFFFFF; display: block; width: 170px; height: 210px; top: 0px; left: 878px; border: none; z-index: 10; cursor: default;"
															data-linkmode="ptlink" data-appid="aCfh8-a3mm"> </a> <a
															class="jsib abs aIED3-tqvg" target="_blank"
															style="outline-color: #FFFFFF; display: block; width: 170px; height: 210px; top: 0px; left: 1047px; border: none; z-index: 10; cursor: default;"
															data-linkmode="ptlink" data-appid="aIED3-tqvg"> </a> <a
															class="jsib abs aMu1V-MXxM" target="_blank"
															style="outline-color: #FFFFFF; display: block; width: 170px; height: 210px; top: 0px; left: 1217px; border: none; z-index: 10; cursor: default;"
															data-linkmode="ptlink" data-appid="aMu1V-MXxM"> </a> <a
															class="jsib abs aTEzf-mV6t" target="_blank"
															style="outline-color: #FFFFFF; display: block; width: 170px; height: 210px; top: 0px; left: 1387px; border: none; z-index: 10; cursor: default;"
															data-linkmode="ptlink" data-appid="aTEzf-mV6t"> </a> <a
															class="jsib abs azlDY-XIVq" target="_blank"
															style="outline-color: #FFFFFF; display: block; width: 170px; height: 210px; top: 0px; left: 368px; border: none; z-index: 10; cursor: default;"
															data-linkmode="ptlink" data-appid="azlDY-XIVq"> </a>
													</div>
													<div class="J_TWidget japb abs -_-popup-hidden"
														data-widget-type="Popup"
														data-widget-config="{'trigger':'.azlDY-XIVq','align':{'node':'.azlDY-XIVq','offset':[0,0],'points':['tl','tl']}}"
														style="z-index: 99; display: none;">
														<div class="rel"
															style="position: relative; overflow: hidden; width: 170px; height: 210px; line-height: normal;"
															data-rn="asuY5">
															<a class="jsib abs aVDev-ww7t"
																href="//detail.tmall.com/item.htm?id=577273002761&amp;scene=taobao_shop"
																target="_blank"
																style="outline-color: #FFFFFF; display: block; width: 198px; height: 210px; top: 0px; left: 0px; border: none; z-index: 10;"
																data-linkmode="ptlink" data-appid="aVDev-ww7t"> <img
																class="abs sf"
																src="//gdp.alicdn.com/imgextra/i1/1695308781/TB2B.gEXQWM.eBjSZFhXXbdWpXa_!!1695308781.png"
																style="left: 0; top: 0;" width="100%" height="100%">
															</a>
														</div>
													</div>
													<div class="J_TWidget japb abs -_-popup-hidden"
														data-widget-type="Popup"
														data-widget-config="{'trigger':'.aS6D9-uyZZ','align':{'node':'.aS6D9-uyZZ','offset':[0,0],'points':['tl','tl']}}"
														style="z-index: 99; display: none;">
														<div class="rel"
															style="position: relative; overflow: hidden; width: 170px; height: 210px; line-height: normal;"
															data-rn="aiLnt">
															<a class="jsib abs a6MdF-Tz4q"
																href="//detail.tmall.com/item.htm?id=577818262818&amp;scene=taobao_shop"
																target="_blank"
																style="outline-color: #FFFFFF; display: block; width: 198px; height: 210px; top: 0px; left: 0px; border: none; z-index: 10;"
																data-linkmode="ptlink" data-appid="a6MdF-Tz4q"> <img
																class="abs sf"
																src="//gdp.alicdn.com/imgextra/i1/1695308781/TB2B.gEXQWM.eBjSZFhXXbdWpXa_!!1695308781.png"
																style="left: 0; top: 0;" width="100%" height="100%">
															</a>
														</div>
													</div>
													<div class="J_TWidget japb abs -_-popup-hidden"
														data-widget-type="Popup"
														data-widget-config="{'trigger':'.aiA80-KGIZ','align':{'node':'.aiA80-KGIZ','offset':[0,0],'points':['tl','tl']}}"
														style="z-index: 99; display: none;">
														<div class="rel"
															style="position: relative; overflow: hidden; width: 170px; height: 210px; line-height: normal;"
															data-rn="ackYn">
															<a class="jsib abs ahR8h-d2nB"
																href="//detail.tmall.com/item.htm?id=578431423375&amp;scene=taobao_shop"
																target="_blank"
																style="outline-color: #FFFFFF; display: block; width: 198px; height: 210px; top: 0px; left: 0px; border: none; z-index: 10;"
																data-linkmode="ptlink" data-appid="ahR8h-d2nB"> <img
																class="abs sf"
																src="//gdp.alicdn.com/imgextra/i1/1695308781/TB2B.gEXQWM.eBjSZFhXXbdWpXa_!!1695308781.png"
																style="left: 0; top: 0;" width="100%" height="100%">
															</a>
														</div>
													</div>
													<div class="J_TWidget japb abs -_-popup-hidden"
														data-widget-type="Popup"
														data-widget-config="{'trigger':'.aCfh8-a3mm','align':{'node':'.aCfh8-a3mm','offset':[0,0],'points':['tl','tl']}}"
														style="z-index: 99; display: none;">
														<div class="rel"
															style="position: relative; overflow: hidden; width: 170px; height: 210px; line-height: normal;"
															data-rn="aMA9h">
															<a class="jsib abs aPozX-fDPs"
																href="//detail.tmall.com/item.htm?id=587523975245&amp;scene=taobao_shop"
																target="_blank"
																style="outline-color: #FFFFFF; display: block; width: 198px; height: 210px; top: 0px; left: 0px; border: none; z-index: 10;"
																data-linkmode="ptlink" data-appid="aPozX-fDPs"> <img
																class="abs sf"
																src="//gdp.alicdn.com/imgextra/i1/1695308781/TB2B.gEXQWM.eBjSZFhXXbdWpXa_!!1695308781.png"
																style="left: 0; top: 0;" width="100%" height="100%">
															</a>
														</div>
													</div>
													<div class="J_TWidget japb abs -_-popup-hidden"
														data-widget-type="Popup"
														data-widget-config="{'trigger':'.aIED3-tqvg','align':{'node':'.aIED3-tqvg','offset':[0,0],'points':['tl','tl']}}"
														style="z-index: 99; display: none;">
														<div class="rel"
															style="position: relative; overflow: hidden; width: 170px; height: 210px; line-height: normal;"
															data-rn="a0CUP">
															<a class="jsib abs amI7n-TzQU"
																href="//detail.tmall.com/item.htm?id=577150493893&amp;scene=taobao_shop"
																target="_blank"
																style="outline-color: #FFFFFF; display: block; width: 198px; height: 210px; top: 0px; left: 0px; border: none; z-index: 10;"
																data-linkmode="ptlink" data-appid="amI7n-TzQU"> <img
																class="abs sf"
																src="//gdp.alicdn.com/imgextra/i1/1695308781/TB2B.gEXQWM.eBjSZFhXXbdWpXa_!!1695308781.png"
																style="left: 0; top: 0;" width="100%" height="100%">
															</a>
														</div>
													</div>
													<div class="J_TWidget japb abs -_-popup-hidden"
														data-widget-type="Popup"
														data-widget-config="{'trigger':'.aMu1V-MXxM','align':{'node':'.aMu1V-MXxM','offset':[0,0],'points':['tl','tl']}}"
														style="z-index: 99; display: none;">
														<div class="rel"
															style="position: relative; overflow: hidden; width: 170px; height: 210px; line-height: normal;"
															data-rn="aAeDQ">
															<a class="jsib abs axWHL-gGbY"
																href="//detail.tmall.com/item.htm?id=574189749365&amp;scene=taobao_shop"
																target="_blank"
																style="outline-color: #FFFFFF; display: block; width: 198px; height: 210px; top: 0px; left: 0px; border: none; z-index: 10;"
																data-linkmode="ptlink" data-appid="axWHL-gGbY"> <img
																class="abs sf"
																src="//gdp.alicdn.com/imgextra/i1/1695308781/TB2B.gEXQWM.eBjSZFhXXbdWpXa_!!1695308781.png"
																style="left: 0; top: 0;" width="100%" height="100%">
															</a>
														</div>
													</div>
													<div class="J_TWidget japb abs -_-popup-hidden"
														data-widget-type="Popup"
														data-widget-config="{'trigger':'.aTEzf-mV6t','align':{'node':'.aTEzf-mV6t','offset':[0,0],'points':['tl','tl']}}"
														style="z-index: 99; display: none;">
														<div class="rel"
															style="position: relative; overflow: hidden; width: 170px; height: 210px; line-height: normal;"
															data-rn="a6n84">
															<a class="jsib abs aW1VI-vxpI"
																href="//detail.tmall.com/item.htm?id=574192065363&amp;scene=taobao_shop"
																target="_blank"
																style="outline-color: #FFFFFF; display: block; width: 198px; height: 210px; top: 0px; left: 0px; border: none; z-index: 10;"
																data-linkmode="ptlink" data-appid="aW1VI-vxpI"> <img
																class="abs sf"
																src="//gdp.alicdn.com/imgextra/i1/1695308781/TB2B.gEXQWM.eBjSZFhXXbdWpXa_!!1695308781.png"
																style="left: 0; top: 0;" width="100%" height="100%">
															</a>
														</div>
													</div>
												</div>
											</div>
											<div
												class="J_TWidget jpb abs -_-popup-hidden tb-shop-popup-show"
												data-widget-type="Popup"
												data-widget-config="{'triggerType':'click','trigger':'.asHMt-n2py','align':{'node':'.asHMt-n2py','offset':[-792,30.0069580078125],'points':['tl','tl']}}"
												style="z-index: 99999800; display: block; position: absolute; left: -9999px; top: -9999px;">
												<div class="ks-popup-content">
													<div class="rel"
														style="position: relative; overflow: hidden; width: 1920px; height: 210px; background: url1(// gdp.alicdn.com/ imgextra/ i4/ 1695308781/ O1CN012EjkJcMap9fXJOh_ !! 1695308781.png) 50% 0% repeat scroll #FFFFFF; line-height: normal;"
														data-rn="avuvI">
														<a class="jsib abs a3fMm-astL" target="_self"
															style="outline-color: #FFFFFF; display: block; width: 170px; height: 210px; top: 0px; left: 362px; border: none; z-index: 10; cursor: default;"
															data-linkmode="ptlink" data-appid="a3fMm-astL"></a> <a
															class="jsib abs aU1Jg-EeYo" target="_blank"
															style="outline-color: #FFFFFF; display: block; width: 170px; height: 210px; top: 0px; left: 532px; border: none; z-index: 10; cursor: default;"
															data-linkmode="ptlink" data-appid="aU1Jg-EeYo"></a> <a
															class="jsib abs aa6La-7xuS" target="_blank"
															style="outline-color: #FFFFFF; display: block; width: 170px; height: 210px; top: 0px; left: 702px; border: none; z-index: 10; cursor: default;"
															data-linkmode="ptlink" data-appid="aa6La-7xuS"></a> <a
															class="jsib abs ao0X1-YL8o" target="_blank"
															style="outline-color: #FFFFFF; display: block; width: 170px; height: 210px; top: 0px; left: 872px; border: none; z-index: 10; cursor: default;"
															data-linkmode="ptlink" data-appid="ao0X1-YL8o"></a> <a
															class="jsib abs apGQl-KKFu" target="_blank"
															style="outline-color: #FFFFFF; display: block; width: 170px; height: 210px; top: 0px; left: 1042px; border: none; z-index: 10; cursor: default;"
															data-linkmode="ptlink" data-appid="apGQl-KKFu"></a> <a
															class="jsib abs aN6w3-CbPw" target="_self"
															style="outline-color: #FFFFFF; display: block; width: 170px; height: 210px; top: 0px; left: 1212px; border: none; z-index: 10; cursor: default;"
															data-linkmode="ptlink" data-appid="aN6w3-CbPw"></a> <a
															class="jsib abs auNSw-GOm2" target="_self"
															style="outline-color: #FFFFFF; display: block; width: 170px; height: 210px; top: 0px; left: 1382px; border: none; z-index: 10; cursor: default;"
															data-linkmode="ptlink" data-appid="auNSw-GOm2"></a>
													</div>
													<div class="J_TWidget japb abs" data-widget-type="Popup"
														data-widget-config="{'trigger':'.aN6w3-CbPw','align':{'node':'.aN6w3-CbPw','offset':[0,0],'points':['tl','tl']}}"
														style="z-index: 99; display: none;">
														<div class="rel"
															style="position: relative; overflow: hidden; width: 170px; height: 210px; line-height: normal;"
															data-rn="aue3G">
															<a class="jsib abs actos-YIP2"
																href="//detail.tmall.com/item.htm?id=557697816177&amp;scene=taobao_shop"
																target="_blank"
																style="outline-color: #FFFFFF; display: block; width: 198px; height: 210px; top: 0px; left: 0px; border: none; z-index: 10;"
																data-linkmode="ptlink" data-appid="actos-YIP2"><img
																class="abs sf"
																src="//gdp.alicdn.com/imgextra/i1/1695308781/TB2B.gEXQWM.eBjSZFhXXbdWpXa_!!1695308781.png"
																width="100%" height="100%"></a>
														</div>
													</div>
													<div class="J_TWidget japb abs" data-widget-type="Popup"
														data-widget-config="{'trigger':'.apGQl-KKFu','align':{'node':'.apGQl-KKFu','offset':[0,0],'points':['tl','tl']}}"
														style="z-index: 99; display: none;">
														<div class="rel"
															style="position: relative; overflow: hidden; width: 170px; height: 210px; line-height: normal;"
															data-rn="aue3G">
															<a class="jsib abs actos-YIP2"
																href="//detail.tmall.com/item.htm?id=577053340587&amp;scene=taobao_shop"
																target="_blank"
																style="outline-color: #FFFFFF; display: block; width: 198px; height: 210px; top: 0px; left: 0px; border: none; z-index: 10;"
																data-linkmode="ptlink" data-appid="actos-YIP2"><img
																class="abs sf"
																src="//gdp.alicdn.com/imgextra/i1/1695308781/TB2B.gEXQWM.eBjSZFhXXbdWpXa_!!1695308781.png"
																width="100%" height="100%"></a>
														</div>
													</div>
													<div class="J_TWidget japb abs" data-widget-type="Popup"
														data-widget-config="{'trigger':'.ao0X1-YL8o','align':{'node':'.ao0X1-YL8o','offset':[0,0],'points':['tl','tl']}}"
														style="z-index: 99; display: none;">
														<div class="rel"
															style="position: relative; overflow: hidden; width: 170px; height: 210px; line-height: normal;"
															data-rn="aue3G">
															<a class="jsib abs actos-YIP2"
																href="//detail.tmall.com/item.htm?id=544700623016&amp;scene=taobao_shop"
																target="_blank"
																style="outline-color: #FFFFFF; display: block; width: 198px; height: 210px; top: 0px; left: 0px; border: none; z-index: 10;"
																data-linkmode="ptlink" data-appid="actos-YIP2"><img
																class="abs sf"
																src="//gdp.alicdn.com/imgextra/i1/1695308781/TB2B.gEXQWM.eBjSZFhXXbdWpXa_!!1695308781.png"
																width="100%" height="100%"></a>
														</div>
													</div>
													<div class="J_TWidget japb abs" data-widget-type="Popup"
														data-widget-config="{'trigger':'.aa6La-7xuS','align':{'node':'.aa6La-7xuS','offset':[0,0],'points':['tl','tl']}}"
														style="z-index: 99; display: none;">
														<div class="rel"
															style="position: relative; overflow: hidden; width: 170px; height: 210px; line-height: normal;"
															data-rn="aue3G">
															<a class="jsib abs actos-YIP2"
																href="//detail.tmall.com/item.htm?id=577557877175&amp;scene=taobao_shop"
																target="_blank"
																style="outline-color: #FFFFFF; display: block; width: 198px; height: 210px; top: 0px; left: 0px; border: none; z-index: 10;"
																data-linkmode="ptlink" data-appid="actos-YIP2"><img
																class="abs sf"
																src="//gdp.alicdn.com/imgextra/i1/1695308781/TB2B.gEXQWM.eBjSZFhXXbdWpXa_!!1695308781.png"
																width="100%" height="100%"></a>
														</div>
													</div>
													<div class="J_TWidget japb abs" data-widget-type="Popup"
														data-widget-config="{'trigger':'.aU1Jg-EeYo','align':{'node':'.aU1Jg-EeYo','offset':[0,0],'points':['tl','tl']}}"
														style="z-index: 99; display: none;">
														<div class="rel"
															style="position: relative; overflow: hidden; width: 170px; height: 210px; line-height: normal;"
															data-rn="aue3G">
															<a class="jsib abs actos-YIP2"
																href="//detail.tmall.com/item.htm?id=577388624764&amp;scene=taobao_shop"
																target="_blank"
																style="outline-color: #FFFFFF; display: block; width: 198px; height: 210px; top: 0px; left: 0px; border: none; z-index: 10;"
																data-linkmode="ptlink" data-appid="actos-YIP2"><img
																class="abs sf"
																src="//gdp.alicdn.com/imgextra/i1/1695308781/TB2B.gEXQWM.eBjSZFhXXbdWpXa_!!1695308781.png"
																width="100%" height="100%"></a>
														</div>
													</div>
													<div class="J_TWidget japb abs" data-widget-type="Popup"
														data-widget-config="{'trigger':'.a3fMm-astL','align':{'node':'.a3fMm-astL','offset':[0,0],'points':['tl','tl']}}"
														style="z-index: 99; display: none;">
														<div class="rel"
															style="position: relative; overflow: hidden; width: 170px; height: 210px; line-height: normal;"
															data-rn="aue3G">
															<a class="jsib abs actos-YIP2"
																href="//detail.tmall.com/item.htm?id=564771106545&amp;scene=taobao_shop"
																target="_blank"
																style="outline-color: #FFFFFF; display: block; width: 198px; height: 210px; top: 0px; left: 0px; border: none; z-index: 10;"
																data-linkmode="ptlink" data-appid="actos-YIP2"><img
																class="abs sf"
																src="//gdp.alicdn.com/imgextra/i1/1695308781/TB2B.gEXQWM.eBjSZFhXXbdWpXa_!!1695308781.png"
																width="100%" height="100%"></a>
														</div>
													</div>
													<div class="J_TWidget japb abs" data-widget-type="Popup"
														data-widget-config="{'trigger':'.auNSw-GOm2','align':{'node':'.auNSw-GOm2','offset':[0,0],'points':['tl','tl']}}"
														style="z-index: 99; display: none;">
														<div class="rel"
															style="position: relative; overflow: hidden; width: 170px; height: 210px; line-height: normal;"
															data-rn="aue3G">
															<a class="jsib abs actos-YIP2"
																href="//detail.tmall.com/item.htm?id=556006878156&amp;scene=taobao_shop"
																target="_blank"
																style="outline-color: #FFFFFF; display: block; width: 198px; height: 210px; top: 0px; left: 0px; border: none; z-index: 10;"
																data-linkmode="ptlink" data-appid="actos-YIP2"><img
																class="abs sf"
																src="//gdp.alicdn.com/imgextra/i1/1695308781/TB2B.gEXQWM.eBjSZFhXXbdWpXa_!!1695308781.png"
																width="100%" height="100%"></a>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="J_TWidget hidden xialastyle2 tb-shop-popup-show"
											data-widget-type="Popup"
											data-widget-config="{

	'trigger':'.navlist999',

	'align':{

		'node':'.navlist2',

		'offset':[0,0],'points':['bl','tl']	}

	}"
											style="display: block; position: absolute; left: -9999px; top: -9999px; z-index: 99999800;">
											<div class="ks-popup-content">
												<div class="outbox" style="width: 990px;">
													<div
														style="width: 970px; margin: 10px; float: left; padding-bottom: 10px;">
														<ul class="hoverlist" style="">
															<li class="zhufenlei"><a href="#" target="_blank">全部宝贝</a>
															</li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%B0%B4%CF%FA%C1%BF%C5%C5%D0%F2"
																target="_blank">按销量排序</a></li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%B0%B4%D0%C2%C6%B7%C5%C5%D0%F2"
																target="_blank">按新品排序</a></li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%B0%B4%CA%D5%B2%D8%C5%C5%D0%F2"
																target="_blank">按收藏排序</a></li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%B0%B4%BC%DB%B8%F1%C5%C5%D0%F2"
																target="_blank">按价格排序</a></li>
														</ul>
														<ul class="hoverlist" style="">
															<li class="zhufenlei"><a href="#" target="_blank">上衣</a>
															</li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%D3%F0%C8%DE"
																target="_blank">羽绒</a></li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%BF%AA%C9%C0"
																target="_blank">开衫</a></li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=T%D0%F4"
																target="_blank">T恤</a></li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%B3%C4%C9%C0"
																target="_blank">衬衫</a></li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%B1%B3%D0%C4%B5%F5%B4%F8"
																target="_blank">背心吊带</a></li>
														</ul>
														<ul class="hoverlist" style="">
															<li class="zhufenlei"><a href="#" target="_blank">裤装</a>
															</li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=5%2F7%2F9%B7%D6%BF%E3"
																target="_blank">5/7/9分裤</a></li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%D0%DD%CF%D0%B3%A4%BF%E3"
																target="_blank">休闲长裤</a></li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%B9%FE%C2%D7%BF%E3"
																target="_blank">哈伦裤</a></li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%C0%AB%CD%C8%BF%E3"
																target="_blank">阔腿裤</a></li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%B4%F2%B5%D7%BF%E3"
																target="_blank">打底裤</a></li>
														</ul>
														<ul class="hoverlist" style="">
															<li class="zhufenlei"><a href="#" target="_blank">裙装</a>
															</li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%C1%AC%D2%C2%C8%B9"
																target="_blank">连衣裙</a></li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%B0%EB%C9%ED%C8%B9"
																target="_blank">半身裙</a></li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%D1%A9%B7%C4%C8%B9"
																target="_blank">雪纺裙</a></li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%C0%D9%CB%BF%C8%B9"
																target="_blank">蕾丝裙</a></li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%C3%DE%C2%E9%C8%B9"
																target="_blank">棉麻裙</a></li>
														</ul>
														<ul class="hoverlist" style="">
															<li class="zhufenlei"><a href="#" target="_blank">外套</a>
															</li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%D0%A1%CE%F7%D7%B0"
																target="_blank">小西装</a></li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%CE%C0%D2%C2"
																target="_blank">卫衣</a></li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%C2%ED%BC%D7"
																target="_blank">马甲</a></li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%B7%E7%D2%C2"
																target="_blank">风衣</a></li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%D3%F0%C8%DE"
																target="_blank">羽绒</a></li>
														</ul>
														<ul class="hoverlist" style="">
															<li class="zhufenlei"><a href="#" target="_blank">配饰</a>
															</li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%B0%FC%B0%FC"
																target="_blank">包包</a></li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%D0%AC%D7%D3"
																target="_blank">鞋子</a></li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%B7%A2%CA%CE"
																target="_blank">发饰</a></li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%D1%FC%B4%F8"
																target="_blank">腰带</a></li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%B4%F2%B5%D7%BF%E3"
																target="_blank">打底裤</a></li>
														</ul>
														<ul class="hoverlist" style="">
															<li class="zhufenlei"><a href="#" target="_blank">裙装</a>
															</li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%C1%AC%D2%C2%C8%B9"
																target="_blank">连衣裙</a></li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%B0%EB%C9%ED%C8%B9"
																target="_blank">半身裙</a></li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%D1%A9%B7%C4%C8%B9"
																target="_blank">雪纺裙</a></li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%C0%D9%CB%BF%C8%B9"
																target="_blank">蕾丝裙</a></li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%C3%DE%C2%E9%C8%B9"
																target="_blank">棉麻裙</a></li>
														</ul>
														<ul class="hoverlist" style="">
															<li class="zhufenlei"><a href="#" target="_blank">外套</a>
															</li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%D0%A1%CE%F7%D7%B0"
																target="_blank">小西装</a></li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%CE%C0%D2%C2"
																target="_blank">卫衣</a></li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%C2%ED%BC%D7"
																target="_blank">马甲</a></li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%B7%E7%D2%C2"
																target="_blank">风衣</a></li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%D3%F0%C8%DE"
																target="_blank">羽绒</a></li>
														</ul>
														<ul class="hoverlist" style="clear: both;">
															<li class="zhufenlei"><a href="#" target="_blank">上衣</a>
															</li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%D3%F0%C8%DE"
																target="_blank">羽绒</a></li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%BF%AA%C9%C0"
																target="_blank">开衫</a></li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=T%D0%F4"
																target="_blank">T恤</a></li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%B3%C4%C9%C0"
																target="_blank">衬衫</a></li>
															<li><a
																href="//shop104682877.taobao.com/search.htm?orderType=_hotsell&amp;keyword=%B1%B3%D0%C4%B5%F5%B4%F8"
																target="_blank">背心吊带</a></li>
														</ul>
													</div>
													<div style="clear: both; width: 590px;"></div>
												</div>
											</div>
										</div>

										<div class="J_TWidget hidden xialastyle2 tb-shop-popup-show"
											data-widget-type="Popup"
											data-widget-config="{

	'trigger':'.navlist999',

	'align':{

		'node':'.navlist2',

		'offset':[0,0],'points':['bl','tl']	}

	}"
											style="width: 740px; display: block; position: absolute; left: -9999px; top: -9999px; z-index: 99999800;">
											<div class="ks-popup-content">
												<div class="outbox" style="width: 740px;">
													<img class="abs"
														src="//gdp.alicdn.com/imgextra/i1/39767794/TB2bsFZapXXXXaLXpXXXXXXXXXX_!!39767794.png"
														width="739" height="208" style="top: -7px;">
												</div>
											</div>
										</div>
										<div class="J_TWidget hidden xialastyle2 tb-shop-popup-show"
											data-widget-type="Popup"
											data-widget-config="{

	'trigger':'.navlist999',

	'align':{

		'node':'.navlist2',

		'offset':[0,0],'points':['bl','tl']	}

	}"
											style="width: 740px; display: block; position: absolute; left: -9999px; top: -9999px; z-index: 99999800;">
											<div class="ks-popup-content">
												<div class="outbox" style="width: 740px;">
													<img class="abs"
														src="//gdp.alicdn.com/imgextra/i2/39767794/TB27HBWapXXXXceXXXXXXXXXXXX_!!39767794.png"
														width="739" height="208" style="top: -7px;">
												</div>
											</div>
										</div>
										<div class="J_TWidget hidden xialastyle2 tb-shop-popup-show"
											data-widget-type="Popup"
											data-widget-config="{

	'trigger':'.navlist999',

	'align':{

		'node':'.navlist2',

		'offset':[0,0],'points':['bl','tl']	}

	}"
											style="width: 990px; display: block; position: absolute; left: -9999px; top: -9999px; z-index: 99999800;">
											<div class="ks-popup-content">
												<div class="outbox" style="width: 990px;"></div>
											</div>
										</div>
										<div class="J_TWidget hidden xialastyle2 tb-shop-popup-show"
											data-widget-type="Popup"
											data-widget-config="{

	'trigger':'.navlist999',

	'align':{

		'node':'.navlist2',

		'offset':[0,0],'points':['bl','tl']	}

	}"
											style="width: 990px; display: block; position: absolute; left: -9999px; top: -9999px; z-index: 99999800;">
											<div class="ks-popup-content">
												<div class="outbox" style="width: 990px;"></div>
											</div>
										</div>
										<div class="J_TWidget hidden xialastyle2 tb-shop-popup-show"
											data-widget-type="Popup"
											data-widget-config="{

	'trigger':'.navlist999',

	'align':{

		'node':'.navlist2',

		'offset':[0,0],'points':['bl','tl']	}

	}"
											style="width: 990px; display: block; position: absolute; left: -9999px; top: -9999px; z-index: 99999800;">
											<div class="ks-popup-content">
												<div class="outbox" style="width: 990px;"></div>
											</div>
										</div>
										<div class="J_TWidget hidden xialastyle2 tb-shop-popup-show"
											data-widget-type="Popup"
											data-widget-config="{

	'trigger':'.navlist999',

	'align':{

		'node':'.navlist2',

		'offset':[0,0],'points':['bl','tl']	}

	}"
											style="width: 990px; display: block; position: absolute; left: -9999px; top: -9999px; z-index: 99999800;">
											<div class="ks-popup-content">
												<div class="outbox" style="width: 990px;"></div>
											</div>
										</div>
										<div class="J_TWidget hidden xialastyle2 tb-shop-popup-show"
											data-widget-type="Popup"
											data-widget-config="{

	'trigger':'.navlist999',

	'align':{

		'node':'.navlist2',

		'offset':[0,0],'points':['bl','tl']	}

	}"
											style="width: 990px; display: block; position: absolute; left: -9999px; top: -9999px; z-index: 99999800;">
											<div class="ks-popup-content">
												<div class="outbox" style="width: 990px;"></div>
											</div>
										</div>
										<div class="J_TWidget hidden xialastyle2 tb-shop-popup-show"
											data-widget-type="Popup"
											data-widget-config="{

	'trigger':'.navlist999',

	'align':{

		'node':'.navlist2',

		'offset':[0,0],'points':['bl','tl']	}

	}"
											style="width: 990px; display: block; position: absolute; left: -9999px; top: -9999px; z-index: 99999800;">
											<div class="ks-popup-content">
												<div class="outbox" style="width: 990px;"></div>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="tshop-pbsm-shop-nav-ch">
				<div class="skin-box-bd" style="width: 0px; height: 0px;">
					<div class="all-cats-popup tb-shop-popup-content"
						style="position: absolute; top: -99999px; left: -99999px; z-index: 100000000;">
						<div class="popup-content">
							<div class="popup-inner">

								<ul class="J_TAllCatsTree cats-tree">
									<li class="cat fst-cat">
										<h4 class="cat-hd fst-cat-hd has-children">
											<i class="cat-icon fst-cat-icon"></i> <a
												href="//meizu.tmall.com/search.htm?search=y"
												class="cat-name fst-cat-name">所有宝贝</a>
										</h4>

										<div class="snd-pop tb-shop-popup-content"
											style="position: absolute; top: -99999px; left: -99999px;">
											<div class="popup-content">
												<div class="snd-pop-inner">
													<ul class="fst-cat-bd">
														<li class="cat snd-cat">
															<h4 class="cat-hd snd-cat-hd">
																<i class="cat-icon snd-cat-icon"></i> <a
																	href="//meizu.tmall.com/search.htm?search=y&amp;orderType=defaultSort"
																	class="by-label by-sale snd-cat-name" rel="nofollow">按综合</a>
															</h4>
															<h4 class="cat-hd snd-cat-hd">
																<i class="cat-icon snd-cat-icon"></i> <a
																	href="//meizu.tmall.com/search.htm?search=y&amp;orderType=hotsell_desc"
																	class="by-label by-sale snd-cat-name" rel="nofollow">按销量</a>
															</h4>
															<h4 class="cat-hd snd-cat-hd">
																<i class="cat-icon snd-cat-icon"></i> <a
																	href="//meizu.tmall.com/search.htm?search=y&amp;orderType=newOn_desc"
																	class="by-label by-new snd-cat-name" rel="nofollow">按新品</a>
															</h4>
															<h4 class="cat-hd snd-cat-hd">
																<i class="cat-icon snd-cat-icon"></i> <a
																	href="//meizu.tmall.com/search.htm?search=y&amp;orderType=price_asc"
																	class="by-label by-price snd-cat-name" rel="nofollow">按价格</a>
															</h4>
														</li>
													</ul>
												</div>
											</div>
										</div>
									</li>
									<li class="cat fst-cat">
										<h4 class="cat-hd fst-cat-hd has-children">

											<i class="cat-icon fst-cat-icon  active-trigger"></i> <a
												class="cat-name fst-cat-name"
												href="//meizu.tmall.com/category-747497802.htm?search=y&amp;catName=%CA%D6%BB%FA%D7%A8%C7%F8">手机专区</a>
										</h4>
										<div class="snd-pop tb-shop-popup-content"
											style="position: absolute; top: -99999px; left: -99999px;">
											<div class="popup-content">
												<div class="snd-pop-inner">
													<ul class="fst-cat-bd">
														<li class="cat snd-cat">
															<h4 class="cat-hd snd-cat-hd">
																<i class="cat-icon snd-cat-icon"></i> <a
																	class="cat-name snd-cat-name"
																	href="//meizu.tmall.com/category-1435708677.htm?search=y&amp;parentCatId=747497802&amp;parentCatName=%CA%D6%BB%FA%D7%A8%C7%F8&amp;catName=%F7%C8%D7%E5+Note9">
																	魅族 Note9 </a>
															</h4>
														</li>
														<li class="cat snd-cat">
															<h4 class="cat-hd snd-cat-hd">
																<i class="cat-icon snd-cat-icon"></i> <a
																	class="cat-name snd-cat-name"
																	href="//meizu.tmall.com/category-1391190804.htm?search=y&amp;parentCatId=747497802&amp;parentCatName=%CA%D6%BB%FA%D7%A8%C7%F8&amp;catName=%F7%C8%D7%E5+16%CF%B5%C1%D0">
																	魅族 16系列 </a>
															</h4>
														</li>
														<li class="cat snd-cat">
															<h4 class="cat-hd snd-cat-hd">
																<i class="cat-icon snd-cat-icon"></i> <a
																	class="cat-name snd-cat-name"
																	href="//meizu.tmall.com/category-1263181816.htm?search=y&amp;parentCatId=747497802&amp;parentCatName=%CA%D6%BB%FA%D7%A8%C7%F8&amp;catName=%F7%C8%D7%E515%CF%B5%C1%D0">
																	魅族15系列 </a>
															</h4>
														</li>
														<li class="cat snd-cat">
															<h4 class="cat-hd snd-cat-hd">
																<i class="cat-icon snd-cat-icon"></i> <a
																	class="cat-name snd-cat-name"
																	href="//meizu.tmall.com/category-1410607472.htm?search=y&amp;parentCatId=747497802&amp;parentCatName=%CA%D6%BB%FA%D7%A8%C7%F8&amp;catName=%F7%C8%D7%E5Note8">
																	魅族Note8 </a>
															</h4>
														</li>
														<li class="cat snd-cat">
															<h4 class="cat-hd snd-cat-hd">
																<i class="cat-icon snd-cat-icon"></i> <a
																	class="cat-name snd-cat-name"
																	href="//meizu.tmall.com/category-1405804352.htm?search=y&amp;parentCatId=747497802&amp;parentCatName=%CA%D6%BB%FA%D7%A8%C7%F8&amp;catName=%F7%C8%D7%E5+X8">
																	魅族 X8 </a>
															</h4>
														</li>
														<li class="cat snd-cat">
															<h4 class="cat-hd snd-cat-hd">
																<i class="cat-icon snd-cat-icon"></i> <a
																	class="cat-name snd-cat-name"
																	href="//meizu.tmall.com/category-1405804351.htm?search=y&amp;parentCatId=747497802&amp;parentCatName=%CA%D6%BB%FA%D7%A8%C7%F8&amp;catName=%F7%C8%D7%E5+V8">
																	魅族 V8 </a>
															</h4>
														</li>
													</ul>
												</div>
											</div>
										</div>
									</li>
									<li class="cat fst-cat">
										<h4 class="cat-hd fst-cat-hd has-children">

											<i class="cat-icon fst-cat-icon  active-trigger"></i> <a
												class="cat-name fst-cat-name"
												href="//meizu.tmall.com/category-1338174915.htm?search=y&amp;catName=%B6%FA%BB%FA%2F%B6%FA%C2%F3">耳机/耳麦</a>
										</h4>
										<div class="snd-pop tb-shop-popup-content"
											style="position: absolute; top: -99999px; left: -99999px;">
											<div class="popup-content">
												<div class="snd-pop-inner">
													<ul class="fst-cat-bd">
														<li class="cat snd-cat">
															<h4 class="cat-hd snd-cat-hd">
																<i class="cat-icon snd-cat-icon"></i> <a
																	class="cat-name snd-cat-name"
																	href="//meizu.tmall.com/category-1338174918.htm?search=y&amp;parentCatId=1338174915&amp;parentCatName=%B6%FA%BB%FA%2F%B6%FA%C2%F3&amp;catName=%F7%C8%D7%E5+EP52">
																	魅族 EP52 </a>
															</h4>
														</li>
														<li class="cat snd-cat">
															<h4 class="cat-hd snd-cat-hd">
																<i class="cat-icon snd-cat-icon"></i> <a
																	class="cat-name snd-cat-name"
																	href="//meizu.tmall.com/category-1423930300.htm?search=y&amp;parentCatId=1338174915&amp;parentCatName=%B6%FA%BB%FA%2F%B6%FA%C2%F3&amp;catName=%F7%C8%D7%E5+EP52+Lite">
																	魅族 EP52 Lite </a>
															</h4>
														</li>
														<li class="cat snd-cat">
															<h4 class="cat-hd snd-cat-hd">
																<i class="cat-icon snd-cat-icon"></i> <a
																	class="cat-name snd-cat-name"
																	href="//meizu.tmall.com/category-1338174920.htm?search=y&amp;parentCatId=1338174915&amp;parentCatName=%B6%FA%BB%FA%2F%B6%FA%C2%F3&amp;catName=%F7%C8%D7%E5+EP2x">
																	魅族 EP2x </a>
															</h4>
														</li>
														<li class="cat snd-cat">
															<h4 class="cat-hd snd-cat-hd">
																<i class="cat-icon snd-cat-icon"></i> <a
																	class="cat-name snd-cat-name"
																	href="//meizu.tmall.com/category-1359554765.htm?search=y&amp;parentCatId=1338174915&amp;parentCatName=%B6%FA%BB%FA%2F%B6%FA%C2%F3&amp;catName=Flow%2FFlow+Bass">
																	Flow/Flow Bass </a>
															</h4>
														</li>
														<li class="cat snd-cat">
															<h4 class="cat-hd snd-cat-hd">
																<i class="cat-icon snd-cat-icon"></i> <a
																	class="cat-name snd-cat-name"
																	href="//meizu.tmall.com/category-1360846083.htm?search=y&amp;parentCatId=1338174915&amp;parentCatName=%B6%FA%BB%FA%2F%B6%FA%C2%F3&amp;catName=Live%CB%C4%B5%A5%D4%AA%B6%FA%BB%FA">
																	Live四单元耳机 </a>
															</h4>
														</li>
														<li class="cat snd-cat">
															<h4 class="cat-hd snd-cat-hd">
																<i class="cat-icon snd-cat-icon"></i> <a
																	class="cat-name snd-cat-name"
																	href="//meizu.tmall.com/category-1405812278.htm?search=y&amp;parentCatId=1338174915&amp;parentCatName=%B6%FA%BB%FA%2F%B6%FA%C2%F3&amp;catName=%F7%C8%D7%E5%C0%B6%D1%C0%D2%F4%C6%B5%BD%D3%CA%D5%C6%F7">
																	魅族蓝牙音频接收器 </a>
															</h4>
														</li>
														<li class="cat snd-cat">
															<h4 class="cat-hd snd-cat-hd">
																<i class="cat-icon snd-cat-icon"></i> <a
																	class="cat-name snd-cat-name"
																	href="//meizu.tmall.com/category-1423930275.htm?search=y&amp;parentCatId=1338174915&amp;parentCatName=%B6%FA%BB%FA%2F%B6%FA%C2%F3&amp;catName=POP%D5%E6%CE%DE%CF%DF%C0%B6%D1%C0%B6%FA%BB%FA">
																	POP真无线蓝牙耳机 </a>
															</h4>
														</li>
													</ul>
												</div>
											</div>
										</div>
									</li>
									<li class="cat fst-cat">
										<h4 class="cat-hd fst-cat-hd has-children">

											<i class="cat-icon fst-cat-icon  active-trigger"></i> <a
												class="cat-name fst-cat-name"
												href="//meizu.tmall.com/category-1338174938.htm?search=y&amp;catName=%D6%C7%C4%DC%C9%FA%BB%EE">智能生活</a>
										</h4>
										<div class="snd-pop tb-shop-popup-content"
											style="position: absolute; top: -99999px; left: -99999px;">
											<div class="popup-content">
												<div class="snd-pop-inner">
													<ul class="fst-cat-bd">
														<li class="cat snd-cat">
															<h4 class="cat-hd snd-cat-hd">
																<i class="cat-icon snd-cat-icon"></i> <a
																	class="cat-name snd-cat-name"
																	href="//meizu.tmall.com/category-1338174942.htm?search=y&amp;parentCatId=1338174938&amp;parentCatName=%D6%C7%C4%DC%C9%FA%BB%EE&amp;catName=%F7%C8%D7%E5+%C0%B6%D1%C0%D0%A1%D2%F4%CF%E4">
																	魅族 蓝牙小音箱 </a>
															</h4>
														</li>
														<li class="cat snd-cat">
															<h4 class="cat-hd snd-cat-hd">
																<i class="cat-icon snd-cat-icon"></i> <a
																	class="cat-name snd-cat-name"
																	href="//meizu.tmall.com/category-1338174943.htm?search=y&amp;parentCatId=1338174938&amp;parentCatName=%D6%C7%C4%DC%C9%FA%BB%EE&amp;catName=%F7%C8%D7%E5+%C2%B7%D3%C9%C6%F7">
																	魅族 路由器 </a>
															</h4>
														</li>
													</ul>
												</div>
											</div>
										</div>
									</li>
									<li class="cat fst-cat">
										<h4 class="cat-hd fst-cat-hd has-children">

											<i class="cat-icon fst-cat-icon  active-trigger"></i> <a
												class="cat-name fst-cat-name"
												href="//meizu.tmall.com/category-1339207860.htm?search=y&amp;catName=%D2%C6%B6%AF%B5%E7%D4%B4">移动电源</a>
										</h4>
										<div class="snd-pop tb-shop-popup-content"
											style="position: absolute; top: -99999px; left: -99999px;">
											<div class="popup-content">
												<div class="snd-pop-inner">
													<ul class="fst-cat-bd">
														<li class="cat snd-cat">
															<h4 class="cat-hd snd-cat-hd">
																<i class="cat-icon snd-cat-icon"></i> <a
																	class="cat-name snd-cat-name"
																	href="//meizu.tmall.com/category-1342099886.htm?search=y&amp;parentCatId=1339207860&amp;parentCatName=%D2%C6%B6%AF%B5%E7%D4%B4&amp;catName=%F7%C8%D7%E5%D2%C6%B6%AF%B5%E7%D4%B43">
																	魅族移动电源3 </a>
															</h4>
														</li>
													</ul>
												</div>
											</div>
										</div>
									</li>
									<li class="cat fst-cat">
										<h4 class="cat-hd fst-cat-hd has-children">

											<i class="cat-icon fst-cat-icon  active-trigger"></i> <a
												class="cat-name fst-cat-name"
												href="//meizu.tmall.com/category-1263748758.htm?search=y&amp;catName=%CF%E4%B0%FC%C5%E4%BC%FE">箱包配件</a>
										</h4>
										<div class="snd-pop tb-shop-popup-content"
											style="position: absolute; top: -99999px; left: -99999px;">
											<div class="popup-content">
												<div class="snd-pop-inner">
													<ul class="fst-cat-bd">
														<li class="cat snd-cat">
															<h4 class="cat-hd snd-cat-hd">
																<i class="cat-icon snd-cat-icon"></i> <a
																	class="cat-name snd-cat-name"
																	href="//meizu.tmall.com/category-1338174912.htm?search=y&amp;parentCatId=1263748758&amp;parentCatName=%CF%E4%B0%FC%C5%E4%BC%FE&amp;catName=%F7%C8%C0%B6+%C2%C3%D0%D0%B4%FC">
																	魅蓝 旅行袋 </a>
															</h4>
														</li>
														<li class="cat snd-cat">
															<h4 class="cat-hd snd-cat-hd">
																<i class="cat-icon snd-cat-icon"></i> <a
																	class="cat-name snd-cat-name"
																	href="//meizu.tmall.com/category-1338174913.htm?search=y&amp;parentCatId=1263748758&amp;parentCatName=%CF%E4%B0%FC%C5%E4%BC%FE&amp;catName=%F7%C8%C0%B6+%D0%D8%B0%FC">
																	魅蓝 胸包 </a>
															</h4>
														</li>
													</ul>
												</div>
											</div>
										</div>
									</li>
									<li class="cat fst-cat">
										<h4 class="cat-hd fst-cat-hd has-children">

											<i class="cat-icon fst-cat-icon  active-trigger"></i> <a
												class="cat-name fst-cat-name"
												href="//meizu.tmall.com/category-1230920564-1489927268.htm?search=y&amp;catName=%CA%D6%BB%FA%C5%E4%BC%FE">手机配件</a>
										</h4>
										<div class="snd-pop tb-shop-popup-content"
											style="position: absolute; top: -99999px; left: -99999px;">
											<div class="popup-content">
												<div class="snd-pop-inner">
													<ul class="fst-cat-bd">
														<li class="cat snd-cat">
															<h4 class="cat-hd snd-cat-hd">
																<i class="cat-icon snd-cat-icon"></i> <a
																	class="cat-name snd-cat-name"
																	href="//meizu.tmall.com/category-1400334044-1489927268.htm?search=y&amp;parentCatId=1230920564&amp;parentCatName=%CA%D6%BB%FA%C5%E4%BC%FE&amp;parentCatPageId=1489927268&amp;catName=%F7%C8%D7%E5+16th%C5%E4%BC%FE">
																	魅族 16th配件 </a>
															</h4>
														</li>
														<li class="cat snd-cat">
															<h4 class="cat-hd snd-cat-hd">
																<i class="cat-icon snd-cat-icon"></i> <a
																	class="cat-name snd-cat-name"
																	href="//meizu.tmall.com/category-1423930433-1489927268.htm?search=y&amp;parentCatId=1230920564&amp;parentCatName=%CA%D6%BB%FA%C5%E4%BC%FE&amp;parentCatPageId=1489927268&amp;catName=%F7%C8%D7%E5+X8%C5%E4%BC%FE">
																	魅族 X8配件 </a>
															</h4>
														</li>
														<li class="cat snd-cat">
															<h4 class="cat-hd snd-cat-hd">
																<i class="cat-icon snd-cat-icon"></i> <a
																	class="cat-name snd-cat-name"
																	href="//meizu.tmall.com/category-1423930434-1489927268.htm?search=y&amp;parentCatId=1230920564&amp;parentCatName=%CA%D6%BB%FA%C5%E4%BC%FE&amp;parentCatPageId=1489927268&amp;catName=%F7%C8%D7%E5+Note8%C5%E4%BC%FE">
																	魅族 Note8配件 </a>
															</h4>
														</li>
													</ul>
												</div>
											</div>
										</div>
									</li>
									<li class="cat fst-cat">
										<h4 class="cat-hd fst-cat-hd has-children">

											<i class="cat-icon fst-cat-icon  active-trigger"></i> <a
												class="cat-name fst-cat-name"
												href="//meizu.tmall.com/category-1338174928.htm?search=y&amp;catName=%CA%FD%BE%DD%CF%DF">数据线</a>
										</h4>
										<div class="snd-pop tb-shop-popup-content"
											style="position: absolute; top: -99999px; left: -99999px;">
											<div class="popup-content">
												<div class="snd-pop-inner">
													<ul class="fst-cat-bd">
														<li class="cat snd-cat">
															<h4 class="cat-hd snd-cat-hd">
																<i class="cat-icon snd-cat-icon"></i> <a
																	class="cat-name snd-cat-name"
																	href="//meizu.tmall.com/category-1338174929.htm?search=y&amp;parentCatId=1338174928&amp;parentCatName=%CA%FD%BE%DD%CF%DF&amp;catName=%D4%AD%D7%B0MicroUSB%CA%FD%BE%DD%CF%DF">
																	原装MicroUSB数据线 </a>
															</h4>
														</li>
														<li class="cat snd-cat">
															<h4 class="cat-hd snd-cat-hd">
																<i class="cat-icon snd-cat-icon"></i> <a
																	class="cat-name snd-cat-name"
																	href="//meizu.tmall.com/category-1338174930.htm?search=y&amp;parentCatId=1338174928&amp;parentCatName=%CA%FD%BE%DD%CF%DF&amp;catName=MicroUSB%BD%F0%CA%F4%CA%FD%BE%DD%CF%DF">
																	MicroUSB金属数据线 </a>
															</h4>
														</li>
														<li class="cat snd-cat">
															<h4 class="cat-hd snd-cat-hd">
																<i class="cat-icon snd-cat-icon"></i> <a
																	class="cat-name snd-cat-name"
																	href="//meizu.tmall.com/category-1338174932.htm?search=y&amp;parentCatId=1338174928&amp;parentCatName=%CA%FD%BE%DD%CF%DF&amp;catName=Type-C%BD%F0%CA%F4%CA%FD%BE%DD%CF%DF">
																	Type-C金属数据线 </a>
															</h4>
														</li>
													</ul>
												</div>
											</div>
										</div>
									</li>
									<li class="cat fst-cat">
										<h4 class="cat-hd fst-cat-hd has-children">

											<i class="cat-icon fst-cat-icon  active-trigger"></i> <a
												class="cat-name fst-cat-name"
												href="//meizu.tmall.com/category-1338174922.htm?search=y&amp;catName=%B3%E4%B5%E7%C6%F7">充电器</a>
										</h4>
										<div class="snd-pop tb-shop-popup-content"
											style="position: absolute; top: -99999px; left: -99999px;">
											<div class="popup-content">
												<div class="snd-pop-inner">
													<ul class="fst-cat-bd">
														<li class="cat snd-cat">
															<h4 class="cat-hd snd-cat-hd">
																<i class="cat-icon snd-cat-icon"></i> <a
																	class="cat-name snd-cat-name"
																	href="//meizu.tmall.com/category-1338174923.htm?search=y&amp;parentCatId=1338174922&amp;parentCatName=%B3%E4%B5%E7%C6%F7&amp;catName=%BF%EC%B3%E4%B5%E7%D4%B4%CA%CA%C5%E4%C6%F7">
																	快充电源适配器 </a>
															</h4>
														</li>
														<li class="cat snd-cat">
															<h4 class="cat-hd snd-cat-hd">
																<i class="cat-icon snd-cat-icon"></i> <a
																	class="cat-name snd-cat-name"
																	href="//meizu.tmall.com/category-1423930435.htm?search=y&amp;parentCatId=1338174922&amp;parentCatName=%B3%E4%B5%E7%C6%F7&amp;catName=%F7%C8%D7%E5%CE%DE%CF%DF%B3%E4%B5%E7%C6%F7">
																	魅族无线充电器 </a>
															</h4>
														</li>
													</ul>
												</div>
											</div>
										</div>
									</li>
									<li class="cat fst-cat">
										<h4 class="cat-hd fst-cat-hd has-children">

											<i class="cat-icon fst-cat-icon  active-trigger"></i> <a
												class="cat-name fst-cat-name"
												href="//meizu.tmall.com/category-1338174945.htm?search=y&amp;catName=%D7%D4%C5%C4%B8%CB">自拍杆</a>
										</h4>
										<div class="snd-pop tb-shop-popup-content"
											style="position: absolute; top: -99999px; left: -99999px;">
											<div class="popup-content">
												<div class="snd-pop-inner">
													<ul class="fst-cat-bd">
														<li class="cat snd-cat">
															<h4 class="cat-hd snd-cat-hd">
																<i class="cat-icon snd-cat-icon"></i> <a
																	class="cat-name snd-cat-name"
																	href="//meizu.tmall.com/category-1338174946.htm?search=y&amp;parentCatId=1338174945&amp;parentCatName=%D7%D4%C5%C4%B8%CB&amp;catName=%C0%B6%D1%C0%D7%D4%C5%C4%B8%CB">
																	蓝牙自拍杆 </a>
															</h4>
														</li>
													</ul>
												</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div data-spm="1998132244" id="J_lidi">

		<!--  ESIBanner开始 -->
		<!-- position : BOTTOM , params: {st=1547049600000, link=/act/lidi, id=10003, et=1547740799000} -->

		<!--  ESIBanner结束 -->
	</div>
	<div id="LineZing" pagetype="2" shopid="104682877" tmplid=""
		itemid="574189749365"></div>

	<!--
<link rel="stylesheet" href="//mdetail.tmall.com/validateDc.htm?renderTime=&releaseTime=&lastVersionMd5=&releaseTimeKey=&itemId=574189749365&isNewSystem="/>
-->

	<div id="ks-component1616"
		class="ks-overlay ks-imagezoom-viewer ks-overlay-hidden"
		style="width: 418px; height: 418px; left: 815px; top: 216px;">

		<div id="ks-content-ks-component1616" class="ks-overlay-content">
			<img
				src="https://img.alicdn.com/imgextra/i2/1695308781/O1CN01Ovvz4u2EjkMl8IAr7_!!0-item_pic.jpg"
				style="position: absolute; top: 0px; left: -1082px; width: 1500px; height: 1500px;">
		</div>
	</div>
	
	<div class="modal fade" id="chat_modal" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="row">
					<div class="col-md-12">
						<!-- DIRECT CHAT PRIMARY -->
						<div class="box box-primary direct-chat direct-chat-primary">
							<div class="box-header with-border">
								<h3 class="box-title">${commodity.seller.storeName }</h3>
								<div class="box-tools pull-right">
									<button class="btn btn-box-tool">
										<i class="fa fa-minus"></i>
									</button>
									<button class="btn btn-box-tool"
										title="Contacts">
										<i class="fa fa-comments"></i>
									</button>
									<button class="btn btn-box-tool">
										<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<!-- Conversations are loaded here -->
								<div class="direct-chat-messages">
									
								</div>
								<!--/.direct-chat-messages-->

								<!-- Contacts are loaded here -->
								<div class="direct-chat-contacts">
									<ul class="contacts-list">
										<li><a href="#"> <img class="contacts-list-img"
												src="../dist/img/user1-128x128.jpg" alt="Contact Avatar">
												<div class="contacts-list-info">
													<span class="contacts-list-name"> Count Dracula <small
														class="contacts-list-date pull-right">2/28/2015</small>
													</span> <span class="contacts-list-msg">How have you been?
														I was...</span>
												</div> <!-- /.contacts-list-info -->
										</a></li>
										<!-- End Contact Item -->
									</ul>
									<!-- /.contatcts-list -->
								</div>
								<!-- /.direct-chat-pane -->
							</div>
							<!-- /.box-body -->
							<div class="box-footer">
								<div class="input-group">
									<input type="text" name="message"
										placeholder="输入消息 ..." class="form-control"> <span
										id="chat_send" data-sellerid="${sellerId }"
										class="input-group-btn">
										<button type="button" class="btn btn-primary btn-flat">发送</button>
									</span>
								</div>
							</div>
							<!-- /.box-footer-->
						</div>
						<!--/.direct-chat -->
					</div>
					<!-- /.col -->
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
</body>
<script
	src="${APP_PATH }/static/backstage/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${APP_PATH }/static/backstage/dist/js/adminlte.min.js"></script>
<script type="text/javascript">
	var APP_PATH = "${APP_PATH }";
	var user_id = ${userId };
	var seller_id = ${sellerId };
	var commodity_id = ${commodity.id};
	var select_property_row = null;
	var commodity_stock = ${commodity.stock };
	var min_price = ${commodity.minPrice};
		min_price = min_price.toFixed(2);
	var max_price = ${commodity.maxPrice};
		max_price = max_price.toFixed(2);
	var min_promotion_price = 
		<c:if test="${commodity.minPromotionPrice==null}">
		null;
		</c:if>
		<c:if test="${commodity.minPromotionPrice!=null}">
		${commodity.minPromotionPrice};
		min_promotion_price = min_promotion_price.toFixed(2);
		</c:if>
	var max_promotion_price = 
		<c:if test="${commodity.maxPromotionPrice==null}">
		null;
		</c:if>
		<c:if test="${commodity.maxPromotionPrice!=null}">
		${commodity.maxPromotionPrice};
		max_promotion_price = max_promotion_price.toFixed(2);
		</c:if>
	var commodity_variables = new Array();
	<c:forEach items='${commodity.commodityVariables }' var='commodityVariable'>
	commodity_variables.push({
		row: '${commodityVariable.selectPropertyRow }',
		price: ${commodityVariable.price },
		promotion_price: 
			<c:if test='${commodityVariable.promotionPrice!=null }'>
			${commodityVariable.promotionPrice },
			</c:if>
			<c:if test='${commodityVariable.promotionPrice==null }'>
			null,
			</c:if>
		stock: ${commodityVariable.stock}
	});
	</c:forEach>
</script>
<script type="text/javascript"
	src="${APP_PATH }/static/js/commodity_detail.js"></script>
</html>
