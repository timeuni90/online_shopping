
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
				$($(".mz-downmenu")[0]).find("ul").append('<li class="mz-downmenu-item">' + n.province + '</li>');
			});
			$($(".mz-downmenu")[0]).css("display", "block");
		}
	});
});