<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% pageContext.setAttribute("APP_PATH", request.getContextPath()); %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
		<title>店铺</title>
		<link href="${APP_PATH }/static/css/store/ec.core.base.min.css" rel="stylesheet" type="text/css">
		<link href="${APP_PATH }/static/css/store/main.min.css" rel="stylesheet" type="text/css">
		
		<!-- 头部和尾部css -->
		<link href="${APP_PATH }/static/css/header/meizu_header/header.css" rel="stylesheet">
		<link rel="stylesheet" href="${APP_PATH }/static/css/myorder/layout-a2ae44047d.css">
		
		<script src="${APP_PATH }/static/js/jquery-3.2.1.min.js"></script>
	</head>
	<body class="wide huawei">
		<%@ include file="/WEB-INF/view/public/header.jsp" %>
		<style>
			.minicart-pro-item .pro-other .p-title span.p-mini-tag-suit {
				display: block;
				border-radius: 2px;
				background: #ca141d;
				color: #fff;
				width: 42px;
				height: 17px;
				line-height: 17px;
				text-align: center;
				position: absolute;
				left: 0;
				border: none;
			}
			.minicart-pro-item .pro-other li.disabled .p-title span.p-mini-tag-suit {
				color: #fff;
			}
		</style>
		<div class="top-banner" id="top-banner-block"></div>

		<div class="qq-caibei-bar hide" id="caibeiMsg">
			<div class="layout">
				<div class="qq-caibei-bar-tips" id="HeadShow"></div>
				<div class="qq-caibei-bar-userInfo" id="ShowMsg"></div>
			</div>
		</div>
		<div class="hr-10"></div>
		<div class="hr-10"></div>
		<!-- 20180620-广告位-start -->
		<!-- 20180620-广告位-end -->
		<div class="layout">
			<!-- 20140726-商品类别-start -->
			<div class="pro-cate-area">
				<!-- 20140726-商品类别-属性-start -->
				<div class="pro-cate-attr clearfix">
					<div class="p-title">分类：</div>
					<div class="p-default">
						<ul>
							<li id="first-category" class="selected" style="margin-right: 20px">
								<a href="${APP_PATH }/products?varietyId=${root.id }">${root.name }</a>
							</li>
						</ul>
					</div>

					<!-- 二级虚拟分类 -->
					<div class="p-values">
						<div class="p-operate" style="display: none;">
							<!-- 追加ClassName： more-expand more-drop -->
							<a href="javascript:;" onclick="ec.product.more(this)" class="more more-expand">更多<s></s></a>
						</div>
						<!-- 一行的高度为30px,显示n行，p-expand的高度为nx30 -->
						<div class="p-expand" style="height: auto">
							<ul class="clearfix">
								<c:forEach items="${varieties }" var="variety">
								<li <c:if test="${variety.id==varietyId }">class="selected"</c:if>>
									<a href="${APP_PATH }/products?varietyId=${variety.id }">${variety.name }</a>
								</li>
								</c:forEach>
							</ul>
						</div>
					</div>

				</div>
				<div class="pro-cate-sort clearfix">
					<div class="p-title">排序：</div>
					<div class="p-values" style="margin-left:95px;">
						<div class="p-expand">
							<ul class="clearfix">
								<c:if test="${varietyId!=null }">
									<c:set value="&varietyId=${varietyId }" var="vid"></c:set>
								</c:if>
								<c:set value="&sortType=0" var="sort1"></c:set>
								<c:if test="${sortType==0 }">
									<c:set value="&sortType=1" var="sort1"></c:set>
									<c:set value="sort-desc selected" var="sortMethod1"></c:set>
								</c:if>
								<c:if test="${sortType==1 }">
									<c:set value="&sortType=0" var="sort1"></c:set>
									<c:set value="sort-asc selected" var="sortMethod1"></c:set>
								</c:if>
								<li id="sort-3" class="${sortMethod1 }">									
									<a href="${APP_PATH }/products?unuse=1${vid }${sort1 }" class="sort-added">上架时间<s></s></a>
								</li>
								<c:set value="&sortType=2" var="sort2"></c:set>
								<c:if test="${sortType==2 }">
									<c:set value="&sortType=3" var="sort2"></c:set>
									<c:set value="sort-desc selected" var="sortMethod2"></c:set>
								</c:if>
								<c:if test="${sortType==3 }">
									<c:set value="&sortType=2" var="sort2"></c:set>
									<c:set value="sort-asc selected" var="sortMethod2"></c:set>
								</c:if>
								<li id="sort-1" class="${sortMethod2 }">
									<a href="${APP_PATH }/products?unuse=1${vid }${sort2 }" class="sort-price">价格<s></s></a>
								</li>
								<c:set value="&sortType=4" var="sort3"></c:set>
								<c:if test="${sortType==4 }">
									<c:set value="sort-desc selected" var="sortMethod3"></c:set>
								</c:if>
								<li id="sort-2" class="${sortMethod3 }">
									<a href="${APP_PATH }/products?unuse=1${vid }${sort3 }" class="sort-eval">评价<s></s></a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- 20140726-商品类别-排序-end -->

				<form id="listForm" method="post">
					<input type="hidden" id="sortField" name="sortField" value="">
					<input type="hidden" id="sortType" name="sortType" value="">
					<input type="hidden" id="prdAttrList" name="prdAttrList" value="">
					<input name="CsrfToken" type="hidden" value="fa85b9bb-2b2f-4bd0-b82f-858c61e70982"></form>

			</div>
			<!-- 20140726-商品类别-end -->

			<div class="hr-20"></div>
		</div>

		<input id="sField" type="hidden" value="3">
		<input id="sType" type="hidden" value="0">

		<div class="layout">

			<div class="channel-list">

				<div class="pro-list clearfix">
					<ul>
						<c:forEach items="${pageInfo.list }" var="commodity">
						<li>
							<div class="pro-panels">
								<p class="p-img">
									<a href="${APP_PATH }/product/${commodity.id }" title="${commodity.title }">
										<img src="${commodity.coverImage }">
									</a>
								</p>
								<p class="p-name">
									<a href="${APP_PATH }/product/${commodity.id }" title="${commodity.title }">
										<span>${commodity.title }</span>
										<span class="red"></span>
									</a>
								</p>
								<p class="p-price">
									<b>¥<fmt:formatNumber value="${commodity.minPrice }" pattern="#.00"></fmt:formatNumber></b>
								</p>
								<div class="p-button clearfix">
									<table colspan="0" border="0" rowspan="0">
										<tbody>
											<tr>
												<td>
													<a href="${APP_PATH }/product/${commodity.id }" class="p-button-cart"><span>查看</span></a>
												</td>
												<td><label class="p-button-score"><span>${commodity.commentQuantity }人评价</span></label></td>
											</tr>
										</tbody>
									</table>
								</div>

							</div>
						</li>
						</c:forEach>
					</ul>
				</div>

				<div id="list-pager-117" class="pager">
					<input id="pageTotal" value="6" type="hidden">
					<ul id="page_ul">
						<c:if test="${varietyId!=null }">
							<c:set value="&varietyId=${varietyId }" var="varietyId"></c:set>
						</c:if>
						<c:if test="${sortType!=null }">
							<c:set value="&sortType=${sortType }" var="sortType"></c:set>
						</c:if>
						<c:if test="${pageInfo.hasPreviousPage }">
						<a href="${APP_PATH }/products?unuse=1&page=${pageInfo.prePage }${sortType }${varietyId }">
							<li class="pgNext link pre">&lt;</li>
						</a>
						</c:if>
						<c:if test="${!pageInfo.hasPreviousPage }">
						<li class="pgNext link pre">&lt;</li>
						</c:if>
						<c:forEach items="${pageInfo.navigatepageNums }" var="page">
						<a href="${APP_PATH }/products?unuse=1&page=${page }${sortType }${varietyId }" title="第${page }页">
							<c:if test="${page==pageInfo.pageNum }">
							<li class="page-number link pgCurrent">${page }</li>
							</c:if>
							<c:if test="${page!=pageInfo.pageNum }">
							<li class="page-number link">${page }</li>
							</c:if>
						</a>
						</c:forEach>
						<c:if test="${pageInfo.hasNextPage }">
						<a href="${APP_PATH }/products?unuse=1&page=${pageInfo.nextPage }${sortType }${varietyId }">
							<li class="pgNext link next">&gt;</li>
						</a>
						</c:if>
						<c:if test="${!pageInfo.hasNextPage }">
						<li class="pgNext link next">&gt;</li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
		<div class="hr-40"></div>
		<%@ include file="/WEB-INF/view/public/footer.jsp" %>
	</body>

</html>