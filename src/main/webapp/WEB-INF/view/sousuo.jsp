<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% pageContext.setAttribute("APP_PATH", request.getContextPath()); %>
<!DOCTYPE html>
<html class="ks-webkit537 ks-webkit ks-chrome73 ks-chrome no-touch">
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
<style>
.list-font {
	visibility: visible !important
}
</style>
<link href="${APP_PATH }/static/css/sousuo/suggest.css"
	rel="stylesheet">
<link href="${APP_PATH }/static/css/sousuo/plugin-worth.css"
	rel="stylesheet">
<link href="${APP_PATH }/static/css/sousuo/minicart.css"
	rel="stylesheet">
<style>
.ww-light {
	overflow: hidden;
}

.ww-block {
	display: block;
	margin-top: 3px;
}

.ww-inline {
	display: inline-block;
	vertical-align: text-bottom;
}

.ww-light a {
	background-image: url1("//img.alicdn.com/tps/i1/T15AD7FFFaXXbJnvQ_-130-60.gif");
	background-image: -webkit-image-set(url1("//img.alicdn.com/tps/i1/T15AD7FFFaXXbJnvQ_-130-60.gif"
		) 1x, url1("//img.alicdn.com/tps/i4/T1Rsz7FPJaXXbZhKn7-520-240.gif")
		4x);
	background-image: -moz-image-set(url1("//img.alicdn.com/tps/i1/T15AD7FFFaXXbJnvQ_-130-60.gif"
		) 1x, url1("//img.alicdn.com/tps/i4/T1Rsz7FPJaXXbZhKn7-520-240.gif")
		4x);
	background-image: -o-image-set(url1("//img.alicdn.com/tps/i1/T15AD7FFFaXXbJnvQ_-130-60.gif"
		) 1x, url1("//img.alicdn.com/tps/i4/T1Rsz7FPJaXXbZhKn7-520-240.gif")
		4x);
	background-image: -ms-image-set(url1("//img.alicdn.com/tps/i1/T15AD7FFFaXXbJnvQ_-130-60.gif"
		) 1x, url1("//img.alicdn.com/tps/i4/T1Rsz7FPJaXXbZhKn7-520-240.gif")
		4x);
	text-decoration: none !important;
	width: 20px;
	height: 20px;
	zoom: 1;
}

.ww-large a {
	width: 67px;
}

a.ww-offline {
	background-position: 0 -20px;
}

a.ww-mobile {
	background-position: 0 -40px;
}

.ww-small .ww-online {
	background-position: -80px 0;
}

.ww-small .ww-offline {
	background-position: -80px -20px;
}

.ww-small .ww-mobile {
	background-position: -80px -40px;
}

.ww-static .ww-online {
	background-position: -110px 0;
}

.ww-static .ww-offline {
	background-position: -110px -20px;
}

.ww-static .ww-mobile {
	background-position: -110px -40px;
}

.ww-light a span {
	display: none;
}
</style>
<style>
.mui-mbar .mui-mbar-tab-ue {
	display: block
}
</style>
<style>
#tstart-plugin-switch .tstart-item-icon, .tstart-minimized .switch-mini,
	#tstart .i-arrow, #tstart .msg-count, #tstart .msg-count span, #tstart .icon-new,
	#tstart-plugin-news .t-msg-count .arrow, #tstart .switch-mini-tip {
	background-image: url1(// img.alicdn.com/ tps/ i3/ T1zYneXXlqXXaloVr4-167-122.png);
	background-repeat: no-repeat
}

body, #tstart h1, #tstart h2, #tstart h3, #tstart h4, #tstart h5,
	#tstart h6, #tstart hr, #tstart p, #tstart dl, #tstart dt, #tstart dd,
	#tstart ul, #tstart ol, #tstart li, #tstart pre, #tstart form, #tstart fieldset,
	#tstart legend, #tstart button, #tstart input, #tstart th, #tstart td {
	margin: 0;
	padding: 0
}

body, #tstart button, #start input, #tstart select {
	font: 12px/1.5 tahoma, arial, sans-serif
}

#tstart h1, #tstart h2, #tstart h3, #tstart h4, #tstart h5, #tstart h6 {
	font-size: 100%
}

#tstart address, #tstart em {
	font-style: normal
}

#tstart code, #tstart pre {
	font-family: courier new, courier, monospace
}

#tstart small {
	font-size: 12px
}

#tstart ul, #tstart ol {
	list-style: none
}

#tstart a {
	text-decoration: none
}

#tstart sup {
	vertical-align: text-top
}

#tstart sub {
	vertical-align: text-bottom
}

#tstart legend {
	color: #000
}

#tstart fieldset, #tstart img {
	border: 0;
	margin: 0;
	float: none
}

#tstart button, #tstart input, #tstart select {
	font-size: 100%
}

