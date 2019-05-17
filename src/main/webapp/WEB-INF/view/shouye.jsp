<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% pageContext.setAttribute("APP_PATH", request.getContextPath()); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="spm-id" content="875.7931836/B">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<link rel="stylesheet" href="${APP_PATH }/static/css/shouye/a_003.css">
<link href="${APP_PATH }/static/css/header/meizu_header/header.css" rel="stylesheet">
<link rel="stylesheet" href="${APP_PATH }/static/css/myorder/layout-a2ae44047d.css">

<link href="${APP_PATH }/static/css/open-iconic.min.css" rel="stylesheet">

<script src="${APP_PATH }/static/js/jquery-3.2.1.min.js"></script>
<script>
	var APP_PATH = "${APP_PATH}";
</script>
<title>首页</title>
<style type="text/css">
	.oi {
		font-size: 12px !important;
	}
	input::-webkit-input-placeholder{
        font-size: 15px;
        font-family: 微软雅黑;
	}
	input::-moz-placeholder{
        font-size: 15px;
        font-family: 微软雅黑;
	}
</style>
</head>
<body class="w1230" style="">
	<%@ include file="/WEB-INF/view/public/header.jsp" %>
	<div id="mallPage" class="mui-global-biz-mallfp">
		<div id="content">
			<div class="main-nav" data-spm="2016004" style="border-color: #00c3f5;"></div>

			<style>
.banner-con:before {
	background: url() right center no-repeat;
}

.banner-con:after {
	background: url() left center no-repeat;
}

