
/* 点击全选 */
$(".cart-select-all.JSelectAll .mz-checkbox").click(function() {
	if($(this).hasClass("checked")) {
		$(".mz-checkbox").removeClass("checked");
	} else {
		$(".mz-checkbox").addClass("checked");
	}
});

/* 点击商店 */
$(".cart-merchant-header .mz-checkbox").click(function() {
	if($(this).hasClass("checked")) {
		$(this).parent().parent().parent().find(".mz-checkbox").removeClass("checked");
		$(".cart-select-all.JSelectAll .mz-checkbox").removeClass("checked");
	} else {
		$(this).parent().parent().parent().find(".mz-checkbox").addClass("checked");
	}
});

/* 点击商品 */
$(".cart-merchant-body .mz-checkbox").click(function() {
	if($(this).hasClass("checked")) {
		$(this).removeClass("checked");
		$(this).parent().parent().parent().parent().prev().find(".mz-checkbox").removeClass("checked");
		$(".cart-select-all.JSelectAll .mz-checkbox").removeClass("checked");
	} else {
		$(this).addClass("checked");
	}
})