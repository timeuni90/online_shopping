
/* 固定省市区的滑动框 */
$(window).scroll(function() {
	var top = 484.969 + window.scrollY;
	$(".mz-downmenu").css("top", top + "px");
});

/* 点击添加收货地址 */
$(".order-address-checkbox.add").click(function() {
	$("#address_inf").removeClass("hide");
});

/* 点击取消 */
$(".mz-btn.cancel, #address_inf .mz-dialog-close").click(function() {
	$("#address_inf").addClass("hide");
});

/* 获取所有的省 */
$("#province_input").one("click", function() {
	$.ajax({
		method: "GET",
		url: "http://localhost:8080/online-shopping/provinces",
		success: function(message) {
			$.each(message, function(i, n) {
				$($(".mz-downmenu")[0]).find("ul").append('<li class="mz-downmenu-item" data-provinceid="' + n.provinceId + '">' + n.province + '</li>');
			});
			$($(".mz-downmenu")[0]).css("display", "block");
			/* 点击省单元 */
			$($(".mz-downmenu")[0]).find("li").mousedown(function() {
				/* 点击的省和原来一样，直接返回 */
				if($(this).data("provinceid") == $("#province_input").data("provinceid")) {
					return;
				}
				/* 清空输入文本 */
				$(".mz-downmenu-input").val("");
				$("#province_input").data("provinceid", $(this).data("provinceid"));
				$("#province_input").val($(this).text());
			});
		}
	});
});

/* 获取市 */
$("#city_input").click(function() {
	/* 若省还未选中，直接返回 */
	if(typeof($("#province_input").data("provinceid")) == 'undefined') return;
	/* 若选中的省未变，直接返回 */
	if(typeof($(this).data("provinceid")) != 'undeifned' && $(this).data("provinceid") == $("#province_input").data("provinceid")) {
		$($(".mz-downmenu")[1]).css("display", "block");
		return;
	}
	/* 获取市 */
	$.ajax({
		method: "GET",
		url: "http://localhost:8080/online-shopping/cities?provinceId=" + $("#province_input").data("provinceid"),
		success: function(cities) {
			/* 先移除已有的市单元及其点击事件 */
			$($(".mz-downmenu")[1]).find("ul").empty();
			/* 将获得的数据嵌入到dom */
			$.each(cities, function(i, n) {
				$($(".mz-downmenu")[1]).find("ul").append('<li class="mz-downmenu-item" data-cityid="' + n.cityId + '">' + n.city + '</li>');
			});
			$($(".mz-downmenu")[1]).css("display", "block");
			/* 记录所属省 */
			$("#city_input").data("provinceid", $("#province_input").data("provinceid"));
			/* 点击市单元 */
			$($(".mz-downmenu")[1]).find("li").mousedown(function() {
				/* 点击的市和原来一样，直接返回 */
				if($(this).data("cityid") == $("#city_input").data("cityid")) {
					return;
				}
				/* 清空区输入文本 */
				$("#area_input").val("");
				$("#city_input").data("cityid", $(this).data("cityid"));
				$("#city_input").val($(this).text());
			});
		}
	});
});

/* 获取区 */
$("#area_input").click(function() {
	/* 若市还未选中，直接返回 */
	if(typeof($("#city_input").data("cityid")) == 'undefined') {
		return;
	}
	/* 若选中的市未变，直接返回 */
	if(typeof($(this).data("cityid")) != 'undeifned' && $(this).data("cityid") == $("#city_input").data("cityid")) {
		$($(".mz-downmenu")[2]).css("display", "block");
		return;
	}
	/* 请求所有的区 */
	$.ajax({
		methos: "GET",
		url: "http://localhost:8080/online-shopping/areas?cityId=" + $("#city_input").data("cityid"),
		success: function(areas) {
			/* 把旧的区移除 */
			$($(".mz-downmenu")[2]).find("ul").empty();
			/* 将所有的区嵌入到dom中 */
			$.each(areas, function(i, n) {			
				$($(".mz-downmenu")[2]).find("ul").append('<li class="mz-downmenu-item" data-areaid="' + n.areaId + '">' + n.area + '</li>');
			});
			$($(".mz-downmenu")[2]).css("display", "block");
			/* 记录所属市 */
			$("#area_input").data("areaid", $("#city_input").data("cityid"));
			/* 点击区单元 */
			$($(".mz-downmenu")[2]).find("li").mousedown(function() {
				$("#area_input").data("areaid", $(this).data("areaid"));
				$("#area_input").val($(this).text());
			});
		}
	});
});

/* 点击省输入框 */
$("#province_input").click(function() {
	/* 显示省列表 */
	$($(".mz-downmenu")[0]).css("display", "block");
});

/* 省输入框失去焦点 */
$("#province_input").blur(function() {
	$($(".mz-downmenu")[0]).css("display", "none");
});

/* 市输入框失去焦点 */
$("#city_input").blur(function() {
	$($(".mz-downmenu")[1]).css("display", "none");
});

/* 区输入框失去焦点 */
$("#area_input").blur(function() {
	$($(".mz-downmenu")[2]).css("display", "none");
});


