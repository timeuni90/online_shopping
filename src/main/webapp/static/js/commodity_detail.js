
/* 给property-value类绑定点击事件 */
var selected_property_value = null;
$(".property-value").click(function() {
	/* 显示选中或不选中 */
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
			if(rows.length == 1) {
				select_property_row = rows[0];
				return false;
			}
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
		/* */
		var value = parseInt($(".tb-text.mui-amount-input").val());
		var stock = parseInt($("#J_EmStock").text().match(/\d{1,}/));
		if(value <= stock) {
			$("#J_LinkBuy, #J_LinkBasket").removeClass("noPost");
		} else {
			$("#J_LinkBuy, #J_LinkBasket").addClass("noPost");
		}
	} else {	/* 属性未选满 */
		$("#J_LinkBuy, #J_LinkBasket").addClass("noPost");
		$("#J_EmStock").text("库存"+commodity_stock+"件");
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

/* 给输入框绑定键盘事件，每一键入时校验输入是否合法  */
$(".tb-text.mui-amount-input").keyup(function() {
	var value = $(this).val();
	$(this).val(value.replace(/^(0+)|[^\d]+/g, ""));
	var value = parseInt($(".tb-text.mui-amount-input").val());
	var stock = parseInt($("#J_EmStock").text().match(/\d{1,}/));
	if(value <= stock) {
		$("#J_LinkBuy, #J_LinkBasket").removeClass("noPost");
	} else {
		$("#J_LinkBuy, #J_LinkBasket").addClass("noPost");
	}
});

/* 给输入框绑定失去焦点事件，若输入框的里值为空，则默认为1 */
$(".tb-text.mui-amount-input").blur(function() {
	if($(this).val() == "") {
		$(this).val("1");
	}
	var value = parseInt($(".tb-text.mui-amount-input").val());
	var stock = parseInt($("#J_EmStock").text().match(/\d{1,}/));
	if(value <= stock) {
		$("#J_LinkBuy, #J_LinkBasket").removeClass("noPost");
	} else {
		$("#J_LinkBuy, #J_LinkBasket").addClass("noPost");
	}
});

/*  */
$("#J_UlThumb li").mouseenter(function() {
	$("#J_UlThumb li").removeClass("tb-selected");
	$(this).addClass("tb-selected");
	$("#J_ImgBooth").attr("src", $(this).find("img").attr("src"));
});

/*  */
$(".tm-clear.J_TSaleProp.tb-img li").click(function() {
	if($(this).hasClass("tb-selected")) {
		$("#J_UlThumb li").removeClass("tb-selected");
		var url = $(this).find("a").css("backgroundImage").split('("')[1].split('")')[0];
		$("#J_ImgBooth").attr("src", url);
	}
});

/*  */
$("#J_TabBar li").click(function() {
	$("#J_TabBar li").removeClass("tm-selected");
	$(this).addClass("tm-selected");
});

/* 点击评论 */
$("#my_review").click(function() {
	$("#bd").addClass("tm-tabOther");
	$("#J_Attrs").removeClass("tm-curTab");
	$("#J_Reviews").addClass("tm-curTab");
});

/* 点击规格参数 */
$("#my_attrs").click(function() {
	$("#bd").addClass("tm-tabOther");
	$("#J_Reviews").removeClass("tm-curTab");
	$("#J_Attrs").addClass("tm-curTab");
});

/* 点击商品详情 */
$("#my_detail").click(function() {
	$("#J_Reviews").removeClass("tm-curTab");
	$("#J_Attrs").removeClass("tm-curTab");
	$("#bd").removeClass("tm-tabOther");
});

/* 点击购买 */
$("#J_LinkBuy").click(function() {
	if(!$(this).hasClass("noPost")) {
		var url = "http://localhost:8080/online-shopping/prepareorder?";
		url += "commodityId=" + commodity_id + "&";
		url += "row=" + select_property_row + "&";
		url += "quantity=" + $(".tb-text.mui-amount-input").val();
		window.location.href = url;
	}
});

/* 加入购物车 */
$("#J_LinkBasket").click(function() {
	if(!$(this).hasClass("noPost")) {
		$.ajax({
			type: "POST",
			url: "http://localhost:8080/online-shopping/cart",
			data: "selectPropertyRow=" + select_property_row + "&quantity=" + $(".tb-text.mui-amount-input").val(),
			success: function(data) {
				if(data) {
					$.scojs_message('添加成功', $.scojs_message.TYPE_OK);
					/* 更新头部 */
					$.ajax({
						method: "GET",
						url: APP_PATH + "/header",
						success: function(data) {
							if(data.isLogined) {
								$(".layout-header-service-cart-num").text(data.cartCount);
							}
						}
					});
				} else {
					$.scojs_message('库存不足', $.scojs_message.TYPE_ERROR);
				}
			}
		});
	}
});

/* 联系商家 */
var websocket = null;
/* 创建连接 */
$("#my_contact_seller").click(function() {
	if(websocket != null)
		return;
	if ('WebSocket' in window) {  
	    websocket = new WebSocket("ws://localhost:8080/online-shopping/userwebsocket?id=" + user_id + seller_id);
	} else {  
	    alert('当前浏览器不支持websocket')  
	}
	  
	//接收到消息的回调方法  
	websocket.onmessage = function(eve) {
		var map = JSON.parse(eve.data);
		var data = map.messager;
		var direct_chat_msg = "";
		var direct_chat_name = "pull-left";
		var direct_chat_timestamp = "pull-right";
		var text_align = "";
		if(map.isFromSelf) {
			direct_chat_msg = "right";
			direct_chat_name = "pull-right";
			direct_chat_timestamp = "pull-left";
			text_align = "style='text-align: right'";
		}
		var html = `<div class="direct-chat-msg ` + direct_chat_msg + `">
			<div class="direct-chat-info clearfix">
				<span class="direct-chat-name ` + direct_chat_name + `">` + data.name + `</span>
				<span class="direct-chat-timestamp ` + direct_chat_timestamp + `">` + data.time + `</span>
			</div>
			<img class="direct-chat-img" src="` + data.image + `" alt="message user image">
			<div class="direct-chat-text" ` + text_align + ` >` + data.message + `</div>
		</div>`;
		$(".direct-chat-messages").append(html);
		var scrollHeight = $(".direct-chat-messages").prop("scrollHeight");
		$('.direct-chat-messages').animate({scrollTop: scrollHeight}, "slow");
	}
	  	
	//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。  
	window.onbeforeunload = function() {  
		websocket.close();
	}
});

/* 点击发送 */
$("#chat_send").click(function() {
	mySendMessage();
});

/* 回车发送 */
$("#chat_send").prev().keydown(function(eve) {
	if(eve.keyCode == 13) {
		mySendMessage();
	}
	
});

/* 发送消息 */
function mySendMessage() {
	var message = $("#chat_send").prev().val();
	if(message == null || message == "") {
		return;
	}
	var data = {
			message: message,
			toId: $("#chat_send").data("sellerid")
	}
	$("#chat_send").prev().val("");
	websocket.send(JSON.stringify(data));
}
