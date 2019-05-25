<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<section class="content-header">
	<h1>
		商品销量统计 <small>信息</small>
	</h1>

</section>

<section class="content container-fluid">
	<div class="row">
		<div class="col-sm-3">
			<div class="filter-box">
				<div class="filter-text" style="border: 1px solid #d2d6de;">
					<input type="text" class="input-combobox filter-title"
						placeholder="选择类别" readonly="readonly"><span
						class="icon icon-filter-arrow"></span>
				</div>
				<style>
.my-combobox-li {
	position: relative
}

.my-combobox-li:hover>ul {
	display: block !important;
}

.my-combobox-ul {
	display: none;
	width: 200px;
	left: 197px;
	top: -15px;
}

.filter-list li a {
	color: white;
}
</style>
				<ul id="root_varities" class="filter-list filter-open"
					style="display: none; width: 200px;">

				</ul>
			</div>
		</div>
	</div>
	<div class="error-page" style="display: none;">
		<h2 class="headline text-yellow">404</h2>
		<div class="error-content"
			style="margin-top: 35px; float: left; margin-left: 10px;">
			<h3>
				<i class="fa fa-warning text-yellow"></i>数据未找到
			</h3>
			<p>该类商品数据并不存在</p>
		</div>
		<div class="clearfix"></div>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<canvas id="my_canvas" height=45 width=100></canvas>
		</div>
	</div>
</section>
<script>
	var colors = [ 'rgba(255, 99, 132, 0.6)', 'rgba(54, 162, 235, 0.6)',
			'rgba(255, 206, 86, 0.6)', 'rgba(75, 192, 192, 0.6)',
			'rgba(153, 102, 255, 0.6)', 'rgba(255, 159, 64, 0.6)',
			'rgba(255, 99, 132, 0.6)', 'rgba(54, 162, 235, 0.6)',
			'rgba(255, 206, 86, 0.6)', 'rgba(75, 192, 192, 0.6)',
			'rgba(153, 102, 255, 0.6)' ];
	function generateChart(data, labels, backgroundColor) {
		barChart = new Chart($("#my_canvas"), {
			type : 'bar',
			data : {
				labels : labels,
				datasets : [ {
					data : data,
					backgroundColor : backgroundColor
				} ]
			},
			options : {
				legend : {
					display : false
				},
				title : {
					display : true,
					text : "销量统计"
				},
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}
			}
		});
	}
	function destoryChart() {
		barChart.destroy();
	}
	$.ajax({
		method : "GET",
		url : APP_PATH + "/backstage/salequantity",
		success : function(list) {
			var backgroundColors = new Array();
			var data = new Array();
			var labels = new Array();
			$.each(list, function(i, n) {
				data.push(n.saleQuantity);
				labels.push(n.title.substring(0, 10));
				backgroundColors.push(colors[i % colors.length]);
			});
			generateChart(data, labels, backgroundColors);
		}
	});
	
	/* 点击combobox */
	$(".input-combobox").click(function() {
		if($(this).hasClass("down")) {
			$(this).parent().parent().find("ul").first().css("display", "none");
			$(this).removeClass("down");
			$(this).next().removeClass("filter-show");
		} else {
			$(this).parent().parent().find("ul").first().css("display", "block");
			$(this).addClass("down");
			$(this).next().addClass("filter-show");
			varietyChildren(0, createRootVarieties, null);
		}
	});
	/* combobox失去焦点 */
	$(".input-combobox").blur(function() {
		$(this).parent().parent().find("ul").first().css("display", "none");
		$(this).removeClass("down");
		$(this).next().removeClass("filter-show");
	});
	/* 获得子分类，并生成子节点 */
	function varietyChildren(parentId, createDomNode, parentNode) {
		$.ajax({
			method: "GET",
			url: "${APP_PATH }/backstage/varieties?parentId=" + parentId,
			success: function(data) {
				createDomNode(parentNode, data);
			}
		});
	}
	/* 生成根类 */
	function createRootVarieties(parentNode, varieties) {
		var html =  `<li class="my-combobox-li" data-id="">
						<a>全部</a>
					</li>`;
		$.each(varieties, function(i, n) {
			html += `<li class="my-combobox-li" data-id="`+ n.id +`">
						<a>` + n.name + `</a>
					</li>`;
		});
		$("#root_varities").empty();
		$("#root_varities").append(html);
		/* 后续子类 */
		$("#root_varities>li").mouseenter(function() {
			varietyChildren($(this).data("id"), createChildrenVarieties, $(this));
		});
		/* 点击子类 */
		$("#root_varities>li").mousedown(function(eve) {
			eve.stopPropagation();
			showVarietiesOnInput($(this));
		});
	}
	/* 生成后续子类 */
	function createChildrenVarieties(parentNode, varieties) {
		/* 没有子类数据直接返回 */
		if(varieties.length < 1) {
			return;
		}
		var html ='<ul class="filter-list filter-open my-combobox-ul">';
		$.each(varieties, function(i, n) {
			html += `<li class="my-combobox-li" data-id=`+ n.id +`>
						<a>` + n.name + `</a>
					</li>`;
		});
		html += "</ul>";
		parentNode.find("ul").remove();
		parentNode.append(html);
		/* 后续子类 */
		parentNode.find("ul").first().find("li").mouseenter(function() {
			varietyChildren($(this).data("id"), createChildrenVarieties, $(this));
		});
		/* 点击分类 */
		parentNode.find("ul").first().find("li").mousedown(function(eve) {
			eve.stopPropagation();
			showVarietiesOnInput($(this));	
		});
	}
	/* 选择分类，向上回溯 */
	function showVarietiesOnInput(currentNode) {
		var value = currentNode.find(">a").text();
		$.each(currentNode.parents(".my-combobox-li"), function(i, n) {
			value = $(n).find(">a").text() + "  >>  " + value;
		});
		$(".input-combobox.filter-title").val(value);
		$.ajax({
			method: "GET",
			url: "${APP_PATH }/backstage/salequantity?varietyId=" + currentNode.data("id"),
			success: function(list) {
				destoryChart();
				if(list != "") {
					$(".error-page").css("display", "none");
					var backgroundColors = new Array();
					var data = new Array();
					var labels = new Array();
					$.each(list, function(i, n) {
						data.push(n.saleQuantity);
						labels.push(n.title.substring(0, 10));
						backgroundColors.push(colors[i % colors.length]);
					});
					generateChart(data, labels, backgroundColors);
				}
				else {
					$(".error-page").css("display", "block");
				}
			}
		});
	}
</script>