
/* 打开商品中心 */
$("#commodity_center_opener").click(function() {
	if($(this).hasClass("active")) {
		return;
	}
	myLoadding();
	$(".sidebar-menu.tree li").removeClass("active");
	$(this).addClass("active");
	$.ajax({
		method: "GET",
		url: APP_PATH + "/backstage/commoditycenter",
		success: function(commodity_center) {
			$(".content-wrapper").empty();
			$(".content-wrapper").append(commodity_center);
			getCommditiesByPageNumber(1);
		}
	});
});

/* 打开订单中心 */
$("#my_order_opener").click(function() {
	if($(this).hasClass("active")) {
		return;
	}
	myLoadding();
	$(".sidebar-menu.tree li").removeClass("active");
	$(this).addClass("active");
	$.ajax({
		method: "GET",
		url: APP_PATH + "/backstage/orderview",
		success: function(orderview) {
			$(".content-wrapper").empty();
			$(".content-wrapper").append(orderview);
			getOrdersByPageNum(1);
		}
	});
});

/* 打开销量统计 */
$("#my_sale_quantity_statistic").click(function() {
	if($(this).hasClass("active")) {
		return;
	}
	myLoadding();
	$(".sidebar-menu.tree li").removeClass("active");
	$(this).addClass("active");
	$.ajax({
		method: "GET",
		url: APP_PATH + "/backstage/statisticview",
		success: function(html) {
			$(".content-wrapper").empty();
			$(".content-wrapper").append(html);
		}
	});
});
/* loadding */
function myLoadding() {
	var string = `<div class="container">
					<div class="row">
						<div class="col-sm-12" style="text-align: center; padding-top: 150px; font-size: 200px;">
							<i class="fa fa-refresh fa-spin"></i>
						</div>
					</div>
				  </div>`;
	$(".content-wrapper").empty();
	$(".content-wrapper").append(string);
}

