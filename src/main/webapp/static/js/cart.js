
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
	var checkbox_checked_length = $(".cart-merchant-header .mz-checkbox.checked").length;
	var checkbox_length = $(".cart-merchant-header .mz-checkbox").length;
	if(checkbox_checked_length == checkbox_length) {
		$(".cart-select-all.JSelectAll .mz-checkbox").addClass("checked");
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
	var checkbox_checked_length = $(this).parent().parent().parent().find(".mz-checkbox.checked").length;
	var checkbox_length = $(this).parent().parent().parent().find(".mz-checkbox").length;
	if(checkbox_checked_length == checkbox_length) {
		$(this).parent().parent().parent().parent().prev().find(".mz-checkbox").addClass("checked")
	}
	var all_checkbox_checked_length = $(".cart-merchant-body .mz-checkbox.checked").length;
	var all_checkbox_length = $(".cart-merchant-body .mz-checkbox").length;
	if(all_checkbox_length == all_checkbox_checked_length) {
		$(".cart-select-all.JSelectAll .mz-checkbox").addClass("checked");
	}
})

/* 点击任意一个checkbox引起变量发生变化 */
$(".mz-checkbox").click(function() {
	/* 数量变化 */
	var selective_commodity_quantity = $(".cart-merchant-body .mz-checkbox.checked").length;
	$("#totalSelectedCount").text(selective_commodity_quantity);
	/* 总价格变化 */
	totalPrice();
	isOpenSubmit();
});

/* 使提交按钮生效或失效 */
function isOpenSubmit() {
	if($(".cart-merchant-body .mz-checkbox.checked").length != 0) {
		$("#cartSubmit").removeClass("disabled");
	} else {
		$("#cartSubmit").addClass("disabled");
	}
}

/* 总价格变化 */
function totalPrice() {
	var total_price = 0.0;
	$.each($(".cart-merchant-body .mz-checkbox.checked").parent().parent().find(".cart-product-price.total.main-goods"), function(i, n) {
		total_price += parseFloat($(n).text());
	});
	$("#totalPrice").text(total_price.toFixed(2));
}

/* 点击减号 */
$(".mz-adder-subtract").click(function() {
	if(!$(this).hasClass("disabled")) {
		var value = parseInt($(this).parent().find(".mz-adder-num input").val());
		var current = this;
		if(value > 1) {
			$.ajax({
				method: "POST",
				url: "http://localhost:8080/online-shopping/cart",
				data: "selectPropertyRow=" + $(this).parent().parent().parent().parent().attr("data-row") + "&quantity=" + (--value),
				success: function(message) {
					$(current).parent().find(".mz-adder-num input").val(value);
					varyPrice(current);
					if(message) {
						$(current).parent().find(".mz-adder-add").removeClass("disabled");
						$(current).parent().parent().find(".cart-product-number-max").removeClass("show");
						/* 数量改变，总价变化 */
						totalPrice();
					} else {
						$(current).parent().find(".mz-adder-add").addClass("disabled");
						$(current).parent().parent().find(".cart-product-number-max").text("库存不足");
						$(current).parent().parent().find(".cart-product-number-max").addClass("show");
					}
				}
			});
		}
		if(value <= 1) {
			$(this).addClass("disabled");
		}
	}
});

/* 点击加号 */
$(".mz-adder-add").click(function() {
	if(!$(this).hasClass("disabled")) {
		var value = parseInt($(this).parent().find(".mz-adder-num input").val());
		var current = this;
		$.ajax({
			method: "POST",
			url: "http://localhost:8080/online-shopping/cart",
			data: "selectPropertyRow=" + $(this).parent().parent().parent().parent().attr("data-row") + "&quantity=" + (value + 1),
			success: function(message) {
				if(message) {
					$(current).parent().find(".mz-adder-num input").val(value + 1);
					$(current).parent().find(".mz-adder-subtract").removeClass("disabled");
					varyPrice(current);
					/* 数量改变，总价变化 */
					totalPrice();
				} else {
					$(current).addClass("disabled");
					$(current).parent().parent().find(".cart-product-number-max").text("库存不足");
					$(current).parent().parent().find(".cart-product-number-max").addClass("show");
				}
			}
		});
	}
});

/* 点击加减按钮引起价格变化 */
function varyPrice(current) {
	var quantity = parseInt($(current).parent().find(".mz-adder-input").val());
	var unit_price = parseFloat($(current).parent().parent().parent().parent().find(".cart-product-price").text());
	var price = quantity * unit_price;
	$(current).parent().parent().parent().parent().find(".cart-product-price.total.main-goods").text(price.toFixed(2));
}