#tstart .hidden, #tstart .tstart-hidden {
	display: none !important
}

#tstart .invisible, #tstart .tstart-invisible {
	visibility: hidden !important
}

#tstart {
	position: fixed;
	right: 0;
	bottom: 0;
	z-index: 100000;
	_position: absolute;
	height: 28px;
	color: #3e3e3e;
	text-align: left;
	_right: 1px
}

#tstart .tstart-toolbar {
	height: 28px;
	float: right;
	right: 0
}

#tstart a {
	color: #000;
	text-decoration: none
}

#tstart .tstart-bd {
	height: 28px;
	margin: 0
}

#tstart .tstart-areas {
	position: relative;
	zoom: 1;
	height: 28px;
	line-height: 28px;
	float: right;
}

#tstart .tstart-item {
	position: relative;
	zoom: 1;
	float: left;
	display: block;
	height: 28px;
}

#tstart .tstart-link-item a {
	float: left;
	padding: 0 8px
}

#tstart a:hover {
	color: #f60;
	text-decoration: underline
}

#tstart .tstart-normal-trigger, #tstart .tstart-drop-trigger {
	cursor: pointer;
	padding: 0 8px
}

#tstart .i-arrow {
	width: 5px;
	height: 3px;
	position: absolute;
	right: 0;
	top: 12px;
	background-position: -134px -59px
}

#tstart .tstart-item-active .i-arrow {
	display: none
}

#tstart i {
	background: 0;
	display: inline-block;
	height: auto;
	line-height: 1;
	margin: auto;
	overflow: hidden;
	text-indent: 0;
	vertical-align: middle;
	width: auto
}

#tstart-plugin-switch {
	height: 25px
}

#tstart-plugin-switch .toggle-area {
	cursor: pointer
}

#tstart-plugin-switch a {
	display: none
}

#tstart-plugin-switch .tstart-item-icon {
	display: inline-block;
	width: 19px;
	height: 25px;
	line-height: 100px;
	overflow: hidden;
	zoom: 1;
	background-position: 0 -59px;
	vertical-align: middle;
	font-size: 0;
	margin-top: 0;
	vertical-align: top
}

.tstart-minimized #tstart-plugin-switch .tstart-item-icon {
	background-position: -18px -59px
}

#tstart .switch-mini-tip {
	display: none;
	width: 135px;
	height: 28px;
	overflow: hidden;
	position: absolute;
	top: -30px;
	margin-left: -160px;
	background-position: 0 -94px
}

.tstart-minimized .hover .switch-mini-tip {
	display: inline-block !important
}

.tstart-minimized .switch-mini {
	display: inline-block !important;
	width: 17px;
	height: 17px;
	overflow: hidden;
	vertical-align: middle;
	margin: 0 5px;
	background-position: -47px -59px;
	*margin-top: 5px
}

.tstart-minimized .hover .switch-mini {
	background-position: -69px -59px
}

.tstart-minimized .tstart-bd {
	float: right;
	width: auto;
	display: inline
}

.tstart-minimized .tstart-areas {
	float: left;
	background: green
}

.tstart-minimized .tstart-item {
	display: none
}

.tstart-minimized #tstart-plugin-tdog, .tstart-minimized #tstart-plugin-settings,
	.tstart-minimized #tstart-plugin-switch {
	display: block
}

.tstart-news-tip {
	position: absolute;
	bottom: 0;
	left: 0
}

#tstart-plugin-news .t-msg-count {
	position: absolute;
	bottom: -30px;
	right: 5px;
	color: #fff;
	display: inline-block;
	text-align: right;
	*width: 132px
}

#tstart-plugin-news .t-msg-count .tip {
	display: inline-block;
	text-decoration: none;
	border: 1px solid #fbce67;
	background-color: #fee195;
	color: #3f4537;
	height: 21px;
	line-height: 21px;
	white-space: nowrap;
	padding: 0 15px;
	font-weight: 400;
	background-repeat: repeat-x;
	background-position: 0 -134px
}

#tstart-plugin-news .t-msg-count em {
	color: #ff4300;
	font-weight: 400;
	text-decoration: none;
	font-style: normal;
	margin: 0 3px
}

#tstart-plugin-news .t-msg-count .arrow {
	width: 11px;
	height: 6px;
	right: 10px;
	top: 23px;
	position: absolute;
	z-index: 2;
	background-position: -112px -59px
}

#tstart .tstart-item-active .t-msg-count {
	visibility: hidden
}

#tstart .msg-count, #tstart .msg-count span {
	display: inline-block;
	height: 22px
}

#tstart .msg-count {
	padding-right: 5px;
	background-position: right -32px;
	position: absolute;
	top: -15px;
	right: 0;
	color: #fff;
	font-weight: 600;
	line-height: 16px
}

