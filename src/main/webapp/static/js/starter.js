
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
							  	<td><input type="checkbox"></td>
					 		  	<td>` + i + `</td>
								<td title="` + n.title + `">` + name + `</td>
								<td><span class="` + cls + `" style="font-weight: bolder;">` + status + `</span></td>
								<td>￥` + n.price.toFixed(2) + `</td>
							  	<td>` + n.stock + `</td>
								<td>` + n.monthSale + `</td>
								<td>
									<button type="button" class="btn btn-sm btn-success">查看</button>
									<button type="button" class="btn btn-sm btn-warning">修改</button>
									<button type="button" class="btn btn-sm btn-danger">删除</button>
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
		}
	});	
}
