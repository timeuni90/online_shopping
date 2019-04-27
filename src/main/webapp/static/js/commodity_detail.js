

/* 给property-value类绑定点击事件 */
var selected_property_value = null;
$(".property-value").click(function() {
	/* 现实选中或不选中 */
	if($(this).hasClass("tb-selected")) {
		$(this).removeClass("tb-selected");
	} else {
		var children = $($(this).parent()).children();
		$(children).removeClass("tb-selected");
		$(this).addClass("tb-selected");
	}
	/* 选满属性后，商品的变量要做变化 */
	if($(".tb-prop.tm-sale-prop.tm-clear").length == $(".tb-key .tb-skin .tb-sku .tb-selected").length) {
		/* 将公共行筛选出来 */
		var rowsString = $($(".tb-key .tb-skin .tb-sku .tb-selected")[0]).attr("data-rows");
		var rows = rowsString.split(",");
		$.each($(".tb-key .tb-skin .tb-sku .tb-selected"), function(i, n) {
			var other_rows = $(n).attr("data-rows").split(",");
			$.each(rows, function(i, n) {
				if(other_rows.indexOf(n) == -1) {
					rows.splice(i, 1);
				}
			});
			if(rows.length == 1)
				return false;
		});
		/* 寻找价格 */
		$.each(commodity_variables, function(i, n) {
			if(rows[0] == n.row) {
				/* 嵌入变量 */
				$("#J_EmStock").text("库存"+n.stock+"件");
				$(".tm-fcs-panel").empty();
				if(n.promotion_price == null) {
					var html_string = "<dl class='tm-price-panel' id='J_StrPriceModBox'>" +
							"<dt class='tb-metatit'>价格</dt>" +
							"<dd>" +
							"<em class='tm-yen1'>¥</em>" +
							"<span class='tm-price1'>"+n.price.toFixed(2)+"</span>" +
							"</dd>" +
							"</dl>";
					$(".tm-fcs-panel").append(html_string);
				} else {
					var html_string = "<dl class='tm-price-panel' id='J_StrPriceModBox'>" +
							"<dt class='tb-metatit'>价格</dt>" +
							"<dd>" +
							"<em class='tm-yen'>¥</em>" +
							"<span class='tm-price'>"+n.price.toFixed(2)+"</span>" +
							"</dd>" +
							"</dl>";
					var html_string1 = "<dl class='tm-promo-panel tm-promo-cur' id='J_PromoPrice' data-label='促销价'>" +
							"<dt class='tb-metatit'>促销价</dt>" +
							"<dd>" +
							"<div class='tm-promo-price'>" +
							"<em class='tm-yen1'>¥</em>" +
							"<span class='tm-price1'>"+n.price.toFixed(2)+"</span>" +
							"</div>" +
							"</dd>" +
							"</dl>";
					$(".tm-fcs-panel").append(html_string).append(html_string1);
				}
				return false;
			}
		});
	} else {	/* 属性未选满 */
		$(".tm-fcs-panel").empty();
		if(min_promotion_price == null) {
			var html_string = "<dl class='tm-price-panel' id='J_StrPriceModBox'>" +
			"<dt class='tb-metatit'>价格</dt>" +
			"<dd>" +
			"<em class='tm-yen1'>¥</em>" +
			"<span class='tm-price1'>"+min_price+"-"+max_price+"</span>" +
			"</dd>" +
			"</dl>";
			$(".tm-fcs-panel").append(html_string);
		} else {
			var html_string = "<dl class='tm-price-panel' id='J_StrPriceModBox'>" +
			"<dt class='tb-metatit'>价格</dt>" +
			"<dd>" +
			"<em class='tm-yen'>¥</em>" +
			"<span class='tm-price'>"+min_price+"-"+max_price+"</span>" +
			"</dd>" +
			"</dl>";
			var html_string1 = "<dl class='tm-promo-panel tm-promo-cur' id='J_PromoPrice' data-label='促销价'>" +
			"<dt class='tb-metatit'>促销价</dt>" +
			"<dd>" +
			"<div class='tm-promo-price'>" +
			"<em class='tm-yen1'>¥</em>" +
			"<span class='tm-price1'>"+min_promotion_price+"-"+max_promotion_price+"</span>" +
			"</div>" +
			"</dd>" +
			"</dl>";
			$(".tm-fcs-panel").append(html_string).append(html_string1);
		}
	}
});

/* 给increase绑定事件 */
$(".mui-amount-increase").click(function() {
	var value = parseInt($(".tb-text.mui-amount-input").val());
	var stock = parseInt($("#J_EmStock").text().match(/\d{1,}/));
	if(value < stock) {
		$(".tb-text.mui-amount-input").val(++value);
	}
});

/* 给decrease绑定事件 */
$(".mui-amount-decrease").click(function() {
	var value = parseInt($(".tb-text.mui-amount-input").val());
	if(value > 1) {
		$(".tb-text.mui-amount-input").val(--value);
	}
});