#tstart .msg-count span {
	padding-left: 5px;
	background-position: 0 0
}

#tstart .tstart-item-active .msg-count {
	display: none
}

#tstart-plugin-myapps .tip-intro {
	background: none repeat scroll 0 0 #ffffc5;
	border: 1px solid #d4d4d4;
	height: 24px;
	left: 0;
	line-height: 23px;
	overflow: visible;
	position: absolute;
	top: -30px;
	width: 290px;
	z-index: 60
}

#tstart-plugin-myapps .tip-intro i, #tstart-plugin-myapps .tip-intro .close,
	#tstart-plugin-myapps .tip-intro s {
	background: url1(// img.alicdn.com/ tps/ i4/ T1m4KGXi8jXXXXXXXX-120-213.png)
		no-repeat 0 0
}

#tstart-plugin-myapps .tip-intro i, #tstart-plugin-myapps .tip-intro .close
	{
	width: 23px;
	height: 23px;
	line-height: 23px;
	display: inline-block
}

#tstart-plugin-myapps .tip-intro i {
	background-position: 0 -190px
}

#tstart-plugin-myapps .tip-intro .close {
	background-position: -23px -190px;
	display: block;
	overflow: hidden;
	position: absolute;
	right: 0;
	text-indent: -1000px;
	top: 0;
	cursor: pointer
}

#tstart-plugin-myapps .tip-intro s {
	background-position: -46px -190px;
	display: block;
	height: 13px;
	left: 20px;
	position: absolute;
	top: 24px;
	width: 23px;
	z-index: 100
}

#tstart-plugin-myapps .tip-intro a {
	color: #004d99
}

#tstart .icon-new {
	width: 21px;
	height: 16px;
	position: absolute;
	top: -7px;
	right: 0;
	background-position: -96px -76px
}

#tstart .tstart-item-active .tip-new {
	display: none
}

#tstart .tstart-drop-panel {
	position: absolute
}
</style>
<link rel="stylesheet" href="${APP_PATH }/static/css/sousuo/tstart.css">
<link rel="stylesheet" href="${APP_PATH }/static/css/sousuo/tdog.css">
</head>

<body class="pg">
<div class="page">
		<!--dingtianB begin -->

		<!--dingtianB end -->
		<div id="mallPage" class=" mallist tmall- page-not-market ">
			<style>
button {
	border-radius: 0;
}
</style>
			<!--from fragment-->
			<%@ include file="/WEB-INF/view/header.jsp" %>
			<div id="header" class=" header-list-app" data-spm="a2226n0">
				<div class="headerLayout">
					<div class="headerCon ">
						<h1 id="mallLogo">
						</h1>

						<div class="header-extra">
							<div class="header-banner">

								<style>
#mallPage .header-extra .header-banner {
	height: 80px !important;
}