/* 获取商品列表 */
function getCommditiesByPageNumber(pageNum) {
	$.ajax({
		method: "get",
		url: APP_PATH + "/backstage/products?pageNum=" + pageNum,
		success: function(pageInfo) {
			$(".table.table-condensed.dataTable tbody").empty();
			var string = '';
			$.each(pageInfo.list, function(i, n) {
				var status = "下架";
				var cls = 'label-danger';
				if(n.status == 1) {
					status = "上架";
					var cls = 'label-success';
				}
				var name = n.title;
				if(n.title.length > 6) {
					name = n.title.substr(0, 15) + '...';
				}
				string += `<tr>
							  	<td><input data-productid="` + n.id + `" class="my_checkbox" type="checkbox"></td>
					 		  	<td>` + i + `</td>
								<td title="` + n.title + `">` + name + `</td>
								<td><span class="label ` + cls + `">` + status + `</span></td>
								<td>￥` + n.price.toFixed(2) + `</td>
							  	<td>` + n.stock + `</td>
								<td>` + n.monthSale + `</td>
								<td>
									<button type="button" data-toggle="modal" data-target="#modal-product-detail" class="btn btn-sm btn-primary my_detail">查看</button>
									<!--<button type="button" class="btn btn-sm btn-warning">修改</button>-->
									<button type="button" class="my_remove_product btn btn-sm btn-danger">删除</button>
								</td>
							</tr>`;
			});
			var table_info = '共' + pageInfo.total + '条数据，共' + pageInfo.pages + '页，当前第' + pageInfo.pageNum + '页';
			$(".table.table-condensed.dataTable tbody").append(string);
			$(".dataTables_info").text(table_info);
			var navigatepageNums = '';
			if(pageInfo.hasPreviousPage) {
				navigatepageNums += `<li class="paginate_button">
										<a href="#" aria-controls="example1" data-pageNum="` + (parseInt(pageInfo.pageNum)-1) + `">上一页</a>
									</li>`;
			} else {
				navigatepageNums += `<li class="paginate_button disabled">
										<a href="#" aria-controls="example1" data-pageNum="` + (parseInt(pageInfo.pageNum)-1) + `">上一页</a>
									</li>`;
			}
			$.each(pageInfo.navigatepageNums, function(i, n) {
				if(pageInfo.pageNum == n) {
					navigatepageNums += `<li class="paginate_button active">
											<a href="#" aria-controls="example1" data-pageNum="` + n + `" tabindex="0">` + n + `</a>
										</li>`;
				} else {
					navigatepageNums += `<li class="paginate_button">
											<a href="#" aria-controls="example1" data-pageNum="` + n + `" tabindex="0">` + n + `</a>
										</li>`;
				}
			});
			if(pageInfo.hasNextPage) {
				navigatepageNums += `<li class="paginate_button">
										<a href="#" aria-controls="example1" data-pageNum="` + (parseInt(pageInfo.pageNum)+1) + `" tabindex="0">下一页</a>
									</li>`;
			} else {
				navigatepageNums += `<li class="paginate_button disabled">
										<a href="#" aria-controls="example1" data-pageNum="` + (parseInt(pageInfo.pageNum)+1) + `" tabindex="0">下一页</a>
									</li>`;
			}
			$(".pagination").empty();
			$(".pagination").append(navigatepageNums);
			/* 点击页码 */
			$(".paginate_button").click(function() {
				if($(this).hasClass("disabled") || $(this).hasClass("active")) {
					return;
				}
				getCommditiesByPageNumber($(this).find("a").data("pagenum"));
			});
			/* 点击单选 */
			$(".my_checkbox").click(function() {
				if($(".my_checkbox:checked").length < $(".my_checkbox").length) {
					$("#my_check_all").prop("checked", false);
				} else {
					$("#my_check_all").prop("checked", true);
				}
			});
			/* 单个删除 */
			$(".my_remove_product").click(function() {
				var cur = this;
				$.confirm({
					title: '删除提示',
				    content: '确认删除吗？',
				    confirmButton: '确认',
				    cancelButton: '取消',
				    confirmButtonClass: 'btn-warning',
				    cancelButtonClass: 'btn-success',
				    confirm: function() {
				    	$.ajax({
							method: "POST",
							url: APP_PATH + "/backstage/products",
							data: "_method=delete&productIds=" + $(cur).parent().parent().find(".my_checkbox").data("productid"),
							success: function(data) {
								if(data > 0) {
				    				getCommditiesByPageNumber(1);
				    				$.scojs_message('删除商品成功', $.scojs_message.TYPE_OK);
				    			}
							}
						});
				    }
				});
			});
			/*点击查看*/
			$(".my_detail").click(function() {
				var productId = $(this).parent().parent().find(".my_checkbox").data("productid");
				$.ajax({
					mothod: "GET",
					url: APP_PATH + '/backstage/product?productId=' + productId,
					success: function(data) {
						var html = `<div class="form-group">
										<label class="col-sm-2 control-label">商品名</label>
										<div class="col-sm-10" title="`+ data.commodity.title +`">
											<input type="text" class="form-control" value="`+ data.commodity.title +`">
										</div>
									</div>`;
						$.each(data.backStageProductRows, function(i, n) {
							html += `<div id="my_params_value_group">`;
							$.each(n.properties, function(i, n) {
								html += `<div class="my_params_value">
											<h5 class="page-header fengexian"></h5>
											<div class="form-group">
												<label class="col-sm-2 control-label">
													参数值
												</label>
												<div class="col-sm-7">
													<div class="input-group">
														<span class="input-group-addon">` + n.propertyName + `</span>
														<input type="text" class="form-control" value="`+ n.propertyValue +`">
													</div>
												</div>
											</div>
										</div>`;
							});
							html += `<div class="form-group my_sale_price">
										<label class="col-sm-2 control-label"></label>
										<div class="col-sm-7">
											<div class="input-group">
												<span class="input-group-addon">售价￥</span>
												<input type="text" class="form-control" value="`+ parseFloat(n.price).toFixed(2) +`">
											</div>
										</div>
									</div>`;
							html += `<div class="form-group">
										<label class="col-sm-2 control-label"></label>
										<div class="col-sm-7">
											<div class="input-group">
												<span class="input-group-addon">库存</span>
												<input type="text" class="form-control" value="`+ n.stock +`">
											</div>
										</div>
									</div>`;
						});
						$("#modal-product-detail .box-body").empty();
						$("#modal-product-detail .box-body").append(html);
					}
				});
			});
		}
	});
}