.activity-bg {
	background-image: url();
}
</style>
			<div class="j_category category-con">
				<div class="category-inner-con j_categoryInnerCon j_categoryTab">
					<div class="category-type" style="background-color: #00c3f5;">
						<i class="oi fp-iconfont" data-glyph="menu" aria-hidden="true"></i>
						<div class="text">商品分类</div>
					</div>

					<div class="category-tab-content">
						<div class="nav-con j_tabPannel category-tab-pannel pannel-normal">
							<ul class="normal-nav clearfix">

								<li class="j_MenuNav nav-item nav-item-0"
									data-spm="26,37"><i class="oi icon"
									data-glyph="heart" aria-hidden="true"></i><i
									class="dot fp-iconfont"></i> <a
									href="${APP_PATH }/products?varietyId=1000">女装</a>

									/ <a
									href="${APP_PATH }/products?varietyId=1001">内衣</a>

									<b class="arrow"></b></li>

								<li class="j_MenuNav nav-item nav-item-1"
									data-spm="26,37"><i class="oi icon"
									data-glyph="globe" aria-hidden="true"></i><i
									class="dot fp-iconfont"></i> 
									<a href="${APP_PATH }/products?varietyId=26">男装</a>

									/ <a
									href="${APP_PATH }/products?varietyId=1003">运动户外</a>

									<b class="arrow"></b></li>

								<li class="j_MenuNav nav-item nav-item-2"
									data-spm="26,37"><i class="oi icon"
									data-glyph="dashboard" aria-hidden="true"></i><i
									class="dot fp-iconfont"></i> <a
									href="${APP_PATH }/products?varietyId=1004">女鞋</a>

									/ <a
									href="${APP_PATH }/products?varietyId=1005">男鞋</a>

									/ <a
									href="${APP_PATH }/products?varietyId=1006">箱包</a>

									<b class="arrow"></b></li>

								<li class="j_MenuNav nav-item nav-item-3"
									data-spm="26,37"><i class="oi icon"
									data-glyph="brush" aria-hidden="true"></i><i
									class="dot fp-iconfont"></i> <a
									href="${APP_PATH }/products?varietyId=1007">美妆</a>

									/ <a
									href="${APP_PATH }/products?varietyId=1008">个人护理</a>

									<b class="arrow"></b></li>

								<li class="j_MenuNav nav-item nav-item-4"
									data-spm="26,37"><i class="oi icon"
									data-glyph="clock" aria-hidden="true"></i><i
									class="dot fp-iconfont"></i> <a
									href="${APP_PATH }/products?varietyId=1009">腕表</a>

									/ <a
									href="${APP_PATH }/products?varietyId=1010">眼镜</a>

									/ <a
									href="${APP_PATH }/products?varietyId=1011">珠宝饰品</a>

									<b class="arrow"></b></li>

								<li class="j_MenuNav nav-item nav-item-5"
									data-spm="26,37"><i class="oi icon"
									data-glyph="phone" aria-hidden="true"></i><i
									class="dot fp-iconfont"></i> <a
									href="${APP_PATH }/products?varietyId=1012">手机</a>

									/ <a
									href="${APP_PATH }/products?varietyId=1013">数码</a>

									/ <a
									href="${APP_PATH }/products?varietyId=1014">电脑办公</a>

									<b class="arrow"></b></li>

								<li class="j_MenuNav nav-item nav-item-6"
									data-spm="26,37"><i class="oi icon"
									data-glyph="map" aria-hidden="true"></i><i
									class="dot fp-iconfont"></i> <a
									href="${APP_PATH }/products?varietyId=1015">母婴玩具</a>

									<b class="arrow"></b></li>

								<li class="j_MenuNav nav-item nav-item-7"
									data-spm="26,37"><i class="oi icon"
									data-glyph="dial" aria-hidden="true"></i><i
									class="dot fp-iconfont"></i> <a
									href="${APP_PATH }/products?varietyId=1016">零食</a>

									/ <a
									href="${APP_PATH }/products?varietyId=1017">茶酒</a>

									/ <a
									href="${APP_PATH }/products?varietyId=1018">进口食品</a>

									<b class="arrow"></b></li>

								<li class="j_MenuNav nav-item nav-item-8"
									data-spm="26,37"><i class="oi icon"
									data-glyph="laptop" aria-hidden="true"></i><i
									class="dot fp-iconfont"></i> <a
									href="${APP_PATH }/products?varietyId=1019">生鲜水果</a>

									<b class="arrow"></b></li>

								<li class="j_MenuNav nav-item nav-item-9"
									data-spm="26,37"><i class="oi icon"
									data-glyph="tablet" aria-hidden="true"></i><i
									class="dot fp-iconfont"></i> <a
									href="${APP_PATH }/products?varietyId=1020">大家电</a>

									/ <a
									href="${APP_PATH }/products?varietyId=1021">生活电器</a>

									<b class="arrow"></b></li>

								<li class="j_MenuNav nav-item nav-item-10"
									data-spm="26,37"><i class="oi icon"
									data-glyph="spreadsheet" aria-hidden="true"></i><i
									class="dot fp-iconfont"></i> <a
									href="${APP_PATH }/products?varietyId=1022">家具建材</a>

									<b class="arrow"></b></li>

								<li class="j_MenuNav nav-item nav-item-11"
									data-spm="26,37"><i class="oi icon"
									data-glyph="battery-empty" aria-hidden="true"></i><i
									class="dot fp-iconfont"></i> <a
									href="${APP_PATH }/products?varietyId=1023">汽车</a>

									/ <a
									href="${APP_PATH }/products?varietyId=1024">配件</a>

									/ <a
									href="${APP_PATH }/products?varietyId=1025">用品</a>

									<b class="arrow"></b></li>

								<li class="j_MenuNav nav-item nav-item-12"
									data-spm="26,37"><i class="oi icon"
									data-glyph="badge" aria-hidden="true"></i><i
									class="dot fp-iconfont"></i> <a
									href="${APP_PATH }/products?varietyId=1026">家纺</a>

									/ <a
									href="${APP_PATH }/products?varietyId=1027">家饰</a>

									/ <a
									href="${APP_PATH }/products?varietyId=1028">鲜花</a>

									<b class="arrow"></b></li>

								<li class="j_MenuNav nav-item nav-item-13"
									data-spm="26,37"><i class="oi icon"
									data-glyph="command" aria-hidden="true"></i><i
									class="dot fp-iconfont"></i> <a
									href="${APP_PATH }/products?varietyId=1029">医药保健</a>

									<b class="arrow"></b></li>

								<li class="j_MenuNav nav-item nav-item-14"
									data-spm="26,37"><i class="oi icon"
									data-glyph="flag" aria-hidden="true"></i><i
									class="dot fp-iconfont"></i> <a
									href="${APP_PATH }/products?varietyId=1030">厨具</a>

									/ <a
									href="${APP_PATH }/products?varietyId=1031">收纳</a>

									/ <a
									href="${APP_PATH }/products?varietyId=1032">宠物</a>

									<b class="arrow"></b></li>

								<li class="j_MenuNav nav-item nav-item-15"
									data-spm="110,11121,131,11322,1232"><i class="oi icon"
									data-glyph="pin" aria-hidden="true"></i><i
									class="dot fp-iconfont"></i> <a
									href="${APP_PATH }/products?varietyId=1033">图书音像</a>

									<b class="arrow"></b></li>

							</ul>
						</div>

					</div>
					<div class="content-con j_categoryContent">
						<div class="pannel-con j_CategoryMenuPannel "
							style="display: none;"></div>
						<div class="pannel-con j_CategoryMenuPannel"
							style="display: none;"></div>
						<div class="pannel-con j_CategoryMenuPannel "
							style="display: none;"></div>
						<div class="pannel-con j_CategoryMenuPannel "
							style="display: none;"></div>
						<div class="pannel-con j_CategoryMenuPannel "
							style="display: none;"></div>
						<div class="pannel-con j_CategoryMenuPannel "
							style="display: none;"></div>
						<div class="pannel-con j_CategoryMenuPannel "
							style="display: none;"></div>
						<div class="pannel-con j_CategoryMenuPannel"
							style="display: none;"></div>
						<div class="pannel-con j_CategoryMenuPannel"
							style="display: none;"></div>
						<div class="pannel-con j_CategoryMenuPannel "
							style="display: none;"></div>
						<div class="pannel-con j_CategoryMenuPannel"
							style="display: none;"></div>
						<div class="pannel-con j_CategoryMenuPannel"
							style="display: none;"></div>
						<div class="pannel-con j_CategoryMenuPannel "
							style="display: none;"></div>
						<div class="pannel-con j_CategoryMenuPannel "
							style="display: none;"></div>
						<div class="pannel-con j_CategoryMenuPannel "
							style="display: none;"></div>
						<div class="pannel-con j_CategoryMenuPannel "
							style="display: none;"></div>
					</div>
				</div>

				<div class="banner-con j_mainBanner loading" data-spm="2016006">
					<div class="slider-decoration left"></div>
					<div class="slider-decoration right"></div>

					<div class="banner-slider j_bannerSlider">
						<div class="slider-content loading">
							<div class="main-banner slider-pannel j_tanxContainer"
								style="background: rgb(232, 232, 232) none repeat scroll 0% 0%; position: absolute; z-index: 1; opacity: 1; display: block;">
								<a>
									<div id="my_lunbo" class="tanx-banner-con">
										<!-- <img class="tanx-banner"
											src="https://img.alicdn.com/tps/i4/TB1LhmVUzDpK1RjSZFrwu178VXa.png_q100.jpg_.webp"> -->
									</div>
								</a>
							</div>
							<!-- <div class="main-banner slider-pannel j_tanxContainer"
								style="background: rgb(232, 232, 232) none repeat scroll 0% 0%; position: absolute; z-index: 1; opacity: 1; display: none;">
								<a>
									<div class="tanx-banner-con">
										<img class="tanx-banner"
											src="https://img.alicdn.com/simba/img/TB1BNOpKQzoK1RjSZFlSuui4VXa.jpg">
									</div>
								</a>
							</div>
							<div class="main-banner slider-pannel j_tanxContainer"
								style="background: rgb(232, 232, 232) none repeat scroll 0% 0%; position: absolute; z-index: 1; opacity: 1; display: none;">
								<a>
									<div class="tanx-banner-con">
										<img class="tanx-banner"
											src="http://img.alicdn.com/tps/i4/TB1s2pnUSzqK1RjSZPxSuw4tVXa.jpg">
									</div>
								</a>
							</div> -->
						</div>
					</div>

				</div>
			</div>

			<div class="j_wonderful wonderful-con" id="J_FloorCNXH">
				<h2 class="wonderful-title">
					<span class="text-ctn"> <i
						class="oi icon" data-glyph="random"></i>热门商品
					</span>
				</h2>
				<div class="module-content j_wonderfulList">
					<div data-spm="20161015">
						<ul class="wonderful-line  j_exposureExtra9 ">
							<c:forEach items="${commodities }" var="commodity" end="4" varStatus="status">
							<c:if test="${status.index==4 }">
							<li class="wonderful-item last">
							</c:if>
							<c:if test="${status.index!=4 }">
							<li class="wonderful-item">
							</c:if>
								<a class="card-item" href="${APP_PATH }/product/${commodity.id}">
									<span class="item-pic">
										<img src="${commodity.coverImage }" width="100%">
									</span> 
									<span class="item-info"> 
										<span class="item-desc">
											<em class="item-name" title="${commodity.title }">
												${commodity.title }
											</em>
										</span> 
										<span class="item-detail"> 
											<span class="item-price">
												<span class="mui-price  ">
													<i class="mui-price-rmb">¥</i>
													<span class="mui-price-integer">
														<c:if test="${commodity.minPromotionPrice!=null }">
														<fmt:formatNumber value="${commodity.minPromotionPrice }" maxFractionDigits="2" minFractionDigits="2">
														</fmt:formatNumber>
														</c:if>
														<c:if test="${commodity.minPromotionPrice==null }">
														<fmt:formatNumber value="${commodity.minPrice }" maxFractionDigits="2" minFractionDigits="2">
														</fmt:formatNumber>
														</c:if>
													</span>
												</span>
											</span>
										</span>
									</span>
								</a>
							</li>
							</c:forEach>
						</ul>

						<ul class="wonderful-line" >
							<c:forEach items="${commodities }" varStatus="status" var="commodity" begin="5"> 
							<c:if test="${status.index==9 }">
							<li class="wonderful-item last">
							</c:if>
							<c:if test="${status.index!=9 }">
							<li class="wonderful-item">
							</c:if>
								<a class="card-item" href="${APP_PATH }/product/${commodity.id}">
									<span class="item-pic">
										<img src="${commodity.coverImage }" width="100%">
									</span> 
									<span class="item-info"> 
										<span class="item-desc">
											<em class="item-name" title="${commodity.title }">
												${commodity.title }
											</em>
										</span> 
										<span class="item-detail"> 
											<span class="item-price">
												<span class="mui-price  ">
													<i class="mui-price-rmb">¥</i>
													<span class="mui-price-integer">
														<c:if test="${commodity.minPromotionPrice!=null }">
														<fmt:formatNumber value="${commodity.minPromotionPrice }" maxFractionDigits="2" minFractionDigits="2">
														</fmt:formatNumber>
														</c:if>
														<c:if test="${commodity.minPromotionPrice==null }">
														<fmt:formatNumber value="${commodity.minPrice }" maxFractionDigits="2" minFractionDigits="2">
														</fmt:formatNumber>
														</c:if>
													</span>
												</span>
											</span>
										</span>
									</span>
								</a>
							</li>
							</c:forEach>
						</ul>

					</div>

					<div class="j_exposureEnd" data-code="/tmallfp.5012.1"></div>
				</div>
				<div class="tm-end show"></div>
				<div class="j_end"></div>
			</div>

			<div class="fp-lift">
				<div class="mui-lift" id="J_FpLift" style="display: block;">
					<div class="sn-nav-wrapper" style="display: none;">
						<div class="mui-lift-nav nav-header">导航</div>
						<div data-spm="fpLift">

							<a data-spm-click="gostr=/tmallfp;locaid=dLift0;" href="#"
								target="self" id="J_FloorNavTMCS"
								class="mui-lift-nav color-type-green">
								<div class="mui-lift-nav-name">天猫超市</div>
							</a> <a data-spm-click="gostr=/tmallfp;locaid=dLift1;" href="#"
								target="self" id="J_FloorNavTMGJ"
								class="mui-lift-nav color-type-purple">
								<div class="mui-lift-nav-name">天猫国际</div>
							</a> <a data-spm-click="gostr=/tmallfp;locaid=dLift2;" href="#"
								target="self" id="J_FloorNavTMCS"
								class="mui-lift-nav color-type-green">
								<div class="mui-lift-nav-name">天猫超市</div>
							</a> <a data-spm-click="gostr=/tmallfp;locaid=dLift3;" href="#"
								target="self" id="J_FloorNavTMGJ"
								class="mui-lift-nav color-type-purple">
								<div class="mui-lift-nav-name">天猫国际</div>
							</a> <a data-spm-click="gostr=/tmallfp;locaid=dLift4;" href="#"
								target="self" id="J_FloorNavMLRS"
								class="mui-lift-nav color-type-pink">
								<div class="mui-lift-nav-name">美丽人生</div>
							</a> <a data-spm-click="gostr=/tmallfp;locaid=dLift5;" href="#"
								target="self" id="J_FloorNavCLKW"
								class="mui-lift-nav color-type-blue">
								<div class="mui-lift-nav-name">潮电酷玩</div>
							</a> <a data-spm-click="gostr=/tmallfp;locaid=dLift6;" href="#"
								target="self" id="J_FloorNavJJSH"
								class="mui-lift-nav color-type-green">
								<div class="mui-lift-nav-name">居家生活</div>
							</a> <a data-spm-click="gostr=/tmallfp;locaid=dLift7;" href="#"
								target="self" id="J_FloorNavDZAC"
								class="mui-lift-nav color-type-red">
								<div class="mui-lift-nav-name">打造爱巢</div>
							</a> <a data-spm-click="gostr=/tmallfp;locaid=dLift8;" href="#"
								target="self" id="J_FloorNavHWCX"
								class="mui-lift-nav color-type-cyan">
								<div class="mui-lift-nav-name">户外出行</div>
							</a> <a data-spm-click="gostr=/tmallfp;locaid=dLift11;" href="#"
								target="self" id="J_FloorNavCNXH" class="mui-lift-nav">
								<div class="mui-lift-nav-name">猜你喜欢</div>
							</a> <a data-spm-click="gostr=/tmallfp;locaid=dLift12;" href="#"
								class="mui-lift-nav nav-back j_navBack"> <i
								class="fp-iconfont"></i>
								<div>顶部</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<b data-mark="eea298cd6a372e6741f9bd4c83a9e059"></b>
	</div>
	<%@ include file="/WEB-INF/view/public/footer.jsp" %>
	<script type="text/javascript" src="${APP_PATH }/static/js/vue.min.js"></script>
	<script type="text/javascript" src="${APP_PATH }/static/js/vue-slideshow.min.js"></script>
	<script type="text/javascript">
		new Vue().VueSlideShow("#my_lunbo", {
	        images: [
	            { src: "${APP_PATH }/static/images/lunbo/TB1LhmVUzDpK1RjSZFrwu178VXa.png_q100.jpg_.webp"},
	            { src: "${APP_PATH }/static/images/lunbo/TB1BNOpKQzoK1RjSZFlSuui4VXa.jpg"},
	            { src: "${APP_PATH }/static/images/lunbo/TB1s2pnUSzqK1RjSZPxSuw4tVXa.jpg"}
	        ],
	        config: {
	            effect: "slide",
	            autoplay: 5000,
	            arrow: false,
	        }
		});
	</script>
	<script type="text/javascript" src="static/js/shouye.js"></script>
</body>
</html>