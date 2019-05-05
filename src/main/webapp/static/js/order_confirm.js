
/* 固定省市区的滑动框 */
$(window).scroll(function() {
	var top = 484.969 + window.scrollY;
	$(".mz-downmenu").css("top", top + "px");
});

/* 点击添加收货地址 */
$(".order-address-checkbox.add").click(function() {
	$("#address_inf").removeClass("hide");
	/* 去除校验提示 */
	$(".mz-input-warp.tips").removeClass("tips");
	$(".mz-input-warp.tips").removeAttr("data-tips");
	/* 输入框置空 */
	$(".mz-input-warp").find("input").val("");
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

/* 提交新的收货地址 */
$("#address_inf .mz-btn.success").click(function() {
	var receiver = $(".mz-input.address-adder-name").val().trim();
	var phoneNumber = $(".mz-input.address-adder-phone").val().trim();
	var detailAddress = $(".mz-input.address-adder-detail").val().trim();
	/* 校验收件人 */
	if(receiver == "") {
		$(".mz-input.address-adder-name").parent().addClass("tips");
		$(".mz-input.address-adder-name").parent().attr("data-tips", "请输入收件人姓名！");
		return;
	}
	/* 校验手机号 */
	if(phoneNumber == "") {
		$(".mz-input.address-adder-phone").parent().addClass("tips");
		$(".mz-input.address-adder-phone").parent().attr("data-tips", "请输入手机号码！");
		return;
	}
	if(phoneNumber.length < 11) {
		$(".mz-input.address-adder-phone").parent().addClass("tips");
		$(".mz-input.address-adder-phone").parent().attr("data-tips", "请输入11位手机号码！");
		return;
	}
	/* 校验收货地址 */
	if(typeof($("#area_input").data("areaid")) == 'undefined') {
		$(".mz-input-warp.address-adder-select.mz-address").addClass("tips");
		$(".mz-input-warp.address-adder-select.mz-address").attr("data-tips", "请选择收货地址！");
		return;
	}
	/* 校验详细地址 */
	if(detailAddress == "") {
		$(".mz-input.address-adder-detail").parent().addClass("tips");
		$(".mz-input.address-adder-detail").parent().attr("data-tips", "请输入详细地址！");
		return;
	}
	/* 将收货信息发送到后端 */
	$.ajax({
		method: "POST",
		url: "http://localhost:8080/online-shopping/addressdetail",
		data: "detailAddress=" + detailAddress + "&phoneNumber=" + phoneNumber + "&receiver=" + receiver + "&areaId=" + $("#area_input").data("areaid"),
		success: function(id) {
			var domString = '<li class="order-address-checkbox" data-id=' + id + '>' +
					'<div class="order-address-checkbox-top">' +
					'<div class="order-address-checkbox-name">' + receiver + '</div>' +
					'<div class="order-address-checkbox-phone">' + phoneNumber + '</div>' +
					'</div>'+
					'<div class="order-address-checkbox-content">' + $("#province_input").val() + $("#city_input").val() +
					$("#area_input").val() + detailAddress + '</div>'+
					'<div class="order-address-checkbox-checked">' +
					'<div class="order-address-checkbox-tick"></div>' +
					'</div>'+
					'<div class="order-address-checkbox-ctrl">' +
					'<div class="order-address-checkbox-delete"></div>' +
					'<div class="order-address-checkbox-edit"></div>' +
					'</div>' +
					'</li>';
			$("#address_inf").addClass("hide");
			$(".order-address-checkbox.add").before(domString);
			$("#addressList").css("height", Math.ceil($(".order-address-list.clearfix li").length / 4) * 174 + "px");
		}
	});
});

/* 收件人输入框失去焦点 */
$(".mz-input.address-adder-name").blur(function() {
	var receiver = $(this).val();
	if(receiver.trim() == "") {
		$(this).parent().addClass("tips");
		$(this).parent().attr("data-tips", "请输入收件人姓名！");
	} else {
		$(this).parent().removeClass("tips");
		$(this).parent().removeAttr("data-tips");
	}
});

/* 手机号码输入框失去焦点 */
$(".mz-input.address-adder-phone").blur(function() {
	var phoneNumber = $(this).val().trim();
	/* 校验手机号 */
	if(phoneNumber == "") {
		$(this).parent().addClass("tips");
		$(this).parent().attr("data-tips", "请输入手机号码！");
		return;
	}
	if(phoneNumber.length < 11) {
		$(this).parent().addClass("tips");
		$(this).parent().attr("data-tips", "请输入11位手机号码！");
		return;
	}
	$(this).parent().removeClass("tips");
	$(this).parent().removeAttr("data-tips");
});

/* 手机号码输入框只允许输入数字 */
$(".mz-input.address-adder-phone").keyup(function() {
	var value = $(this).val();
	$(this).val(value.replace(/[^\d]+/g, ""));
});

/* 删除收货地址 */
$(".order-address-checkbox-delete").click(function() {
	var current = this;
	$.ajax({
		method: "POST",
		url: "http://localhost:8080/online-shopping/addressdetail",
		data: "_method=delete&id=" + $(this).parent().parent().data("id"),
		success: function(message) {
			if(message > 0) {
				$(current).parent().parent().remove();
				$("#addressList").css("height", Math.ceil($(".order-address-list.clearfix li").length / 4) * 174 + "px");
			}
		}
	});
});

/* 选着收货地址 */
$(".order-address-checkbox").click(function() {
	$(".order-address-checkbox.checked").removeClass("checked");
	$(this).addClass("checked");
});