/* 获取订单列表 */
function getOrdersByPageNum(pageNum) {
	$.ajax({
		method: "GET",
		url: APP_PATH + "/backstage/orders?pageNum=" + pageNum,
		success: function(pageInfo) {
			$(".table.table-hover").find("tbody").empty();
			var html = "";
			$.each(pageInfo.list, function(i, n) {
				html = `<tr>	
								<td><input type="checkbox"></td>
								<td>` + i + `</td>
								<td>` + n.orderNumber + `</td>
								<td>` + n.generateTime + `</td>`;
				switch(n.status) {
					case 1: html += `<td><span class="label label-warning my_delieve" data-orderid=" ` + n.id + ` " style="cursor: pointer;" title="点击发货">待发货</span></td>`; break;
					case 2: html += `<td><span class="label label-primary">已发货</span></td>`; break;
					case 3: html += `<td><span class="label label-success">已完成</span></td>`; break;
				}
				html += 	`<td>` + n.userName + `</td>
							<td>` + parseFloat(n.totalPrice).toFixed(2) + `</td>
							<td>
								<button type="button" class="my_order_detail btn btn-sm btn-primary" data-toggle="modal" data-target="#modal-order-detail" data-orderid="` + n.id + `">查看</button>
								<button type="button" class="my_remove_product btn btn-sm btn-danger" data-orderid="` + n.id + `">删除</button>
							</td>
						</tr>`;
				$(".table.table-hover").find("tbody").append(html);
			});
			/* 更新页码 */
			var navigatepageNums = '';
			if(pageInfo.hasPreviousPage) {
				navigatepageNums += `<li>
										<a href="#" data-pageNum="` + (parseInt(pageInfo.pageNum)-1) + `">上一页</a>
									</li>`;
			} else {
				navigatepageNums += `<li class="disabled">
										<a href="#" data-pageNum="` + (parseInt(pageInfo.pageNum)-1) + `">上一页</a>
									</li>`;
			}
			$.each(pageInfo.navigatepageNums, function(i, n) {
				if(pageInfo.pageNum == n) {
					navigatepageNums += `<li class="active">
											<a href="#" data-pageNum="` + n + `">` + n + `</a>
										</li>`;
				} else {
					navigatepageNums += `<li>
											<a href="#" data-pageNum="` + n + `">` + n + `</a>
										</li>`;
				}
			});
			if(pageInfo.hasNextPage) {
				navigatepageNums += `<li>
										<a href="#" data-pageNum="` + (parseInt(pageInfo.pageNum)+1) + `">下一页</a>
									</li>`;
			} else {
				navigatepageNums += `<li class="disabled">
										<a href="#" data-pageNum="` + (parseInt(pageInfo.pageNum)+1) + `">下一页</a>
									</li>`;
			}
			$(".pagination").empty();
			$(".pagination").append(navigatepageNums);
			/* 点击页码 */
			$(".pagination li").click(function() {
				if($(this).hasClass("disabled") || $(this).hasClass("active")) {
					return;
				}
				getOrdersByPageNum($(this).find("a").data("pagenum"));
			});
			/* 点击删除 */
			$(".my_remove_product.btn.btn-sm.btn-danger").click(function() {
				var orderIds = $(this).data("orderid");
				$.confirm({
					title: '删除提示',
				    content: '确认删除吗？',
				    confirmButton: '确认',
				    cancelButton: '取消',
				    confirmButtonClass: 'btn-warning',
				    cancelButtonClass: 'btn-success',
				    confirm: function() {
				    	$.ajax({
				    		method: "POST",
				    		url: APP_PATH + "/backstage/orders",
				    		data: "_method=delete&orderIds=" + orderIds,
				    		success: function(data) {
				    			if(data < 1) {
				    				$.scojs_message('未完成订单无法删除', $.scojs_message.TYPE_ERROR);
				    				return;
				    			}
				    			getOrdersByPageNum(1);
				    			$.scojs_message('删除商品成功', $.scojs_message.TYPE_OK);
				    		}
				    	});
				    }
				});
			});
			/* 订单明细 */
			$(".my_order_detail").click(function() {
				var orderId = $(this).data("orderid");
				$.ajax({
					method: "GET",
					url: APP_PATH + "/backstage/orderdetail?orderId=" + orderId,
					success: function(data) {
						var html = `<div class="row">
										<div class="col-xs-12">
											<h2 class="page-header">
												<i class="fa fa-globe"></i> 
												` + data.order.storeName + `
												<small class="pull-right">日期: ` + data.order.generateTime +`</small>
											</h2>
										</div>
									</div>`;
						html += `<div class="row"><div class="col-xs-12 table-responsive">
									<table class="table table-striped">
										<thead>
											<tr>
												<td>#</td>
												<td>商品</td>
												<td>参数</td>
												<td>单价</td>
												<td>数量</td>
												<td>小计</td>
											</tr>
										</thead>
									<tbody>`;
						$.each(data.orderDetail, function(i, n) {
							html += `<tr>
										<td>` + (i+1) + `</td>
										<td title="` + n.orderDetail.commotityName + `">` + n.orderDetail.commotityName.substring(0, 7) + `</td>
										<td>` + n.param + `</td>
										<td>￥` + n.orderDetail.price.toFixed(2) + `</td>
										<td>` + n.orderDetail.quantity + `</td>
										<td>￥` + (n.orderDetail.price * n.orderDetail.quantity).toFixed(2) + `</td>
									</tr>`;
						});
						html += `</tbody></table></div></div>`;
						html += `<div class="row invoice-info">
							<div class="col-sm-6 invoice-col">
								<address>
									<strong>收货地址信息</strong>
									<br> 
										姓名：` + data.order.receiveAddress.split("+")[2] + `
									<br>
										手机：` + data.order.receiveAddress.split("+")[3] + `
									<br>
										地址：` + data.order.receiveAddress.split("+")[0] + data.order.receiveAddress.split("+")[1] + `
								</address>
							</div>
							<div class="col-xs-6">
								<div class="table-responsive">
								<table class="table">
									<tbody>
										<tr>
											<th style="width: 50%">运费:</th>
											<td>￥0.00</td>
										</tr>
										<tr>
											<th>共计:</th>
											<td>￥` + data.totalPrice.toFixed(2) + `</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>`; 
						$(".invoice").empty();
						$(".invoice").append(html);
					}
				});
			});
			/* 发货 */
			$(".my_delieve").click(function() {
				var orderId = $(this).data("orderid");
				$.ajax({
					method: "POST",
					url: APP_PATH + "/backstage/delieve",
					data: "orderId=" + orderId,
					success: function(data) {
						if(data > 0) {
							getOrdersByPageNum($(".pagination .active a").data("pagenum"));
						}
					}
				});
			});
		}
	});
}

