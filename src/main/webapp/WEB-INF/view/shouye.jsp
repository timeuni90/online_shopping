<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link href="${APP_PATH }/static/css/shouye/a_005.css" rel="stylesheet">
<link href="${APP_PATH }/static/css/shouye/a.css" rel="stylesheet">
<link href="${APP_PATH }/static/css/shouye/a_002.css" rel="stylesheet">
<link href="${APP_PATH }/static/css/open-iconic.min.css" rel="stylesheet">

<script src="${APP_PATH }/static/js/jquery-3.2.1.min.js"></script>
<script>
	var APP_PATH = "${APP_PATH}";
</script>
<title>首页</title>
</head>
<body class="w1230" style="">
	
	<div id="mallPage" class="mui-global-biz-mallfp  ">
		<!--from fragment-->
		<%@ include file="/WEB-INF/view/header.jsp" %>
		<div id="header" data-spm="a2226n0"
			data-spm-anchor-id="875.7931836/B.0.a2226n0.66144265Vx5b6f">
			<div class="headerLayout">
				<div class="headerCon">
					<h1 id="mallLogo">
						<span class="mlogo"> <a href="https://www.tmall.com/"
							title="天猫Tmall.com">天猫Tmall.com</a>

						</span>

					</h1>
					<div class="header-extra"
						data-spm-anchor-id="875.7931836/B.a2226n0.i0.66144265Vx5b6f">

						<div class="header-banner">

							<div></div>

						</div>

						<div id="mallSearch" class="mall-search">
							<form name="searchTop" style="border: solid #00c3f5;"
								action="//list.tmall.com/search_product.htm"
								class="mallSearch-form clearfix" target="_top"
								acceptcharset="gbk" accept-charset="gbk">
								<fieldset>
									<legend>天猫搜索</legend>
									<div class="mallSearch-input clearfix">
										<label for="mq" style="visibility: visible; display: none;">搜索商品/店铺</label>
										<div class="s-combobox" id="s-combobox-137"
											aria-pressed="false">
											<div class="s-combobox-input-wrap">
												<input type="text" name="q" accesskey="s" autocomplete="off"
													x-webkit-speech="" x-webkit-grammar="builtin:translate"
													id="mq" class="s-combobox-input" role="combobox"
													aria-haspopup="true" title="请输入搜索文字" aria-label="请输入搜索文字"
													data-spm-anchor-id="875.7931836/B.0.i0.66144265Vx5b6f">
											</div>
											<label for="mq" class="s-combobox-placeholder"
												style="color: rgb(102, 102, 102); visibility: visible;">搜索  商品/店铺</label>
										</div>
										<button type="submit" style="background-color: #00c3f5;">
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
					<div class="j_logo logo-con" data-spm="2015002">
						<!--<img class="tmall-logo-img" src="static/images/shouye/logo.png" style="margin: 1px auto;display:block" width="240px" height="130px">-->
					</div>

					<div class="category-type" style="background-color: #00c3f5;">
						<i class="oi fp-iconfont" data-glyph="menu" aria-hidden="true"></i>
						<div class="text">商品分类</div>
					</div>

					<div class="category-tab-content">
						<div class="nav-con j_tabPannel category-tab-pannel pannel-normal">
							<ul class="normal-nav clearfix">

								<li class="j_MenuNav nav-item nav-item-0"
									data-spm="110"><i class="oi icon"
									data-glyph="heart" aria-hidden="true"></i><i
									class="dot fp-iconfont"></i> <a
									href="#">女装</a>

									/ <a
									href="#">内衣</a>

									<b class="arrow"></b></li>

								<li class="j_MenuNav nav-item nav-item-1"
									data-spm="26,37"><i class="oi icon"
									data-glyph="globe" aria-hidden="true"></i><i
									class="dot fp-iconfont"></i> <a
									href="#">男装</a>

									/ <a
									href="#">运动户外</a>

									<b class="arrow"></b></li>

								<li class="j_MenuNav nav-item nav-item-2"
									data-spm="category2016012"><i class="oi icon"
									data-glyph="dashboard" aria-hidden="true"></i><i
									class="dot fp-iconfont"></i> <a
									href="#">女鞋</a>

									/ <a
									href="#">男鞋</a>

									/ <a
									href="#">箱包</a>

									<b class="arrow"></b></li>

								<li class="j_MenuNav nav-item nav-item-3"
									data-spm="category2016013"><i class="oi icon"
									data-glyph="brush" aria-hidden="true"></i><i
									class="dot fp-iconfont"></i> <a
									href="#">美妆</a>

									/ <a
									href="#">个人护理</a>

									<b class="arrow"></b></li>

								<li class="j_MenuNav nav-item nav-item-4"
									data-spm="category2016014"><i class="oi icon"
									data-glyph="clock" aria-hidden="true"></i><i
									class="dot fp-iconfont"></i> <a
									href="#">腕表</a>

									/ <a
									href="#">眼镜</a>

									/ <a
									href="#">珠宝饰品</a>

									<b class="arrow"></b></li>

								<li class="j_MenuNav nav-item nav-item-5"
									data-spm="category2016015"><i class="oi icon"
									data-glyph="phone" aria-hidden="true"></i><i
									class="dot fp-iconfont"></i> <a
									href="#">手机</a>

									/ <a
									href="#">数码</a>

									/ <a
									href="#">电脑办公</a>

									<b class="arrow"></b></li>

								<li class="j_MenuNav nav-item nav-item-6"
									data-spm="category2016016"><i class="oi icon"
									data-glyph="map" aria-hidden="true"></i><i
									class="dot fp-iconfont"></i> <a
									href="#">母婴玩具</a>

									<b class="arrow"></b></li>

								<li class="j_MenuNav nav-item nav-item-7"
									data-spm="category2016017"><i class="oi icon"
									data-glyph="dial" aria-hidden="true"></i><i
									class="dot fp-iconfont"></i> <a
									href="#">零食</a>

									/ <a
									href="#">茶酒</a>

									/ <a
									href="#">进口食品</a>

									<b class="arrow"></b></li>

								<li class="j_MenuNav nav-item nav-item-8"
									data-spm="category2016018"><i class="oi icon"
									data-glyph="laptop" aria-hidden="true"></i><i
									class="dot fp-iconfont"></i> <a
									href="#">生鲜水果</a>

									<b class="arrow"></b></li>

								<li class="j_MenuNav nav-item nav-item-9"
									data-spm="category2016019"><i class="oi icon"
									data-glyph="tablet" aria-hidden="true"></i><i
									class="dot fp-iconfont"></i> <a
									href="#">大家电</a>

									/ <a
									href="#">生活电器</a>

									<b class="arrow"></b></li>

								<li class="j_MenuNav nav-item nav-item-10"
									data-spm="category2016020"><i class="oi icon"
									data-glyph="spreadsheet" aria-hidden="true"></i><i
									class="dot fp-iconfont"></i> <a
									href="#">家具建材</a>

									<b class="arrow"></b></li>

								<li class="j_MenuNav nav-item nav-item-11"
									data-spm="category2016021"><i class="oi icon"
									data-glyph="battery-empty" aria-hidden="true"></i><i
									class="dot fp-iconfont"></i> <a
									href="#">汽车</a>

									/ <a
									href="#">配件</a>

									/ <a
									href="#">用品</a>

									<b class="arrow"></b></li>

								<li class="j_MenuNav nav-item nav-item-12"
									data-spm="category2016022"><i class="oi icon"
									data-glyph="badge" aria-hidden="true"></i><i
									class="dot fp-iconfont"></i> <a
									href="#">家纺</a>

									/ <a
									href="#">家饰</a>

									/ <a
									href="#">鲜花</a>

									<b class="arrow"></b></li>

								<li class="j_MenuNav nav-item nav-item-13"
									data-spm="category2016023"><i class="oi icon"
									data-glyph="command" aria-hidden="true"></i><i
									class="dot fp-iconfont"></i> <a
									href="#">医药保健</a>

									<b class="arrow"></b></li>

								<li class="j_MenuNav nav-item nav-item-14"
									data-spm="category2016024"><i class="oi icon"
									data-glyph="flag" aria-hidden="true"></i><i
									class="dot fp-iconfont"></i> <a
									href="#">厨具</a>

									/ <a
									href="#">收纳</a>

									/ <a
									href="#">宠物</a>

									<b class="arrow"></b></li>

								<li class="j_MenuNav nav-item nav-item-15"
									data-spm="category2016025"><i class="oi icon"
									data-glyph="pin" aria-hidden="true"></i><i
									class="dot fp-iconfont"></i> <a
									href="#">图书音像</a>

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

							<div class="main-banner slider-pannel"
								style="background-color: rgb(32, 155, 255); position: absolute; z-index: 0; opacity: 0; display: none;">

								<div class="normal main-banner-outcon">
									<!--加两个容器是为了定位，给左边的导航留出位置，否则背景无法平铺，第二个容器无法使用margin居中-->
									<div class="main-banner-con">
										<div class="main-banner-con2"
											style="background-color: #209bff;">
											<a tabindex="-1"
												class=" j_needExposure   j_needGoldExposure "
												data-exposure="" data-gold-exposure="" data-spm="d1"
												href="https://pages.tmall.com/wow/a/act/tmall/dailygroup/45/wupr?trackInfo=20160815100101;486608834840;239670;586642431209;3;239670_586642431209;1007.14152.68669.100200300000000;942b9a8c-ce39-4e81-9348-4c2203b42095;1;0;10000002&amp;item_id=586642431209&amp;pvid=942b9a8c-ce39-4e81-9348-4c2203b42095&amp;pos=1&amp;activity_id=239670&amp;wh_pid=daily-158582&amp;acm=07055.1003.1.2519102&amp;scm=1003.1.20160815.OTHER_0_5595930">
												<b class="j_bigBanner big-banner " data-src="" style=""></b>
											</a> <a tabindex="-1"
												class="j_smallBanner small-banner0  j_needExposure   j_needGoldExposure "
												href="https://pages.tmall.com/wow/a/act/tmall/dailygroup/127/wupr?trackInfo=20160815100201;478306044040;237245;550193007128;3;237245_550193007128;1007.14152.68669.100200300000000;942b9a8c-ce39-4e81-9348-4c2203b42095;1;0;10000002&amp;item_id=550193007128&amp;pvid=942b9a8c-ce39-4e81-9348-4c2203b42095&amp;pos=5&amp;activity_id=237245&amp;wh_pid=daily-158628&amp;acm=07055.1003.1.2519102&amp;scm=1003.1.20160815.OTHER_0_5592170"
												data-exposure="" data-gold-exposure=""> <img alt=""
												src="shouye_files/O1CN01TNJeHc1CDZ7fp31Lj_47-2-luban.webp"
												width="100%">
											</a> <a tabindex="-1"
												class="j_smallBanner small-banner1  j_needExposure   j_needGoldExposure "
												href="https://www.tmshare123.com/wow/car/21492/yanghurichang?wh_weex=true&amp;trackInfo=20160815100201;485777242140;239208;585545741245;3;239208_585545741245;1007.14152.68669.100200300000000;942b9a8c-ce39-4e81-9348-4c2203b42095;2;0;10000002&amp;wh_biz=tm&amp;item_id=585545741245&amp;pvid=942b9a8c-ce39-4e81-9348-4c2203b42095&amp;pos=6&amp;host=tmshare123.com&amp;activity_id=239208&amp;from=zebra&amp;acm=07055.1003.1.2519102&amp;scm=1003.1.20160815.OTHER_0_5596958"
												data-exposure="" data-gold-exposure=""> <img alt=""
												src="shouye_files/O1CN01DsuxTI1CrPaDANivP_134-2-lubanu.webp"
												width="100%">
											</a>

										</div>
									</div>
								</div>
							</div>

							<div class="main-banner slider-pannel j_tanxContainer"
								style="background: rgb(232, 232, 232) none repeat scroll 0% 0%; position: absolute; z-index: 0; opacity: 0; display: none;">
								<a data-spm="d2"
									href="https://click.mz.simba.taobao.com/ecpm?e=%2FEsk6T309Xm7plCi1eKI7euOs9sEGi%2B%2BiB9S4MMaQcoPoa3n%2F8Wh88WpogKmQjUpOMF51PBpbYH%2F6eIJKzWyc2RV5VLNsTWptbR9sxq9q4jPdxtGLmpJMKiTZU1Z7A7u9iFUaGvyKCGT5fzkODgSz1197sOzUjzt4jY1ac3z3kmf52u0Wo2aiuDXFqBoDmUIT6v%2FOaLBS9GvKuimC%2FKkq6OJrRv4yfWFydZpd%2FshJS5ZrXYPtoTW%2FI%2FBtLMureRddUGpGUcuQ1ftq01Ne8QPzstkGj%2BkpRm4SIcQ2gW2pOEW%2BA9Yy2BIe6jHUabSKFb5gBiBUvDSAQFF%2FMtfArTlb8c3GltbsAwrJJ1R8TJ8bf0Yx%2B5SvdQ0aV%2Be1pPfZzoa156lWIShdHeKH8M8ztwTcelrPXHrKtGk&amp;u=https%3A%2F%2Fwww.tmall.com%2Fwow%2Fbrand%2Fact%2Ffashion%3Facm%3Dlb-zebra-2386-265936.1003.4.410386%26scm%3D1003.4.lb-zebra-2386-265936.OTHER_1_410386&amp;k=417">
									<div class="tanx-banner-con">
										<img class="tanx-banner"
											src="shouye_files/TB1W4nPJFXXXXbSXpXXSutbFXXX.jpg">
									</div>
								</a> <img class="ad-mark"
									src="shouye_files/TB1c_LDLXXXXXXoXpXXXXXXXXXX-24-14.png">

							</div>

							<div class="main-banner slider-pannel"
								style="background-color: rgb(255, 255, 255); position: absolute; z-index: 0; opacity: 0; display: none;">

								<div class="normal main-banner-outcon">
									<!--加两个容器是为了定位，给左边的导航留出位置，否则背景无法平铺，第二个容器无法使用margin居中-->
									<div class="main-banner-con">
										<div class="main-banner-con2"
											style="background-color: #ffffff;">
											<a tabindex="-1"
												class=" j_needExposure   j_needGoldExposure "
												data-exposure="" data-gold-exposure="" data-spm="d3"
												href="https://pages.tmall.com/wow/tmall-3c/act/shoubiao2?trackInfo=20160815100101;48237725574;238139;579085642909;3;238139_579085642909;1007.14152.68669.100200300000000;942b9a8c-ce39-4e81-9348-4c2203b42095;2;0;10000002&amp;wh_biz=tm&amp;item_id=579085642909&amp;pvid=942b9a8c-ce39-4e81-9348-4c2203b42095&amp;pos=2&amp;activity_id=238139&amp;acm=07055.1003.1.2519102&amp;scm=1003.1.20160815.OTHER_0_5597283">
												<b class="j_bigBanner big-banner " data-src="" style=""></b>
											</a> <a tabindex="-1"
												class="j_smallBanner small-banner0  j_needExposure   j_needGoldExposure "
												href="https://pages.tmall.com/wow/act/18616/apple?wh_weex=true&amp;trackInfo=20160815100201;458912940640;231381;576391090958;3;231381_576391090958;1007.14152.68669.100200300000000;942b9a8c-ce39-4e81-9348-4c2203b42095;3;0;10000002&amp;wh_biz=tm&amp;item_id=576391090958&amp;pvid=942b9a8c-ce39-4e81-9348-4c2203b42095&amp;pos=7&amp;activity_id=231381&amp;acm=07055.1003.1.2519102&amp;scm=1003.1.20160815.OTHER_0_5599156"
												data-exposure="" data-gold-exposure=""> <img alt=""
												src="shouye_files/O1CN01833LZK1CUVlBLTkwY_84-2-luban.webp"
												data-src="">
											</a> <a tabindex="-1"
												class="j_smallBanner small-banner1  j_needExposure   j_needGoldExposure "
												href="https://pages.tmall.com/wow/tmall-3c/act/shoubiao2?trackInfo=20160815100201;47789036304;237226;576700291965;3;237226_576700291965;1007.14152.68669.100200300000000;942b9a8c-ce39-4e81-9348-4c2203b42095;4;0;10000002&amp;wh_biz=tm&amp;item_id=576700291965&amp;pvid=942b9a8c-ce39-4e81-9348-4c2203b42095&amp;pos=8&amp;activity_id=237226&amp;acm=07055.1003.1.2519102&amp;scm=1003.1.20160815.OTHER_0_5597228"
												data-exposure="" data-gold-exposure=""> <img alt=""
												src="shouye_files/O1CN01TUDezd1DG8y5WNYCj_188-2-luban.webp"
												data-src="" width="100%">
											</a>

										</div>
									</div>
								</div>
							</div>

							<div class="main-banner slider-pannel j_tanxContainer"
								style="background: rgb(232, 232, 232) none repeat scroll 0% 0%; position: absolute; z-index: 1; opacity: 1; display: block;">
								<a data-spm="d4"
									href="https://click.mz.simba.taobao.com/ecpm?e=rU6PSrX1sJO7plCi1eKI7euOs9sEGi%2B%2BttUodpfholA425aMrkNpku3jlAfWpGg2OMF51PBpbYF6rGKtMBt8C8R92%2BP%2FC62ktbR9sxq9q4jPdxtGLmpJMKeFzZhjx1TouB4VMot2Z8qNmOOEIouSXIOBnwnLo8Fb0G7opvdXLoaf52u0Wo2aiuDXFqBoDmUIT6v%2FOaLBS9GvKuimC%2FKkq6OJrRv4yfWFydZpd%2FshJS5ZrXYPtoTW%2FI%2FBtLMureRddUGpGUcuQ1ftq01Ne8QPzstkGj%2BkpRm4SIcQ2gW2pOEW%2BA9Yy2BIe%2BEdDbKSe4T%2BNwd7peiSLZtF%2FMtfArTlb8c3GltbsAwrgSpT1pDWk1wYx%2B5SvdQ0aV%2Be1pPfZzoa156lWIShdHeKH8M8ztwTcelrPXHrKtGk&amp;u=https%3A%2F%2Falimarket.tmall.com%2Fmarkets%2Falimama%2Fmingdian&amp;k=417">
									<div class="tanx-banner-con">
										<img class="tanx-banner"
											src="shouye_files/TB1_JXrLVXXXXbZXVXXSutbFXXX.jpg">
									</div>
								</a> <img class="ad-mark"
									src="shouye_files/TB1c_LDLXXXXXXoXpXXXXXXXXXX-24-14.png">

							</div>

							<div class="main-banner slider-pannel"
								style="background-color: rgb(255, 255, 255); position: absolute; z-index: 0; opacity: 0; display: none;">

								<div class="normal main-banner-outcon">
									<!--加两个容器是为了定位，给左边的导航留出位置，否则背景无法平铺，第二个容器无法使用margin居中-->
									<div class="main-banner-con">
										<div class="main-banner-con2"
											style="background-color: #FFFFFF;">
											<a tabindex="-1"
												class=" j_needExposure   j_needGoldExposure "
												data-exposure="" data-gold-exposure="" data-spm="d5"
												href="https://pages.tmall.com/wow/a/act/tmall/dailygroup/118/wupr?trackInfo=20160815100101;487020642240;239755;579756540806;3;239755_579756540806;1007.14152.68669.100200300000000;942b9a8c-ce39-4e81-9348-4c2203b42095;3;0;10000002&amp;item_id=579756540806&amp;pvid=942b9a8c-ce39-4e81-9348-4c2203b42095&amp;pos=3&amp;activity_id=239755&amp;wh_pid=daily-158620&amp;acm=07055.1003.1.2519102&amp;scm=1003.1.20160815.OTHER_0_5600115">
												<b class="j_bigBanner big-banner " data-src=""></b>
											</a> <a tabindex="-1"
												class="j_smallBanner small-banner0  j_needExposure   j_needGoldExposure "
												href="https://pages.tmall.com/wow/a/act/tmall/dailygroup/108/wupr?trackInfo=20160815100201;486327520140;239413;539392146141;3;239413_539392146141;1007.14152.68669.100200300000000;942b9a8c-ce39-4e81-9348-4c2203b42095;5;0;10000002&amp;item_id=539392146141&amp;pvid=942b9a8c-ce39-4e81-9348-4c2203b42095&amp;pos=9&amp;activity_id=239413&amp;wh_pid=daily-158811&amp;acm=07055.1003.1.2519102&amp;scm=1003.1.20160815.OTHER_0_5589893"
												data-exposure="" data-gold-exposure=""> <img alt=""
												src="shouye_files/O1CN01KG69Uc1D6WebTUNW5_167-2-lubanu.webp"
												data-src="" width="100%">
											</a> <a tabindex="-1"
												class="j_smallBanner small-banner1  j_needExposure   j_needGoldExposure "
												href="https://pages.tmall.com/wow/a/act/tmall/dailygroup/45/wupr?trackInfo=20160815100201;-1;239725;-1;-1;-1;1007.14152.68669.100200300000000;942b9a8c-ce39-4e81-9348-4c2203b42095;6;0;null&amp;item_id=-1&amp;pvid=942b9a8c-ce39-4e81-9348-4c2203b42095&amp;pos=10&amp;activity_id=239725&amp;wh_pid=daily-158766&amp;acm=07055.1003.1.2519102&amp;scm=1003.1.20160815.OTHER_0_5598833"
												data-exposure="" data-gold-exposure=""> <img alt=""
												src="shouye_files/O1CN01Xn2ipT1Cxp81Zr9As_148-2-lubanu.webp"
												data-src="" width="100%">
											</a>

										</div>
									</div>
								</div>
							</div>

							<div class="main-banner slider-pannel"
								style="background-color: rgb(218, 0, 61); position: absolute; z-index: 0; opacity: 0; display: none;">

								<div class="normal main-banner-outcon">
									<!--加两个容器是为了定位，给左边的导航留出位置，否则背景无法平铺，第二个容器无法使用margin居中-->
									<div class="main-banner-con">
										<div class="main-banner-con2"
											style="background-color: #DA003D;">
											<a tabindex="-1"
												class=" j_needExposure   j_needGoldExposure "
												data-exposure="" data-gold-exposure="" data-spm="d6"
												href="https://pages.tmall.com/wow/a/act/tmall/dailygroup/45/wupr?trackInfo=20160815100101;487141578340;239798;523745239018;3;239798_523745239018;1007.14152.68669.100200300000000;942b9a8c-ce39-4e81-9348-4c2203b42095;4;0;10000002&amp;item_id=523745239018&amp;pvid=942b9a8c-ce39-4e81-9348-4c2203b42095&amp;pos=4&amp;activity_id=239798&amp;wh_pid=daily-158766&amp;acm=07055.1003.1.2519102&amp;scm=1003.1.20160815.OTHER_0_5598833">
												<b class="j_bigBanner big-banner " data-src=""></b>
											</a> <a tabindex="-1"
												class="j_smallBanner small-banner0  j_needExposure   j_needGoldExposure "
												href="https://pages.tmall.com/wow/tmall-3c/act/shoubiao2?trackInfo=20160815100201;-1;238138;-1;-1;-1;1007.14152.68669.100200300000000;942b9a8c-ce39-4e81-9348-4c2203b42095;7;0;null&amp;wh_biz=tm&amp;item_id=-1&amp;pvid=942b9a8c-ce39-4e81-9348-4c2203b42095&amp;pos=11&amp;activity_id=238138&amp;acm=07055.1003.1.2519102&amp;scm=1003.1.20160815.OTHER_0_5597283"
												data-exposure="" data-gold-exposure=""> <img alt=""
												src="shouye_files/O1CN010Ey5jg1CthYpi4hkz_139-2-luban.webp"
												data-src="" width="100%">
											</a> <a tabindex="-1"
												class="j_smallBanner small-banner1  j_needExposure   j_needGoldExposure "
												href="https://pages.tmall.com/wow/a/act/tmall/dailygroup/45/wupr?trackInfo=20160815100201;-1;239608;-1;-1;-1;1007.14152.68669.100200300000000;942b9a8c-ce39-4e81-9348-4c2203b42095;8;0;null&amp;item_id=-1&amp;pvid=942b9a8c-ce39-4e81-9348-4c2203b42095&amp;pos=12&amp;activity_id=239608&amp;wh_pid=daily-158582&amp;acm=07055.1003.1.2519102&amp;scm=1003.1.20160815.OTHER_0_5595930"
												data-exposure="" data-gold-exposure=""> <img alt=""
												src="shouye_files/O1CN01YMgvxN1Ck5FKQhIEk_118-2-luban.webp"
												data-src="" width="100%">
											</a>

										</div>
									</div>
								</div>
							</div>

						</div>
						<div class="slider-nav">

							<li class=""></li>

							<li class=""></li>

							<li class=""></li>

							<li class="selected"></li>

							<li class=""></li>

							<li class=""></li>

						</div>
					</div>

				</div>
			</div>

			<div class="j_wonderful wonderful-con" id="J_FloorCNXH">
				<h2 class="wonderful-title">
					<span class="text-ctn"> <i
						class="fp-iconfont nav-item-icon icon"></i>热门商品
					</span>
				</h2>
				<div class="module-content j_wonderfulList">

					<div data-spm="20161015">

						<ul class="wonderful-line  j_exposureExtra9 ">

							<li class="wonderful-item "><a class="card-item  "
								href="https://detail.tmall.com/item.htm?abtest=&amp;pvid=1056ca21-e901-4b82-ba56-a7edd4726af9&amp;pos=11&amp;abbucket=&amp;acm=201509290.1003.1.1286473&amp;id=17540507116&amp;scm=1007.12710.81710.100200300000000">
									<span class="item-pic"> <img src="shouye_files/TB1o.png"
										width="100%">
								</span> <span class="item-info"> <span class="item-desc">
											<em class="item-name" title="【三只松鼠_开口松子】东北手剥休闲零食特产坚果炒货新货干果">【三只松鼠_开口松子】东北手剥休闲零食特产坚果炒货新货干果</em>
									</span> <span class="item-detail"> <span class="item-price">



												<span class="mui-price  "> <i class="mui-price-rmb">¥</i>
													<span class="mui-price-integer">34</span> <span
													class="mui-price-decimal">.9</span>

											</span>

										</span>

									</span>
								</span>
							</a></li>

							<li class="wonderful-item "><a class="card-item  "
								href="https://detail.tmall.com/item.htm?abtest=&amp;pvid=1056ca21-e901-4b82-ba56-a7edd4726af9&amp;pos=12&amp;abbucket=&amp;acm=201509290.1003.1.1286473&amp;id=569727934787&amp;scm=1007.12710.81710.100200300000000">
									<span class="item-pic"> <img
										src="shouye_files/TB1r3yDC21TBuNjy0Fjwu1jyXXa.png"
										width="100%">
								</span> <span class="item-info"> <span class="item-desc">
											<em class="item-name" title="婴儿电动摇摇椅宝宝摇篮躺椅哄娃器神哄睡新生儿安抚椅抖音摇摇床">婴儿电动摇摇椅宝宝摇篮躺椅哄娃器神哄睡新生儿安抚椅抖音摇摇床</em>
									</span> <span class="item-detail"> <span class="item-price">



												<span class="mui-price  "> <i class="mui-price-rmb">¥</i>
													<span class="mui-price-integer">468</span> <span
													class="mui-price-decimal">.0</span>

											</span>

										</span>

									</span>
								</span>
							</a></li>

							<li class="wonderful-item "><a class="card-item  "
								href="https://detail.tmall.com/item.htm?abtest=&amp;pvid=1056ca21-e901-4b82-ba56-a7edd4726af9&amp;pos=13&amp;abbucket=&amp;acm=201509290.1003.1.1286473&amp;id=40584277328&amp;scm=1007.12710.81710.100200300000000">
									<span class="item-pic"> <img
										src="shouye_files/TB1K2sMpsj_B1NjSZFHwu1DWpXa.png"
										width="100%">
								</span> <span class="item-info"> <span class="item-desc">
											<em class="item-name" title="飞科毛衣服起球修剪器充电式衣物剃打刮吸去除毛球器脱毛机器家用">飞科毛衣服起球修剪器充电式衣物剃打刮吸去除毛球器脱毛机器家用</em>
									</span> <span class="item-detail"> <span class="item-price">



												<span class="mui-price  "> <i class="mui-price-rmb">¥</i>
													<span class="mui-price-integer">33</span> <span
													class="mui-price-decimal">.0</span>

											</span>

										</span>

									</span>
								</span>
							</a></li>

							<li class="wonderful-item "><a
								class="card-item  last-1366  "
								href="https://detail.tmall.com/item.htm?abtest=&amp;pvid=1056ca21-e901-4b82-ba56-a7edd4726af9&amp;pos=14&amp;abbucket=&amp;acm=201509290.1003.1.1286473&amp;id=550983427560&amp;scm=1007.12710.81710.100200300000000">
									<span class="item-pic"> <img
										src="shouye_files/O1CN01EoR0oh2JOkH9tBQoI_2-item_pic.png"
										width="100%">
								</span> <span class="item-info"> <span class="item-desc">
											<em class="item-name" title="兰蔻口红豆沙色 菁纯柔润唇膏唇彩显色持久保湿滋润正红">兰蔻口红豆沙色
												菁纯柔润唇膏唇彩显色持久保湿滋润正红</em>
									</span> <span class="item-detail"> <span class="item-price">



												<span class="mui-price  "> <i class="mui-price-rmb">¥</i>
													<span class="mui-price-integer">270</span> <span
													class="mui-price-decimal">.0</span>

											</span>

										</span>

									</span>
								</span>
							</a></li>

							<li class="wonderful-item  last"><a
								class="card-item   last-1920"
								href="https://detail.tmall.com/item.htm?abtest=&amp;pvid=1056ca21-e901-4b82-ba56-a7edd4726af9&amp;pos=15&amp;abbucket=&amp;acm=201509290.1003.1.1286473&amp;id=576396550603&amp;scm=1007.12710.81710.100200300000000">
									<span class="item-pic"> <img
										src="shouye_files/TB2kvu8tHZnBKNjSZFGXXbt3FXa_2088151283-0-item_pic.jpg"
										width="100%">
								</span> <span class="item-info"> <span class="item-desc">
											<em class="item-name" title="苏泊尔绞肉机家用电动小型不锈钢多功能搅肉料理机搅拌机碎菜打馅">苏泊尔绞肉机家用电动小型不锈钢多功能搅肉料理机搅拌机碎菜打馅</em>
									</span> <span class="item-detail"> <span class="item-price">



												<span class="mui-price  "> <i class="mui-price-rmb">¥</i>
													<span class="mui-price-integer">149</span> <span
													class="mui-price-decimal">.0</span>

											</span>

										</span>

									</span>
								</span>
							</a></li>

						</ul>

						<ul class="wonderful-line " data-code="">

							<li class="wonderful-item "><a class="card-item  "
								href="https://detail.tmall.com/item.htm?abtest=&amp;pvid=1056ca21-e901-4b82-ba56-a7edd4726af9&amp;pos=16&amp;abbucket=&amp;acm=201509290.1003.1.1286473&amp;id=559416910118&amp;scm=1007.12710.81710.100200300000000">
									<span class="item-pic"> <img
										src="shouye_files/O1CN015u9po62K0Ik7cHD2k_165229494.jpg"
										width="100%">
								</span> <span class="item-info"> <span class="item-desc">
											<em class="item-name"
											title="Robam/老板 R073X+S273X 蒸箱家用 嵌入式烤箱家用大容量烤蒸套餐">Robam/老板
												R073X+S273X 蒸箱家用 嵌入式烤箱家用大容量烤蒸套餐</em>
									</span> <span class="item-detail"> <span class="item-price">



												<span class="mui-price  "> <i class="mui-price-rmb">¥</i>
													<span class="mui-price-integer">8999</span> <span
													class="mui-price-decimal">.0</span>

											</span>

										</span>

									</span>
								</span>
							</a></li>

							<li class="wonderful-item "><a class="card-item  "
								href="https://detail.tmall.com/item.htm?abtest=&amp;pvid=1056ca21-e901-4b82-ba56-a7edd4726af9&amp;pos=17&amp;abbucket=&amp;acm=201509290.1003.1.1286473&amp;id=520167491468&amp;scm=1007.12710.81710.100200300000000">
									<span class="item-pic"> <img
										src="shouye_files/TB2_nMIr3aTBuNjSszfXXXgfpXa_725677994.png"
										width="100%">
								</span> <span class="item-info"> <span class="item-desc">
											<em class="item-name" title="威露士衣物家居除菌消毒液3x1L 送3支60ml合计3.18L">威露士衣物家居除菌消毒液3x1L
												送3支60ml合计3.18L</em>
									</span> <span class="item-detail"> <span class="item-price">



												<span class="mui-price  "> <i class="mui-price-rmb">¥</i>
													<span class="mui-price-integer">199</span> <span
													class="mui-price-decimal">.0</span>

											</span>

										</span>

									</span>
								</span>
							</a></li>

							<li class="wonderful-item "><a class="card-item  "
								href="https://detail.tmall.com/item.htm?abtest=&amp;pvid=1056ca21-e901-4b82-ba56-a7edd4726af9&amp;pos=18&amp;abbucket=&amp;acm=201509290.1003.1.1286473&amp;id=522559634246&amp;scm=1007.12710.81710.100200300000000">
									<span class="item-pic"> <img src="shouye_files/TB1.png"
										width="100%">
								</span> <span class="item-info"> <span class="item-desc">
											<em class="item-name"
											title="雅诗兰黛护肤套装 小棕瓶眼霜15ml+小棕瓶精华50ml 补水保湿修护">雅诗兰黛护肤套装
												小棕瓶眼霜15ml+小棕瓶精华50ml 补水保湿修护</em>
									</span> <span class="item-detail"> <span class="item-price">



												<span class="mui-price  "> <i class="mui-price-rmb">¥</i>
													<span class="mui-price-integer">1100</span> <span
													class="mui-price-decimal">.0</span>

											</span>

										</span>

									</span>
								</span>
							</a></li>

							<li class="wonderful-item "><a
								class="card-item  last-1366  "
								href="https://detail.tmall.com/item.htm?abtest=&amp;pvid=1056ca21-e901-4b82-ba56-a7edd4726af9&amp;pos=19&amp;abbucket=&amp;acm=201509290.1003.1.1286473&amp;id=527696492212&amp;scm=1007.12710.81710.100200300000000">
									<span class="item-pic"> <img
										src="shouye_files/TB1X0oOjCYTBKNjSZKbwu0J8pXa.png"
										width="100%">
								</span> <span class="item-info"> <span class="item-desc">
											<em class="item-name" title="欧莱雅男士面霜劲能醒肤露补水滋润保湿润肤护肤品擦脸油乳液正品">欧莱雅男士面霜劲能醒肤露补水滋润保湿润肤护肤品擦脸油乳液正品</em>
									</span> <span class="item-detail"> <span class="item-price">



												<span class="mui-price  "> <i class="mui-price-rmb">¥</i>
													<span class="mui-price-integer">99</span> <span
													class="mui-price-decimal">.0</span>

											</span>

										</span>

									</span>
								</span>
							</a></li>

							<li class="wonderful-item  last"><a
								class="card-item  last-1366   last-1920"
								href="https://detail.tmall.com/item.htm?abtest=&amp;pvid=1056ca21-e901-4b82-ba56-a7edd4726af9&amp;pos=20&amp;abbucket=&amp;acm=201509290.1003.1.1286473&amp;id=557234956025&amp;scm=1007.12710.81710.100200300000000">
									<span class="item-pic"> <img
										src="shouye_files/TB1zIhAXKf85uJjSZFtXXa4bVXa_0-item_pic.jpg"
										width="100%">
								</span> <span class="item-info"> <span class="item-desc">
											<em class="item-name"
											title="SIEMENS/西门子 WM14P2602W+WT47W5600W 10KG洗9KG烘家用洗烘套装">SIEMENS/西门子
												WM14P2602W+WT47W5600W 10KG洗9KG烘家用洗烘套装</em>
									</span> <span class="item-detail"> <span class="item-price">



												<span class="mui-price  "> <i class="mui-price-rmb">¥</i>
													<span class="mui-price-integer">12599</span> <span
													class="mui-price-decimal">.0</span>

											</span>

										</span>

									</span>
								</span>
							</a></li>

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
	<script type="text/javascript" src="static/js/shouye.js"></script>
</body>
</html>