#mallPage .header-extra .header-banner img {
	cursor: default;
}
</style>
							</div>
							<div id="mallSearch" class="mall-search">
								<form name="searchTop" style="border: solid #00c3f5;"
									action="//list.tmall.com/search_product.htm"
									class="mallSearch-form clearfix" target="_top"
									accept-charset="gbk">
									<fieldset>
										<legend>天猫搜索</legend>
										<div class="mallSearch-input clearfix">
											<label for="mq" style="display: none;">搜索 天猫 商品/品牌/店铺</label>

											<div class="s-combobox" id="s-combobox-660">
												<div class="s-combobox-input-wrap">
													<input type="text" name="q" accesskey="s"
														value="${key }" id="mq"  class="s-combobox-input">
												</div>
												<label for="mq" class="s-combobox-placeholder"
													style="color: rgb(102, 102, 102); display: none; visibility: hidden;">搜索
													天猫 商品/品牌/店铺</label>
											</div>
											<button type="submit" style="background-color: #00c3f5">
												搜索
											</button>
											<input id="J_Type" type="hidden" name="type" value="p">
											<input id="J_MallSearchStyle" type="hidden" name="style"
												value=""> <input id="J_Cat" type="hidden" name="cat"
												value="all"> <input type="hidden" name="vmarket"
												value="">
										</div>
									</fieldset>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="content">
				<div class="main">
					<div class="filter clearfix filter-fix" id="J_Filter"
						data-spm="a220m.1000858.1000724">
						<a class="fSort fSort-cur"
							href="?q=%CD%E2%CC%D7&amp;sort=s&amp;style=g&amp;from=mallfp..pc_1_searchbutton&amp;spm=875.7931836/B.a2227oh.d100#J_Filter"
							title="点击后恢复默认排序">综合<i
							class="f-ico-arrow-d"></i></a> <a class="fSort"
							href="?q=%CD%E2%CC%D7&amp;sort=rq&amp;style=g&amp;from=mallfp..pc_1_searchbutton&amp;spm=875.7931836/B.a2227oh.d100#J_Filter"
							title="点击后按人气从高到低">人气<i
							class="f-ico-arrow-d"></i></a>
						<!--Test   -->
						<!--Test s  -->
						<a class="fSort"
							href="?q=%CD%E2%CC%D7&amp;sort=new&amp;style=g&amp;from=mallfp..pc_1_searchbutton&amp;spm=875.7931836/B.a2227oh.d100#J_Filter"
							>新品<i class="f-ico-arrow-d"></i></a>
						<a class="fSort"
							href="?q=%CD%E2%CC%D7&amp;sort=d&amp;style=g&amp;from=mallfp..pc_1_searchbutton&amp;spm=875.7931836/B.a2227oh.d100#J_Filter"
							title="点击后按月销量从高到低">销量<i
							class="f-ico-arrow-d"></i></a> <a class="fSort"
							href="?q=%CD%E2%CC%D7&amp;sort=p&amp;style=g&amp;from=mallfp..pc_1_searchbutton&amp;spm=875.7931836/B.a2227oh.d100#J_Filter"
							title="点击后按价格升序">价格<i
							class="f-ico-triangle-mt"></i><i class="f-ico-triangle-mb"></i></a>
						<p class="ui-page-s">
							<b class="ui-page-s-len">1/80</b> <b class="ui-page-s-prev"
								title="上一页">&lt;</b> <a
								href="?s=60&amp;q=%CD%E2%CC%D7&amp;sort=s&amp;style=g&amp;from=mallfp..pc_1_searchbutton&amp;spm=875.7931836/B.a2227oh.d100&amp;type=pc#J_Filter"
								class="ui-page-s-next"
								title="下一页">&gt;</a>
						</p>
					</div>
					<div id="J_FilterPlaceholder" style="height: 54px;"></div>
					<div class="view  " id="J_ItemList"
						data-spm="a220m.1000858.1000725" data-area="杭州"
						data-atp-a="{p},{id},,,spu,1,spu,{user_id}"
						data-atp-b="{p},{id},,,spu,2,spu,{user_id}">
						<c:forEach items="${pageInfo.list }" var="commodity">
						<div class="product  " data-id="585067159409"
							data-atp="a!,,50010158,,,,,,,,">
							<div class="product-iWrap">
								<div class="productImg-wrap">
									<a
										href="${APP_PATH }/product/${commodity.id }"
										class="productImg" target="_blank"> 
										<img src="${commodity.coverImage }">
									</a>
								</div>
								<div class="productThumb clearfix" style="width: 210px; height: 39px"></div>
								<p class="productPrice">
									<em title="${commodity.minPrice }"><b>￥</b>${commodity.minPrice }</em>
								</p>
								<p class="productTitle">
									<a href="${APP_PATH }/product/${commodity.id }" target="_blank" title="${commodity.title }"> 
									${commodity.title } 
									</a>
								</p>

								<div class="productShop">
									<a class="productShop-name" target="_blank"> ${commodity.seller.storeName } </a>
								</div>
								<p class="productStatus">
									<span>月销量 <em>${commodity.monthSale }</em></span> <span>评价 <a>${commodity.commentQuantity }</a></span> <span data-icon="small"
										class="ww-light ww-small"><a class="ww-inline ww-online"
										title="点此可以直接和卖家交流"><span>在线服务</span></a>
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
							<b class="ui-page-num"> 
								<c:if test="${pageInfo.hasPreviousPage }">
									<a class="ui-page-prev" href="${APP_PATH }/search_product?key=${key }&page=${pageInfo.prePage }">上一页</a>
								</c:if>
								<c:if test="${!pageInfo.hasPreviousPage }">
									<b class="ui-page-prev">上一页</b>
								</c:if>
								<c:forEach items="${pageInfo.navigatepageNums }" var="pageNum">
								<c:if test="${pageInfo.pageNum == pageNum }">
								<b class="ui-page-cur">${pageNum }</b>
								</c:if>
								<c:if test="${pageInfo.pageNum != pageNum }">
								<a href="${APP_PATH }/search_product?key=${key }&page=${pageNum }">${pageNum }</a> 
								</c:if>
								</c:forEach>
								<c:if test="${pageInfo.hasNextPage }">
									<a class="ui-page-next" href="${APP_PATH }/search_product?key=${key }&page=${pageInfo.nextPage }">下一页</a>
								</c:if>
								<c:if test="${!pageInfo.hasNextPage }">
									<b class="ui-page-next">下一页</b>
								</c:if>
							</b> 
							<b class="ui-page-skip">
								<form action="${APP_PATH }/search_product" method="get">								
									共${pageInfo.pages }页，到第
									<input type="text" name="page" class="ui-page-skipTo" size="3" value="${pageInfo.pageNum }">页
									<input type="hidden" name="key" value=${key }>
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
</body>
</html>
