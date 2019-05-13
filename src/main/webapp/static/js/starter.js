
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
		url: APP_PATH + "/commoditycenter",
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
		url: APP_PATH + "/backstageproducts?pageNum=" + pageNum,
		success: function(pageInfo) {
			$(".table.table-condensed.table-bordered.table-striped.dataTable tbody").empty();
			var string = '';
			$.each(pageInfo.list, function(i, n) {
				var status = "下架";
				var cls = 'text-danger';
				if(n.status == 1) {
					status = "上架";
					var cls = 'text-success';
				}
				var name = n.title;
				if(n.title.length > 6) {
					name = n.title.substr(0, 15) + '...';
				}
				string += `<tr>
							  	<td><input data-productid="` + n.id + `" class="my_checkbox" type="checkbox"></td>
					 		  	<td>` + i + `</td>
								<td title="` + n.title + `">` + name + `</td>
								<td><span class="` + cls + `" style="font-weight: bolder;">` + status + `</span></td>
								<td>￥` + n.price.toFixed(2) + `</td>
							  	<td>` + n.stock + `</td>
								<td>` + n.monthSale + `</td>
								<td>
									<button type="button" data-toggle="modal" data-target="#modal-product-detail" class="btn btn-sm btn-success my_detail">查看</button>
									<button type="button" class="btn btn-sm btn-warning">修改</button>
									<button type="button" class="my_remove_product btn btn-sm btn-danger">删除</button>
								</td>
							</tr>`;
			});
			var table_info = '共' + pageInfo.total + '条数据，共' + pageInfo.pages + '页，当前第' + pageInfo.pageNum + '页';
			$(".table.table-condensed.table-bordered.table-striped.dataTable tbody").append(string);
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
					case 1: html += `<td><span class="label label-warning">待发货</span></td>`; break;
					case 2: html += `<td><span class="label label-primary">已发货</span></td>`; break;
					case 3: html += `<td><span class="label label-success">已完成</span></td>`; break;
				}
				html += 	`<td>` + n.userName + `</td>
							<td>` + parseFloat(n.totalPrice).toFixed(2) + `</td>
							<td>
								<button type="button" class="my_order_detail btn btn-sm btn-primary" data-toggle="modal" data-target="#modal-order-detail">查看</button>
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
				
			});
		}
	});
}