/* 键盘输入数量 */
$(".mz-adder-input").keyup(function() {
	var value = $(this).val();
	$(this).val(value.replace(/^(0+)|[^\d]+/g, ""));
	if($(this).val() == "") {
		return;
	}
	var current = this;
	$.ajax({
		method: "POST",
		url: "http://localhost:8080/online-shopping/cart",
		data: "selectPropertyRow=" + $(this).parent().parent().parent().parent().parent().attr("data-row") + "&quantity=" + $(current).val(),
		success: function(message) {
			if(message) {
				varyPrice($(current).parent());
				$(current).parent().parent().find(".mz-adder-add").removeClass("disabled");
				$(current).parent().parent().find(".mz-adder-subtract").removeClass("disabled");
				$(current).parent().parent().parent().find(".cart-product-number-max").removeClass("show");
				/* 数量改变，总价变化 */
				totalPrice();
			} else {
				$(current).parent().parent().find(".mz-adder-add").addClass("disabled");
				$(current).parent().parent().parent().find(".cart-product-number-max").text("库存不足");
				$(current).parent().parent().parent().find(".cart-product-number-max").addClass("show");
			}
		}
	});
});

/* 数量框失去焦点 */
$(".mz-adder-input").blur(function() {
	if($(this).val() == "") {
		var current = this;
		$(this).val("1");
		$.ajax({
			method: "POST",
			url: "http://localhost:8080/online-shopping/cart",
			data: "selectPropertyRow=" + $(this).parent().parent().parent().parent().parent().attr("data-row") + "&quantity=1",
			success: function(message) {
				if(message) {
					varyPrice($(current).parent());
					$(current).parent().parent().find(".mz-adder-add").removeClass("disabled");
					$(current).parent().parent().parent().find(".cart-product-number-max").removeClass("show");
					/* 数量改变，总价变化 */
					totalPrice();
				} else {
					$(current).parent().parent().find(".mz-adder-add").addClass("disabled");
					$(current).parent().parent().parent().find(".cart-product-number-max").text("库存不足");
					$(current).parent().parent().parent().find(".cart-product-number-max").addClass("show");
				}
			}
		});
	}
});

/* 点击删除 */
$(".cart-product-remove.let-show").click(function() {
	$("#confirm_box").removeClass("hide");
	data_rows = [$(this).parent().parent().attr("data-row")];
	table_rows = [$(this).parent().parent()];
});

/* 点击批量删除 */
$("#removeSelected").click(function() {
	$("#confirm_box").removeClass("hide");
	data_rows = new Array();
	table_rows = new Array();
	$.each($(".cart-product .mz-checkbox.checked"), function(i, n) {
		data_rows.push($(n).parent().parent().attr("data-row"));
	});
	$.each($(".cart-product .mz-checkbox.checked"), function(i, n) {
		table_rows.push($(n).parent().parent());
	});
});

/* 取消删除 */
$("#confirm_box .mz-btn.success").click(function() {
	$("#confirm_box").addClass("hide");
});

/* 确认删除 */
$("#confirm_box .mz-btn.cancel").click(function() {
	$(".mz-loading-mask").css("display", "block");
	$("#confirm_box").addClass("hide");
	var dataString = "";
	$.each(data_rows, function(i, n) {
		dataString += "rows=" + n;
		if(i < data_rows.length - 1) {
			dataString += "&";
		}
	});
	$.ajax({
		method: "POST",
		url: "http://localhost:8080/online-shopping/cart",
		data: "_method=delete&" + dataString,
		success: function(message) {
			if(message > 0) {
				$(".mz-loading-mask").css("display", "none");
				$.each(table_rows, function(i, n) {
					n.remove();
				});
				$.each($(".cart-merchant"), function(i, n) {
					if($(n).find(".cart-product").length <= 0) {
						n.remove();
					}
				});
				/* 数量改变，总价变化 */
				totalPrice();
				/* 使提交按钮生效或失效 */
				isOpenSubmit()
			}
		}
	});
});

/* 提交结算 */
$("#cartSubmit").click(function() {
	if(!$(this).hasClass("disabled")) {
		var datas = "";
		$.each($(".cart-product .mz-checkbox.checked"), function(i, n) {
			datas += "rows=" + $(n).parent().parent().attr("data-row");
			if(i < $(".cart-product .mz-checkbox.checked").length - 1) {
				datas += "&";
			}
		});
		window.location.href="http://localhost:8080/online-shopping/prepareorders?" + datas;
	}
});