var websocket = null;
//判断当前浏览器是否支持WebSocket  
if ('WebSocket' in window) {
	websocket = new WebSocket(
			"ws://localhost:8080/online-shopping/sellerwebsocket");
} else {
	alert('当前浏览器 Not support websocket');
}

//接收到消息的回调方法
websocket.onmessage = function(eve) {
	/* 消息内容 */
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
	var flag = false;
	$.each($(".direct-chat-messages"), function(i, n) {
		if($(n).data("userid") == data.fromId) {
			flag = true;
			var html = `<div class="direct-chat-msg `+ direct_chat_msg +`">
							<div class="direct-chat-info clearfix">
								<span class="direct-chat-name `+ direct_chat_name +`">` + data.name + `</span>
								<span class="direct-chat-timestamp ` + direct_chat_timestamp + `">` + data.time + `</span>
							</div>
							<img class="direct-chat-img" src="` + data.image + `" alt="message user image">
							<div class="direct-chat-text" ` + text_align + ` >` + data.message + `</div>
						</div>`;
			$(n).append(html);
			if(!$(n).hasClass("hidden")) {
				var scrollHeight = $(n).prop("scrollHeight");
				$(n).animate({scrollTop: scrollHeight}, "slow");
			}
		}
	});
	if(!flag) {
		var html = `<div class="direct-chat-messages hidden" data-userid="` + data.fromId + `">
						<div class="direct-chat-msg `+ direct_chat_msg +`">
							<div class="direct-chat-info clearfix">
								<span class="direct-chat-name `+ direct_chat_name +`">` + data.name + `</span> 
								<span class="direct-chat-timestamp ` + direct_chat_timestamp + `">` + data.time + `</span>
							</div>
							<img class="direct-chat-img" src="` + data.image + `" alt="message user image">
							<div class="direct-chat-text" ` + text_align + `>` + data.message + `</div>
						</div>
					</div>`;
		$(".direct-chat-contacts").before(html);
	}
	
	/* 插入提示信息 */
	if(!map.isFromSelf) {
		/* 面板显示不提示 */
		if(!$("#chat_modal").hasClass("in")) {
			var number = $("#message_tip").text();
			if(number == null || number == "") {
				number = 0;
			}
			$("#message_tip").text(++number);
		}
		/* 提示体 */
		var message = data.message;
		if(data.message.length > 35) {
			message = data.message.substring(0, 35) + "...";
		}
		var tag = false;
		$.each($("#message_dropdown .message_unit"), function(i, n) {
			if($(n).data("userid") == data.fromId) {
				tag = true;
				$(n).find("small label").text(data.time);
				$(n).find("p").text(message);
				/* 面板显示不提示 */
				if(!$("#chat_modal").hasClass("in")) {
					var tip_quantity = $(n).find(".number_tip").text();
					if(tip_quantity == null || tip_quantity == "") {
						tip_quantity = 0
					}
					$(n).find(".number_tip").text(++tip_quantity);
				}
				return false;		
			}
		});
		if(!tag) {
			var drop_down_li = `<li class="message_unit" data-userid="` + data.fromId + `">
									<a>
										<div class="pull-left" style="position: relative;">
											<img src="`+ data.image +`"class="img-circle" alt="User Image">
											<span class="number_tip label label-danger" style="
												    position: absolute;
												    top: -2px;
												    right: 5px;
												    text-align: center;
												    font-size: 9px;
												    padding: 2px 3px;
												    line-height: .9;">1</span>
										</div>
										<h4>
											` + data.name + `
											<small>
												<i class="fa fa-clock-o"></i>
												<label>` + data.time + `</label>
											</small>
										</h4>
										<p>` + message + `</p>
									</a>
								</li>`;
			$("#message_dropdown .menu").append(drop_down_li);
			/* 打开聊天中心 */
			$(".message_unit").last().click(function() {
				var cur = this;
				$(".direct-chat-messages").addClass("hidden");
				$.each($(".direct-chat-messages"), function(i, n) {
					if($(n).data("userid") == $(cur).data("userid")) {
						$(n).removeClass("hidden");
						return false;
					}
				});
				$('#chat_modal').modal('show');
				$("#chat_send").data("userid", $(cur).data("userid"));
				/* 更改提示数量 */
				/* 确认是否已经查看 */
				if($(this).find(".number_tip").text() == null || $(this).find(".number_tip").text() == "") {
					return;
				}
				var tip_count = parseInt($(this).find(".number_tip").text());
				var tip_count_message = parseInt($("#message_tip").text());
				var cur_count = tip_count_message - tip_count;
				if(cur_count < 1) {
					cur_count = "";
				}
				$(this).find(".number_tip").text("");
				$("#message_tip").text(cur_count);
			});
		}
	}
		
}
//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。  
window.onbeforeunload = function() {
	websocket.close();
}

/* 改动chat的滚动条 */
$('#chat_modal').on('shown.bs.modal', function(e) {
	$.each($(".direct-chat-messages"), function(i, n) {
		if(!$(n).hasClass("hidden")) {
			var scrollHeight = $(n).prop("scrollHeight");
			$(n).animate({scrollTop: scrollHeight}, "slow");
			return false;
		}
	});
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
			toId: $("#chat_send").data("userid")
	}
	$("#chat_send").prev().val("");
	websocket.send(JSON.stringify(data));
}
